import asyncio
<<<<<<< HEAD
from bleak import BleakClient
=======
from bleak import BleakScanner
from bleak.backends.device import BLEDevice
from bleak.backends.scanner import AdvertisementData
import logging
=======
<<<<<<< HEAD
import asyncio
from bleak import discover
>>>>>>> 64619c7d5fbadd13c51bc33014621f4b002541c2

address = "24:71:89:cc:09:05"
MODEL_NBR_UUID = "00002a24-0000-1000-8000-00805f9b34fb"

<<<<<<< HEAD
async def main(address):
    async with BleakClient(address) as client:
        model_number = await client.read_gatt_char(MODEL_NBR_UUID)
        print("Model Number: {0}".format("".join(map(chr, model_number))))

asyncio.run(main(address))
=======
asyncio.run(main())
=======
# simple inquiry example
import bluetooth
>>>>>>> 83e1f4c296bbca12b6fa6f3a730c9f0c4230d064

logging.basicConfig()

<<<<<<< HEAD
def simple_callback(device: BLEDevice, advertisement_data: AdvertisementData):
    print(device.address, "RSSI:", device.rssi, advertisement_data)

async def main():
    scanner = BleakScanner()
    scanner.register_detection_callback(simple_callback)

    while True:
        await scanner.start()
        await asyncio.sleep(5.0)
        await scanner.stop()

if __name__ == "__main__":
    asyncio.run(main())
=======
for addr, name in nearby_devices:
    print("  %s - %s" % (addr, name))
>>>>>>> 0c1f1d1b5374e65f93eebe6e9e240c64f5d1306d
>>>>>>> 83e1f4c296bbca12b6fa6f3a730c9f0c4230d064
>>>>>>> 64619c7d5fbadd13c51bc33014621f4b002541c2
