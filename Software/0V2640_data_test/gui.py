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
        self.setFixedSize(850, 150)

        #Load the UI Page
        uic.loadUi('astroant.ui', self)

        self.serial_ports_list = []
        self.serial_speed = [921600]

        # Ref: https://stackoverflow.com/questions/59898215/break-an-infinit-loop-when-button-is-pressed
        self.timer = QtCore.QTimer(self, interval=5, timeout=self.read_port)
        self.ser=serial.Serial()

        self.scan_btn.clicked.connect(self.scan)
        self.open_btn.clicked.connect(self.open_port)
        self.close_btn.clicked.connect(self.close)
        self.start_btn.clicked.connect(self.start_read_port)
        self.stop_btn.clicked.connect(self.stop_read_port)

        self.start_id = 0

        self.file = open("temp_no_valid_data", "wb")

        self.current_data = 0x00
        self.last_data = 0x00

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
        start_cmd_b = bytearray([0x20])
        print(start_cmd_b)
        self.ser.write(start_cmd_b)

        self.timer.start() # Start monitoring the serialport
        current_time = read_current_time()
        print(current_time + " :  Start monitoring the Serial Port...")
        print("Start monitoring the Serial Port...")

    def stop_read_port(self):
        stop_cmd_b = bytearray([0x21])
        print(stop_cmd_b)
        self.ser.write(stop_cmd_b)

        current_time = read_current_time()
        print(Back.LIGHTRED_EX, "   -> ", current_time,"Stop cmd sent",Style.RESET_ALL)

        current_time = read_current_time()

        print(current_time + " :  Stop monitoring the Serial Port.\n")
        print("Stop monitoring the Serial Port...")

        self.timer.stop() # Stop the timer

    def read_port(self):
        if (self.ser.inWaiting()):
            recv_data = self.ser.read()
            if ((recv_data[0] == 0xD9 and self.last_data == 0xFF) or (recv_data[0] == 0xD8 and self.last_data == 0xFF)):
                print("==============")
                # print(self.start_id, ' -> ', self.last_data, recv_data)
            self.start_id = self.start_id + 1
            self.last_data = recv_data[0]
            print(self.start_id, ' -> ', recv_data)

    def clear_plot(self):
        self.sensor.clear()
        self.enl.clear()
        self.enr.clear()
        self.gyroz.clear()

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
