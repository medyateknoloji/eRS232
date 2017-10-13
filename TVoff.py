import time 
import serial
import os

ser = serial.Serial(
              
    port='/dev/ttyUSB0',
    baudrate = 19200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=1
    )

ser.setDTR(1)

number = 0

for number in range(7):
   number = number + 1
   input = 'BEEF03060019D3020000600000' 
   ser.write(input.decode("hex"))
   tmp = ser.readline()
   time.sleep(1)
   if tmp.encode("hex") == "1d0100" or tmp.encode("hex") == "1d0000" or tmp.encode("hex") == "1d0200":
	if tmp.encode("hex") == "1d0000":
	   print "cihaz zaten kapali."
	   break	
	if tmp.encode("hex") == "1d0200":
	   print "sogutmada."
	   continue 	
	if tmp.encode("hex") == "1d0100":
	   print "suan acik, kapatiliyor..."
	   input = 'BEEF0306002AD3010000600000'
  	   ser.write(input.decode("hex"))
	   break
   print "Hata"
