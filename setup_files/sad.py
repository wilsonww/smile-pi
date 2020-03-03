#!/usr/bin/env python3
# SMILE
# Author: Reuben Thiessen (reubenthiessen@gmail.com)
#
# Modification of the Arduino NeoPixel library strandtest example.

import time
from rpi_ws281x import PixelStrip, Color
import argparse

# LED strip configuration:
LED_COUNT      = 64      # Number of LED pixels.
LED_PIN        = 18      # GPIO pin connected to the pixels (18 uses PWM!).
LED_FREQ_HZ    = 800000  # LED signal frequency in hertz (usually 800khz)
LED_DMA        = 10      # DMA channel to use for generating signal (try 10)
LED_BRIGHTNESS = 24     # Set to 0 for darkest and 255 for brightest
LED_INVERT     = False   # True to invert the signal (when using NPN transistor level shift)
LED_CHANNEL    = 0       # set to '1' for GPIOs 13, 19, 41, 45 or 53

w = Color(150, 150, 150)
g = Color(0, 255, 0)
r = Color(255, , 0)
e = Color(0, 0, 0)

smile = [
    r,e,e,e,e,e,e,e,
    e,r,e,e,e,r,r,e,
    e,e,r,e,e,r,r,e,
    e,e,r,e,e,e,e,e,
    e,e,r,e,e,e,e,e,
    e,e,r,e,e,r,r,e,
    e,r,e,e,e,r,r,e,
    r,e,e,e,e,e,e,e
    ]

def showSmile(strip):
    for i in range(strip.numPixels()):
        strip.setPixelColor(i, smile[i])
        strip.show()

# Main program logic follows:
if __name__ == '__main__':
    # Process arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', '--clear', action='store_true', help='clear the display on exit')
    args = parser.parse_args()

    # Create NeoPixel object with appropriate configuration.
    strip = PixelStrip(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS, LED_CHANNEL)
    # Intialize the library (must be called once before other functions).
    strip.begin()

    print ('Press Ctrl-C to quit.')
    if not args.clear:
        print('Use "-c" argument to clear LEDs on exit')

    try:

#        while True:
	    showSmile(strip)

    except KeyboardInterrupt:
        if args.clear:
            colorWipe(strip, Color(0,0,0), 10)
