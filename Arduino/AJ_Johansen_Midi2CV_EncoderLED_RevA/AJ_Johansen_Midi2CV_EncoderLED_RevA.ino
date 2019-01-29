/* Johansen Encoder test
 *  
 * Inspiration from
 * Kevin Darrah http://www.kevindarrah.com/?page_id=1348
 * https://www.youtube.com/watch?v=HQuLZHsGZdI
 * https://thewanderingengineer.com/2014/08/11/arduino-pin-change-interrupts/
 * and  
 * https://www.allaboutcircuits.com/projects/how-to-use-a-rotary-encoder-in-a-mcu-based-project/ 
 *  
 * 28/12-2018
*/
#include "midi.h";


/* =====================================================
======================================================*/  
void setupLEDData(){
   for (int i=0; i <= 3; i++){
     for (int j=0; j <= 3; j++){
      LEDData[i][j]=false;
     }
     encoder[i] = 0;
   }
}
/* =====================================================
======================================================*/  
void setup(){
  Serial.begin(38400);
  Serial.println();
  Serial.println("");
  Serial.println(__FILE__);
  Serial.print("Build date: ");
  Serial.println(__DATE__);
  delay(50);  
  setupLEDData();
  
/* =====================================================*/
  pinMode(SWpin, INPUT);
  pinMode(Apin, INPUT);
  pinMode(Bpin, INPUT);
  // Enable internal pull-up resistors
  digitalWrite(SWpin, HIGH);
  digitalWrite(Apin, HIGH);
  digitalWrite(Bpin, HIGH);

/* =====================================================*/
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LEDsel, OUTPUT);
  pinMode(LEDsel2, OUTPUT);
  
  updateLED();

/* =====================================================*/
  // 1. PCIE1: Pin Change Interrupt Enable 1
  PCICR =  0b00000010; 
  // Enable Pin Change Interrupt for A0, A1, A2
  PCMSK1 = 0b00000111; 

  delay(1000); //Safety before MIDI takes over
/* =====================================================
  MIDI.begin(MIDI_CHANNEL_OMNI); // Initialize the Midi Library.
// OMNI sets it to listen to all channels.. MIDI.begin(2) would set it
// to respond to channel 2 notes only.
  MIDI.setHandleNoteOn(MyHandleNoteOn); // This is important!! This command
  // tells the Midi Library which function I want called when a Note ON command
  // is received. in this case it's "MyHandleNoteOn".
  */
  setupMidi();
}//setup

/* =====================================================
======================================================*/  

void loop(){
  checkencoder();                  //Check encoder and update values

  updateLED();                     //LED on for active state    
  midiRead();
//  updateLEDValue(midi_channel, 0); //Update current midi chan for state 0
  updateLEDValue(MIDI_CH[0], 0); //Update current midi chan for state 0
  clearLED();                      //LED off (dim light)
  
}
/* =====================================================
==============Encoder change interrupt==================
======================================================*/  

ISR (PCINT1_vect) {
// If interrupt is triggered by the button
  boolean SW_val = digitalRead(SWpin);
  if (SW_val != SW_old) {
    SW_old = SW_val;
    button = true;}

// Else if interrupt is triggered by encoder signals
  else {
    
    // Read A and B signals
    boolean A_val = digitalRead(Apin);
    if (A_val != A_old) {
      A_old = A_val;
      if (A_val^B_old) {
        right = true;
      }
      else {
        left = true;
      }
    }
    else {
      boolean B_val = digitalRead(Bpin);
      B_old = B_val;
      if (A_val^B_val) {
        left = true;
      }
      else {
        right = true;
      }
    }
  }
}
/* =====================================================
========================================================
======================================================*/ 
void checkencoder(){
  if (left){
    left = false;
    if (encoder[state] != 0) encoder[state]--;
    if (state != 0) {
      MIDI_CH[state]=encoder[state] >> 2;
      updateLEDValue(MIDI_CH[state], state);
    }
  }
  if (right){
    right = false;
    if (encoder[state] < 0x3f) encoder[state]++;
    if (state != 0) {
      MIDI_CH[state]=encoder[state] >> 2;
      updateLEDValue(MIDI_CH[state], state);
    }
  }
  if (button){
    button = false;    
    buttoncnt++;
    buttoncnt = buttoncnt & B00000111;
    state = buttoncnt >> 1;
    }
}
/* =====================================================
========================================================
======================================================*/ 
void updateLEDValue(unsigned int nibble,unsigned int updstate)
{
  if (nibble >= 0x10) nibble = 0x0f;
  else (nibble = nibble & 0x0f);
  if (nibble & 0x01){
//    LED1Data = true;
    LEDData[updstate][0] = true;
  }
  else {
//    LED1Data = false;
    LEDData[updstate][0] = false;
  }
  if (nibble & 0x02){
//    LED2Data = true;
    LEDData[updstate][1] = true;
  }
  else {
//    LED2Data = false;
    LEDData[updstate][1] = false;
  }
  if (nibble & 0x04){
//    LED3Data = true;
    LEDData[updstate][2] = true;
  }
  else {
//    LED3Data = false;
    LEDData[updstate][2] = false;
  }
  if (nibble & 0x08){
//    LED4Data = true;
    LEDData[updstate][3] = true;
  }
  else {
//    LED4Data = false;
    LEDData[updstate][3] = false;
  }

}
/* =====================================================
========================================================
======================================================*/ 
void updateLED(){
  digitalWrite(LED1, LEDData[state][0]);
  digitalWrite(LED2, LEDData[state][1]);
  digitalWrite(LED3, LEDData[state][2]);
  digitalWrite(LED4, LEDData[state][3]);
  delay(1);
  digitalWrite(LEDsel, state & B00000001);
  digitalWrite(LEDsel2, state & B00000010);
}

void clearLED(){
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, LOW);
  digitalWrite(LED4, LOW);
  digitalWrite(LEDsel, LOW);
  digitalWrite(LEDsel2, LOW);
}
 
