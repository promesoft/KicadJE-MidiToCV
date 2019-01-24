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
#define SWpin A0
#define Apin A1 //add 47nF to GND for debounce
#define Bpin A2 //add 47nF to GND for debounce
#define CV3in A3
#define SDA A4
#define SCL A5
#define CV6in A6
#define CV7in A7

#define LED1 2
#define LED2 3
#define LED3 4
#define LED4 5
#define LEDsel 10
#define LEDsel2 11

#define Gate1 6
#define Gate2 7
#define Gate3 8
#define Gate4 9

#define RDY-BSY 12
#define LDAC 13

boolean A_old=0, B_old=1, SW_old=0;
boolean left = false, right = false, button = false;
boolean LED1Data = false, LED2Data = false, LED3Data = false, LED4Data = false, LEDSelData = false, LEDSel2Data = false; 
unsigned int encoder = 0, buttoncnt = 0;
/* =====================================================
======================================================*/  
void setup(){
  pinMode(SWpin, INPUT);
  pinMode(Apin, INPUT);
  pinMode(Bpin, INPUT);
  // Enable internal pull-up resistors
  digitalWrite(SWpin, HIGH);
  digitalWrite(Apin, HIGH);
  digitalWrite(Bpin, HIGH);

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
  digitalWrite(LEDsel, HIGH);
  digitalWrite(LEDsel2, HIGH);

  // 1. PCIE1: Pin Change Interrupt Enable 1
  PCICR =  0b00000010; 
  // Enable Pin Change Interrupt for A0, A1, A2
  PCMSK1 = 0b00000111; 
  
  Serial.begin(115200);
  Serial.println(F("Encoder test"));
}//setup

/* =====================================================
======================================================*/  

void loop(){
//  if (left||right||button){

  if (left){
    left = false;
    if (encoder != 0) encoder--;
    updateLED(encoder >> 2);
  }
  if (right){
    right = false;
    if (encoder < 0x3f) encoder++;
    updateLED(encoder >> 2);
  }
  if (button){
    button = false;    
    LEDSel2Data = SW_old;
    LEDSelData = !SW_old;
    buttoncnt++;
  }
  digitalWrite(LED1, LED1Data);
  digitalWrite(LED2, LED2Data);
  digitalWrite(LED3, LED3Data);
  digitalWrite(LED4, LED4Data);
  delay(1);
  digitalWrite(LEDsel, LEDSelData);
  digitalWrite(LEDsel2, LEDSel2Data);
  delay(1);

  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, LOW);
  digitalWrite(LED4, LOW);
  digitalWrite(LEDsel, LOW);
  digitalWrite(LEDsel2, LOW);
  delay(2);
}
/* =====================================================
========================================================
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
void updateLED(unsigned int nibble)
{
  if (nibble >= 0x10) nibble = 0x0f;
  else (nibble = nibble & 0x0f);
  if (nibble & 0x01){
    LED1Data = true;
  }
  else {
    LED1Data = false;
  }
  if (nibble & 0x02){
    LED2Data = true;
  }
  else {
    LED2Data = false;
  }
  if (nibble & 0x04){
    LED3Data = true;
  }
  else {
    LED3Data = false;
  }
  if (nibble & 0x08){
    LED4Data = true;
  }
  else {
    LED4Data = false;
  }

}
