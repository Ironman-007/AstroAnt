#!/usr/bin/env python
# work with MPU6050_kalman.ino

from PyQt5 import QtCore, QtWidgets, uic, QtGui
from pyqtgraph import PlotWidget
from PyQt5.QtWidgets import QApplication, QVBoxLayout
import pyqtgraph as pg
import numpy as np
import datetime
import serial
import sys
import os
import time
from time import sleep
from colorama import Fore, Back, Style
import csv
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.backends.backend_qt5agg import NavigationToolbar2QT as NavigationToolbar
import matplotlib.pyplot as plt
import random
import struct
import os.path

start_cmd    = 0x11
interval_cmd = 0x22
sleep_cmd    = 0x33
aq_cmd       = 0x44

data_len = 100

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def read_current_time():
    now = datetime.datetime.now(datetime.timezone.utc)
    current_time = now.strftime("%Z:%j/%H:%M:%S")
    return current_time

class MainWindow(QtWidgets.QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)
        self.setFixedSize(1497, 770)

        #Load the UI Page
        uic.loadUi('astroant.ui', self)

        self.serial_ports_list = []
        self.serial_speed = [115200]

        # Ref: https://stackoverflow.com/questions/59898215/break-an-infinit-loop-when-button-is-pressed
        self.timer = QtCore.QTimer(self, interval=5, timeout=self.read_port)
        self.ser=serial.Serial()

        self.scan_btn.clicked.connect(self.scan)
        self.clear_btn.clicked.connect(self.clear_plot)
        self.open_btn.clicked.connect(self.open_port)
        self.close_btn.clicked.connect(self.close)
        self.start_btn.clicked.connect(self.start_read_port)
        self.stop_btn.clicked.connect(self.stop_read_port)

        self.gyroz_data  = [0] * data_len
        self.enl_data    = [0] * data_len
        self.enr_data    = [0] * data_len
        self.sensor_data = [0] * data_len

        self.time_index = list(range(1, data_len+1))

        self.start_id = 0

        self.file = open("temp_no_valid_data", "wb")

        self.botnum = ""
        self.botnumh = 0
        self.address = 0x01

        self.connected_ant = 0

        for x in self.serial_speed:
            self.speed_comboBox.addItem(str(x))

    def scan(self):
        if os.name == 'nt':  # sys.platform == 'win32':
            from serial.tools.list_ports_windows import comports
        elif os.name == 'posix':
            from serial.tools.list_ports_posix import comports

        for info in comports(False):
            port, desc, hwid = info
        iterator = sorted(comports(False))

        self.serial_ports_list = [] # clear the list first
        for n, (port, desc, hwid) in enumerate(iterator, 1):
            self.serial_ports_list.append("{:20}\n".format(port))

        ports_num = len(self.serial_ports_list)

        self.serial_comboBox.clear() # clear the list first
        for x in self.serial_ports_list:
            self.serial_comboBox.addItem(x)

        self.start_id = 0

    def open_port(self):
        index = self.serial_comboBox.currentIndex()
        serial_ports_port = self.serial_ports_list[index][:-1] # delete the \n at the end
        index = self.speed_comboBox.currentIndex()
        self.ser = serial.Serial(serial_ports_port, self.serial_speed[index])

        current_time = read_current_time()
        print(current_time, self.ser.name + " Opened @ " + str(self.serial_speed[index]) + "bps")

    def start_read_port(self):
        self.sensor_data = [0] * data_len
        self.gyroz_data  = [0] * data_len
        self.enl_data    = [0] * data_len
        self.enr_data    = [0] * data_len

        self.sensor.clear()
        self.enl.clear()
        self.enr.clear()
        self.gyroz.clear()

        # cmd_id = self.start_id & 0xFF
        # start_cmd_chk = (cmd_id+0xAA+0xFF) & 0xFF

        # self.botnum = self.whichbot.text()
        # self.botnumh = int(self.botnum, 16)

        # if (self.botnumh == 0x01 or self.botnumh == 0x04 or self.botnumh == 0x0E):
        #     self.address = 0x01
        # elif (self.botnumh == 0x02 or self.botnumh == 0x05 or self.botnumh == 0x09):
        #     self.address = 0x02
        # elif (self.botnumh == 0x06):
        #     self.address = 0x03
        # elif (self.botnumh == 0x07):
        #     self.address = 0x04
        # elif (self.botnumh == 0x08 or self.botnumh == 0x0A):
        #     self.address = 0x05
        # else:
        #     print(bcolors.WARNING + "Err: wrong Astroant number" + bcolors.ENDC)
 
        self.timer.start() # Start monitoring the serialport

        # start_cmd = [0xAA, self.address]
        # start_cmd = bytearray(start_cmd)
        # print(start_cmd)
        # self.ser.write(start_cmd)

        # current_time = read_current_time()
        # print(Back.LIGHTYELLOW_EX, "   -> ", current_time,"Start cmd sent",Style.RESET_ALL)

        current_time = read_current_time()

        self.log.append(current_time + " :  Start monitoring the Serial Port...")

        self.msg_btn.setText("Start monitoring the Serial Port...")
        self.msg_btn.setStyleSheet("background-color : Green")

        # self.data_num = 0
        # self.timer.start() # Start the timer

        # self.start_id = self.start_id + 1

        # recordingname = self.botnum

        # while (os.path.isfile(recordingname)):
        #     recordingname = recordingname + "1"

        # self.file = open(recordingname, "wb")

    def send_cali_cmd(self):
        self.sensor_data = [0] * data_len
        self.enl_data = [0] * data_len

        self.enr.clear()
        self.enl.clear()

        self.botnumh = int(self.botnum, 16)

        self.speedi = self.speed.text()
        self.speedih = int(self.speedi).to_bytes(1,byteorder='big')

        if (self.botnumh == 0x01 or self.botnumh == 0x04 or self.botnumh == 0x0E):
            self.address = 0x01
        elif (self.botnumh == 0x02 or self.botnumh == 0x05 or self.botnumh == 0x09):
            self.address = 0x02
        elif (self.botnumh == 0x06):
            self.address = 0x03
        elif (self.botnumh == 0x07):
            self.address = 0x04
        elif (self.botnumh == 0x08 or self.botnumh == 0x0A):
            self.address = 0x05
        else:
            print(bcolors.WARNING + "Err: wrong Rovable number" + bcolors.ENDC)

        cali_cmd = [0x11, self.address, self.speedih[0]]
        cali_cmd = bytearray(cali_cmd)
        print(cali_cmd)
        self.ser.write(cali_cmd)

        current_time = read_current_time()
        print(Back.LIGHTRED_EX, "   -> ", current_time,"CALI cmd sent",Style.RESET_ALL)

        current_time = read_current_time()

        self.log.append(current_time + ": CALI Cmd sent." + str(cali_cmd) + "\n")

        self.data_num = 0
        self.timer.start() # Start the timer

        self.start_id = self.start_id + 1

    def stop_read_port(self):
        current_time = read_current_time()
        print(Back.LIGHTRED_EX, "   -> ", current_time,"Stop cmd sent",Style.RESET_ALL)

        current_time = read_current_time()

        self.log.append(current_time + " :  Stop monitoring the Serial Port.\n")
        self.msg_btn.setText("Stop monitoring the Serial Port...")
        self.msg_btn.setStyleSheet("background-color : Magenta")

        self.timer.stop() # Stop the timer

    def read_port(self):
        if (self.ser.inWaiting()):
            current_time = read_current_time()
            recv_data = self.ser.read(20)

            # print(recv_data)

            if (recv_data[0] == 0xEB and recv_data[1] == 0x90):
                if (recv_data[3] == 0xAA):   # start cmd ACK
                    whichant = str(int(recv_data[2]))
                    whichant = "Start cmd ACK " + whichant
                    self.msg_btn.setText(whichant)
                    self.msg_btn.setStyleSheet("background-color : Green")

                elif (recv_data[3] == 0xEE): # stop cmd ACK
                    whichant = str(int(recv_data[2]))
                    whichant = "Stop cmd ACK " + whichant
                    self.msg_btn.setText(whichant)
                    self.msg_btn.setStyleSheet("background-color : #ff33ff;")
                    self.file.close()

                elif (recv_data[3] == 0x11): # cali cmd ACK
                    whichant = str(int(recv_data[2]))
                    whichant = "Cali cmd ACK " + whichant
                    self.msg_btn.setText(whichant)
                    self.msg_btn.setStyleSheet("background-color : Blue")

                else:                        # Err cmd ACK
                    self.msg_btn.setText("Got ERR cmd ACK")
                    self.msg_btn.setStyleSheet("background-color : Red")

            elif (recv_data[0] == 0xEB and recv_data[1] == 0xAA):
                self.connected_ant = int(recv_data[2])
                self.ant_num.setText(str(self.connected_ant))

            elif (recv_data[0] == 0xEB and recv_data[1] == 0xFF):
                which_ant = str(recv_data[2])

                while (os.path.isfile(which_ant)):
                    which_ant = which_ant + "1"
                self.file = open(which_ant, "wb")

            elif (recv_data[0] == 0xEB and recv_data[1] == 0x11):
                pass

            # Data back
            elif (recv_data[0] == 0xEB and recv_data[1] == 0x9F):
                self.file.write(recv_data)

                ant_num = int(recv_data[2])
                frame_num = int(recv_data[3])

                which_ant = str(ant_num)

                self.info1.setText("#"+which_ant)
                self.info1.setStyleSheet("background-color : Blue")

                self.info2.setText(str(frame_num))
                self.info2.setStyleSheet("background-color : Green")

                self.info3.setStyleSheet("background-color : Red")

                if (recv_data[2] == 0x00):
                    self.info3.setText("Temperature")
                elif (recv_data[2] == 0x04):
                    self.info3.setText("Bridging")
                elif (recv_data[2] == 0x02):
                    self.info3.setText("Tracking")
                elif (recv_data[2] == 0x05):
                    self.info3.setText("Impedance")
                elif (recv_data[2] == 0x01):
                    self.info3.setText("knocking")

                enl_i = int(recv_data[8])
                enr_i = int(recv_data[9])

                gyroz_i = recv_data[4:8]

                gyroz_d = struct.unpack('f', gyroz_i)[0]

                steer = recv_data[11:15]
                steer_d = struct.unpack('i', steer)[0]
                # print(steer_d)

                self.ant_num_label.setText(str(ant_num))

                self.frame_num0.setText(str(frame_num))

                self.bat1.setValue(recv_data[10])
                self.batper1_2.setText("{:.0f}".format(recv_data[10]))

                if (recv_data[2] == 0x00): # data from Temp_ant
                    objtemperature = recv_data[11:15]
                    objtemperature_f = struct.unpack('f', objtemperature)[0]

                    self.sensing.setText("Temperature(K)")

                    # sensor data plot
                    self.sensor_label.setText("{:.1f}".format(objtemperature_f))
                    self.sensor_data.pop(0)
                    self.sensor_data.append(objtemperature_f)
                    self.sensor.clear()
                    self.sensor.plot(self.time_index, self.sensor_data, pen=pg.mkPen('w', width=2))

                if (recv_data[2] == 0x05): # data from Temp_ant
                    print(recv_data)
                    impedance = recv_data[11:19]
                    impedance_f = struct.unpack('d', impedance)[0] # double datatype
                    impedance_f = float(impedance_f)

                    self.sensing.setText("Absolute Impedance")

                    # sensor data plot
                    self.sensor_label.setText("{:.1f}".format(impedance_f))
                    self.sensor_data.pop(0)
                    self.sensor_data.append(impedance_f)
                    self.sensor.clear()
                    self.sensor.plot(self.time_index, self.sensor_data, pen=pg.mkPen('w', width=2))

                # orientation data plot
                self.gyroz_label.setText(str(gyroz_d))
                self.gyroz_data.pop(0)
                self.gyroz_data.append(gyroz_d)
                self.gyroz.clear()
                self.gyroz.plot(self.time_index, self.gyroz_data, pen=pg.mkPen('w', width=2))

                # enl data plot
                self.enl_label.setText(str(enl_i))
                self.enl_data.pop(0)
                self.enl_data.append(enl_i)
                self.enl.clear()
                self.enl.plot(self.time_index, self.enl_data, pen=pg.mkPen('w', width=2))

                # enr data plot
                self.enr_label.setText(str(enr_i))
                self.enr_data.pop(0)
                self.enr_data.append(enr_i)
                self.enr.clear()
                self.enr.plot(self.time_index, self.enr_data, pen=pg.mkPen('w', width=2))

    def clear_plot(self):
        self.sensor.clear()
        self.enl.clear()
        self.enr.clear()
        self.gyroz.clear()

        self.gyroz_data  = [0] * data_len
        self.enl_data    = [0] * data_len
        self.enr_data    = [0] * data_len
        self.sensor_data = [0] * data_len

# driver code 
if __name__ == '__main__': 
    # creating apyqt5 application 
    app = QApplication(sys.argv) 
    # creating a window object 
    main = MainWindow() 
    # showing the window 
    main.show()
    # loop 
    sys.exit(app.exec_()) 
