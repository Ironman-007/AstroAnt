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

nearby_devices = bluetooth.discover_devices(lookup_names=True)
print("found %d devices" % len(nearby_devices))

for addr, name in nearby_devices:
    print("  %s - %s" % (addr, name))
>>>>>>> 0c1f1d1b5374e65f93eebe6e9e240c64f5d1306d
