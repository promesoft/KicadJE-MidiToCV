# Kicad-MidiToCV
Midi to CV in Eurorack or as standalone

## Base Construction
Arduino Nano based Controller and MIDI decoder.

### MIDI In
MIDI In through a PC814 (or optional PC817) Optocoupler and into the RX pin on the Arduino

### Midi Out
Optional expansion

### Gate
Gate pins from Arduino

## CV Out
I2C Dac with 2 options
### I2C Dac - Option 1 2 Single channel DAC
2x MCP4725 DAC 
### I2C Dac - Option 2 - one 4 channel DAC
1x MCP4728

![](Kicad-Midi2CV-3D2.png)
