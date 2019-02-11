
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

#define PWM1 6 // Sets Pin PWM1 PWM-Output
#define PWM2 9 // Sets Pin PWM2 PWM-Output
#define Tempo 13 // And Pin 13 as LED for Tempo, you can also use this as a square-LFO 

unsigned int delayTime;                                     // Declaring some Variables. All are unsigned, since you don't really need negative going values for now. 
unsigned int shape; 
uint8_t tableStep; 

//const PROGMEM char SinTable[]=
//uint8_t waveTable[4][256] ={{0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45, 
char waveTable[4][256] ={{127,124,121,118,115,112,109,106,103,100,97,94,91,88,85,82,
                            80,76,73,70,68,65,62,60,57,54,52,49,47,45,42,40,
                            38,36,33,31,29,27,25,24,22,20,19,17,15,14,13,11,
                            10,9,8,7,6,5,4,4,3,2,2,1,1,1,1,1,
                            0,1,1,1,1,1,2,2,3,4,4,5,6,7,8,9,
                            10,11,13,14,15,17,19,20,22,24,25,27,29,31,33,36,
                            38,40,42,45,47,49,52,54,57,60,62,65,68,70,73,76,
                            80,82,85,88,91,94,97,100,103,106,109,112,115,118,121,124,
                            127,130,133,136,139,142,145,148,151,154,157,160,163,166,169,172,
                            175,178,181,184,186,189,192,194,197,200,202,205,207,209,212,214,
                            216,218,221,223,225,227,229,230,232,234,235,237,239,240,241,243,
                            244,245,246,247,248,249,250,250,251,252,252,253,253,253,253,253,
                            254,253,253,253,253,253,252,252,251,250,250,249,248,247,246,245,
                            244,243,241,240,239,237,235,234,232,230,229,227,225,223,221,218,
                            216,214,212,209,207,205,202,200,197,194,192,189,186,184,181,178,
                            175,172,169,166,163,160,157,154,151,148,145,142,139,136,133,130,}, 

  
                            {0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45, 
                            48,51,54,57,59,62,65,67,70,73,75,78,80,82,85,87, 
                            89,91,94,96,98,100,102,103,105,107,108,110,112,113,114,116,
                            117,118,119,120,121,122,123,123,124,125,125,126,126,126,126,126,
                            127,126,126,126,126,126,125,125,124,123,123,122,121,120,119,118,
                            117,116,114,113,112,110,108,107,105,103,102,100,98,96,94,91, 
                            89,87,85,82,80,78,75,73,70,67,65,62,59,57,54,51, 
                            48,45,42,39,36,33,30,27,24,21,18,15,12,9,6,3,
                            0,-3,-6,-9,-12,-15,-18,-21,-24,-27,-30,-33,-36,-39,-42,-45,- 
                            48,-51,-54,-57,-59,-62,-65,-67,-70,-73,-75,-78,-80,-82,-85,-87,- 
                            89,-91,-94,-96,-98,-100,-102,-103,-105,-107,-108,-110,-112,-113,-114,-116,-
                            117,-118,-119,-120,-121,-122,-123,-123,-124,-125,-125,-126,-126,-126,-126,-126,-
                            127,-126,-126,-126,-126,-126,-125,-125,-124,-123,-123,-122,-121,-120,-119,-118,-
                            117,-116,-114,-113,-112,-110,-108,-107,-105,-103,-102,-100,-98,-96,-94,-91,- 
                            89,-87,-85,-82,-80,-78,-75,-73,-70,-67,-65,-62,-59,-57,-54,-51,- 
                            48,-45,-42,-39,-36,-33,-30,-27,-24,-21,-18,-15,-12,-9,-6,-3,}, 
                              
                            {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,      
                             16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,    
                             32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,250,251,252,253,254,255,}, 
                             /* 
                            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,    
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,    
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,}, */
                              
                            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,      
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,    
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,}}; 
                          
void setup() {  
  
  for(int i=0; i<128; i++) {                                  // Precalculates a simple Tri-Wavetable in the first wavetable. Delete these 2 for-loops if you have filled up your wavetables 
    waveTable[1][i]=i*2; 
    } 
  for(int i=0; i<128; i++)  { 
    waveTable[1][i+128]=256-i*2; 
  } 
  waveTable[1][128]=255;
  
  pinMode(PWM1, OUTPUT);                                           // Sets Pin PWM1 PWM-Output 
  pinMode(PWM2, OUTPUT);                                           // Sets Pin PWM2 PWM-Output 
  pinMode(Tempo, OUTPUT);                                          // And Pin 13 as LED for Tempo, you can also use this as a square-LFO 
  Serial.begin(38400);
  
} 



void loop() { 

  if(tableStep<128) {                                           // Turn LED on for first half of the cycle, indicate Tempo 
    digitalWrite(13, HIGH); 
  } 
  else {                                                        // Turn it off for the second half 
    digitalWrite (13, LOW); 
  } 

  
  delayTime = (analogRead(A0)+1);                           // Reads the voltage at pin A0 and stores a 10-Bit value in "delayTime". (between 0 and 1023). Adds 1 so "delayTime" cant be zero. 
  delayTime = 10;
  Serial.print("A0 = ");
  Serial.print(delayTime-1);
  
  shape = (analogRead(A1) >> 8);                            // Reads the voltage at pin A1 and divides by 256 to get a Value between 0 and 3 to select the waveshape. 
  shape = (0);                            // Reads the voltage at pin A1 and divides by 256 to get a Value between 0 and 3 to select the waveshape. 

  
  analogWrite(PWM1, waveTable[shape][tableStep]);              // Writes the value at the current step in the table to Pin 5 as PWM-Signal.  
  analogWrite(PWM2, waveTable[1][tableStep]);              // Writes the value at the current step in the table to Pin 5 as PWM-Signal.  
  Serial.print("  Step = ");
  Serial.print(tableStep);
  Serial.print("  Value = ");
  Serial.println(waveTable[shape][tableStep]);
  delay(delayTime);                                         // Waits for the Amount of Milliseconds set by "delayTime". 
                                                            // Fastest setting will cycle at ~4hz, slowest setting is somewhat over 4 minutes. 
                                                            // Could use some finetuning. 

  tableStep++;                                                // Jumps to the next step. 
  
                                                              /* tableStep is an 8-Bit unsigned integer, 
                                                              so it can only store a value between 0 and 255 and will 
                                                              automatically "overflow" and go back to 0 when it gets 
                                                              bigger than 255, which is the lenght of the lookup table. 
                                                               */ 
}
