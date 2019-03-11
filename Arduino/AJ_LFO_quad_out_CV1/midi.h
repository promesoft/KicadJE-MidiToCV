/*
 * Inspiration from
 * https://github.com/dlynch7/MIDI2CV/blob/master/arduino/midi2pitchvelcv.ino
 */
#include "globals.h"
#include <MIDI.h>  // Add Midi Library
MIDI_CREATE_DEFAULT_INSTANCE();

void setupMidi(){
  MIDI.begin(MIDI_CHANNEL_OMNI); // Initialize the Midi Library.
// OMNI sets it to listen to all channels.. MIDI.begin(2) would set it
// to respond to channel 2 notes only.
  MIDI.setHandleNoteOn(MyHandleNoteOn); // This is important!! This command
  // tells the Midi Library which function I want called when a Note ON command
  // is received. in this case it's "MyHandleNoteOn".
  MIDI.setHandleNoteOff(MyHandleNoteOff);
  dac.begin(MCP4725_ADDR);
//  dac.begin(MCP4725_ADDR2);
}

byte midiRead(){
  MIDI.read(); // Continually check what Midi Commands have been received. 
//  return midi_channel;
}

// Below is my function that will be called by the Midi Library
// when a MIDI NOTE ON message is received.
// It will be passed bytes for Channel, Pitch, and Velocity
void MyHandleNoteOn(byte channel, byte pitch, byte velocity) {
  int DACnum = 0;
  int LEDval = LOW;
  int GATEval = LOW;
  int gateVoltage = 0; // used for debugging
  int velVal = 0;
  
// From midi in out conversion -  MIDI_CH[0]=channel;
// From midi in out conversion -  if (MIDI_CH[0] == MIDI_CH[1]) MIDI.sendNoteOn(pitch, velocity, MIDI_CH[2]);
//  MIDI.sendNoteOn(pitch, velocity, MIDI_CH[2]);
  DACnum = pitches[pitch-36]; //-36 to transpose bottom of CASIO keyboard to C0.
  dac.setVoltage(DACnum, false);
  Serial.print("channel: ");
  Serial.print(channel);
  LEDval = HIGH;
  GATEval = HIGH;
  velVal = 2*velocity;
//  velVal = HIGH;
  if (velocity == 0) {//A NOTE ON message with a velocity = Zero is actualy a NOTE OFF
    LEDval = LOW;
    GATEval = LOW;
//    velVal = LOW;
    velVal = 0;
    //digitalWrite(LED,LOW);//Turn LED off
    //digitalWrite(GATE,LOW);//Turn LED off
    // DO SOMETHING FOR TRIGGER=OFF AND GATE=OFF;
  }
  digitalWrite(Gate1,GATEval);  //Turn GATE on
  digitalWrite(Gate2,GATEval);  //Turn GATE on
//  analogWrite(VEL,velVal); // Write velocity signal
//  digitalWrite(VEL,velVal); // Write velocity signal
//  gateVoltage = analogRead(GATECHK); // voltage of GATE signal, used for debugging
  //gateVoltage = digitalRead(3); // voltage of GATE signal, used for debugging
  
}

void MyHandleNoteOff(byte channel, byte pitch, byte velocity) {
  int DACnum = 0;
  int GATEval = LOW;
  int gateVoltage = 0; // used for debugging
  int velVal = 0;
  
  digitalWrite(Gate1,GATEval);  //Turn GATE on
  digitalWrite(Gate2,GATEval);  //Turn GATE on
// From midi in out conversion -  MIDI_CH[0]=channel;
// From midi in out conversion -  if (MIDI_CH[0] == MIDI_CH[1]) MIDI.sendNoteOff(pitch, velocity, MIDI_CH[2]);
}
