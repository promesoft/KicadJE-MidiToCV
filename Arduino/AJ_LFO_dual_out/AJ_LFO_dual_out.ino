
/* LFO Suggestion
 * https://www.muffwiggler.com/forum/viewtopic.php?t=169706&sid=4b0d7d4af599d0df3e7b6fc29ece21b8 
 *  
 * Pin A0 = Speed 
 * Pin A1 = Shape 
 * 
 * Pin 5 = PWM Out 
 * Pin 13 = LED / Square Out 
 */ 

#define PWM1 6 // Sets Pin PWM1 PWM-Output
#define PWM2 9 // Sets Pin PWM2 PWM-Output
#define Tempo 13 // And Pin 13 as LED for Tempo, you can also use this as a square-LFO 

unsigned int delayTime;                                     // Declaring some Variables. All are unsigned, since you don't really need negative going values for now. 
unsigned int shape; 
uint8_t tableStep; 

uint8_t waveTable[4][256] ={{0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45, 
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

  
                            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,    // These are your Wavetables. fill them with Values for your desired Waveshape. 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,    // You could alco precalculate the Waveshape in Setup, see below 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,}, 
                              
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
  analogWrite(PWM2, waveTable[shape][tableStep]);              // Writes the value at the current step in the table to Pin 5 as PWM-Signal.  
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
