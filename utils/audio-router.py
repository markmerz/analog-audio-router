#!/usr/bin/python3

import glob
import serial
import sys
import termios

def main():
    try:
        if sys.argv[1] == "find":
            find()            
        else:
            device = sys.argv[1]
            command = " ".join(sys.argv[2:])
            command += "\n"        
            with serial.Serial(device, 115200, timeout=2, dsrdtr=False) as ser:
                ser.write(command.encode("latin-1"))
                res = ser.readline().decode("latin-1")
                print(res, end='')
        
    except IndexError:
        print("Usage: {} (find | device [commands to board])".format(sys.argv[0]), file=sys.stderr)
        sys.exit(1)

def find():
    for device_candidate in glob.glob("/dev/ttyUSB*"):
        with serial.Serial(device_candidate, 115200, timeout=2, dsrdtr=False) as ser:
            ser.write(b'\n')
            while True:
                res = ser.read(10)
                if len(res) == 0:
                    break
            ser.write(b'ping\n')
            res = ser.readline().decode("latin-1")
            if res == "Audio Switch OK\n":
                print(device_candidate)
                break
    else:
        print("Device was not found.", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
