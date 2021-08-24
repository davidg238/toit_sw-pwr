### Background

A simple switch monitor, to test power consumption.
Switches are monitored via `wait_for`, so the board should be sleeping mostly.

## Boards
[ESP32-DEVKITC-32E](https://www.digikey.com/en/products/detail/espressif-systems/ESP32-DEVKITC-32E/12091810)  

## Connections

* Pull hi switch, on IO5 (normally pulled low by 12k resistor)
* LED, sourced on IO15 (limited by 470 ohm resistor)

## References
[A Guide to Debouncing, or, How to Debounce a Contact in Two Easy Pages, by Jack Ganssle](http://www.ganssle.com/debouncing.htm)
[Ultimate Guide to Switch Debounce (Part 4)](https://www.eejournal.com/article/ultimate-guide-to-switch-debounce-part-4)
[Battery voltage supported on Adafruit Huzzah32 ...](https://learn.adafruit.com/adafruit-huzzah32-esp32-feather/pinouts)
