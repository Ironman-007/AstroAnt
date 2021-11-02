<<<<<<< HEAD
import asyncio
from bleak import BleakScanner
from bleak.backends.device import BLEDevice
from bleak.backends.scanner import AdvertisementData
import logging
=======
<<<<<<< HEAD
import asyncio
from bleak import discover

async def main():
    devices = await discover()
    for d in devices:
        print(d)

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
