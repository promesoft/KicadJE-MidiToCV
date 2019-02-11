
/* LFO Suggestion
 * https://www.muffwiggler.com/forum/viewtopic.php?t=169706&sid=4b0d7d4af599d0df3e7b6fc29ece21b8 
 *  
 * Pin A0 = Speed 
 * Pin A1 = Shape 
 * 
 * Pin 5 = PWM Out 
 * Pin 13 = LED / Square Out 
 */ 

//#include "wavetable.h";
#include "wavetable.h";
//#include "globals.h";
#include "midi.h";


/* =====================================================
==============INIT DATA STRUCTURES======================
======================================================*/  
void setupDataStruct(){
   for (int i=0; i <= 3; i++){
     for (int j=0; j <= 3; j++){
      LEDData[i][j]=false;
     }
     MIDI_CH[i] = EEPROM.read(i);
     if (MIDI_CH[i] > 15) MIDI_CH[i] = 0;
      updateLEDValue(MIDI_CH[i], i);
      encoder[i] = MIDI_CH[i] << 2;
   }
}
/* =====================================================
==============SETUP=====================================
======================================================*/  
void setup() {  
  Serial.begin(38400);
  Serial.println();
  Serial.println("");
  Serial.println(__FILE__);
  Serial.print("Build date: ");
  Serial.println(__DATE__);
  delay(50);  
  setupDataStruct();
  
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
  
  digitalWrite(LED1, HIGH);
  digitalWrite(LED2, HIGH);
  digitalWrite(LED3, HIGH);
  digitalWrite(LED4, HIGH);
  delay(300);

  updateLED();

/* =========Saw wave for table 1 =======================*/
  for(int i=0; i<256; i++) {                                  // Precalculates a simple Tri-Wavetable in the first wavetable. Delete these 2 for-loops if you have filled up your wavetables 
    waveTable[1][i]=i; 
    }   
/* =========Triangle wave for table 2===================*/
  for(int i=0; i<128; i++) {                                  // Precalculates a simple Tri-Wavetable in the first wavetable. Delete these 2 for-loops if you have filled up your wavetables 
    waveTable[2][i]=i*2; 
    } 
  for(int i=0; i<128; i++)  { 
    waveTable[2][i+128]=256-i*2; 
  } 
  waveTable[2][128]=255;
/* =========Step 8 wave table 3=========================*/
  for(int i=0; i<256; i++) {                                  // Precalculates a simple Tri-Wavetable in the first wavetable. Delete these 2 for-loops if you have filled up your wavetables 
    waveTable[3][i]=(i&0b11100000); 
    } 
/* =========Setup LFO Output pins=======================*/
  pinMode(PWM1, OUTPUT);                                           // Sets Pin PWM1 PWM-Output 
  pinMode(PWM2, OUTPUT);                                           // Sets Pin PWM2 PWM-Output 
  pinMode(Square, OUTPUT);                                          // Pin as LED for Tempo and as a square-LFO 
  pinMode(InvSquare, OUTPUT);                                          // Pin as LED for Tempo and as a inverted square-LFO 
  
/* =====================================================*/
  // 1. PCIE1: Pin Change Interrupt Enable 1
  PCICR =  0b00000010; 
  // Enable Pin Change Interrupt for A0, A1, A2
  PCMSK1 = 0b00000111; 

//Safety before MIDI takes over so the arduino can be reprogrammed
  delay(1000); 
/* =====================================================*/
  setupMidi();
} 

/* =====================================================
==============MAIN LOOP=================================
======================================================*/  
void loop() { 
  checkencoder();                  //Check encoder and update values

  updateLED();                     //LED on for active state    
  midiRead();
  updateLEDValue(MIDI_CH[0], 0); //Update current midi chan for state 0
  clearLED();                      //LED off (dim light)

  updatewave();
}

/* =====================================================
==============Update LED's based on LED Values==========
======================================================*/ 
void updatewave(){

if ( millis() >= (lastwaveupdate+delayTime) ){
  lastwaveupdate = millis();
  tableStep++;                                                // Jumps to the next step. 
                                                              /* tableStep is an 8-Bit unsigned integer, 
                                                              so it can only store a value between 0 and 255 and will 
                                                              automatically "overflow" and go back to 0 when it gets 
                                                              bigger than 255, which is the lenght of the lookup table. 
                                                               */ 

/* ===========Update Square Output======================*/
  if(tableStep<128) {                                           // Turn LED on for first half of the cycle, indicate Tempo 
    digitalWrite(Square, HIGH); 
    digitalWrite(InvSquare, LOW); 
  } 
  else {                                                        // Turn it off for the second half 
    digitalWrite(Square, LOW); 
    digitalWrite(InvSquare, HIGH); 
  } 
/* ===========Update PWM1 Output========================*/
  analogWrite(PWM1, waveTable[PWMshape1][tableStep]);              // Writes the value at the current step in the table to Pin 5 as PWM-Signal.  


/* ===========Update PWM2 Output========================*/
  analogWrite(PWM2, waveTable[PWMshape2][tableStep]);              // Writes the value at the current step in the table to Pin 5 as PWM-Signal.  
  
}

  
/*  delayTime = (analogRead(A0)+1);                           // Reads the voltage at pin A0 and stores a 10-Bit value in "delayTime". (between 0 and 1023). Adds 1 so "delayTime" cant be zero. 
  delayTime = 10;
  Serial.print("A0 = ");
  Serial.print(delayTime-1);
  
  shape = (analogRead(A1) >> 8);                            // Reads the voltage at pin A1 and divides by 256 to get a Value between 0 and 3 to select the waveshape. 
  shape = (2);                            //  
  shape2 = (3);                            //  
*/
  
/*  Serial.print("  Step = ");
  Serial.print(tableStep);
  Serial.print("  Value = ");
  Serial.println(waveTable[shape2][tableStep]);
  delay(delayTime);                                         // Waits for the Amount of Milliseconds set by "delayTime". 
                                                            // Fastest setting will cycle at ~4hz, slowest setting is somewhat over 4 minutes. 
                                                            // Could use some finetuning. 
*/
}


/* =====================================================
==============Check encoder interrupt===================
======================================================*/ 
void checkencoder(){
  if (left){
    left = false;
    if (encoder[state] != 0) encoder[state]--;
    if (state < 4) {
      if(((MIDI_CH[state]=encoder[state] >> 2) == 0) && state == 2) MIDI_CH[state]=16;
      updateLEDValue(MIDI_CH[state], state);
      EEPROM.write(state, MIDI_CH[state]);
    }
  }
  if (right){
    right = false;
    if (encoder[state] < 0x3f) encoder[state]++;
    if (state < 4) {
      MIDI_CH[state]=encoder[state] >> 2;
      updateLEDValue(MIDI_CH[state], state);
      EEPROM.write(state, MIDI_CH[state]);
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
==============Update LED Values based on input==========
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
==============Update LED's based on LED Values==========
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
