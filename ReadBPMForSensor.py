import serial        
import time

serialArduino = serial.Serial("COM3",9600,timeout=1.0)
time.sleep(1)

bpm = []

while True:   

     cad =serialArduino.readline().decode('ascii').strip()     
     if cad:         
        bpm.append(cad)
        print(cad)       