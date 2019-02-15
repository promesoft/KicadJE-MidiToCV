#include <EEPROM.h>
/* -----------------------------------------------
 *  GLOBAL DEFINES
 * -----------------------------------------------
 */
//OVERRIDE PINS FOR LFO
#define PWM1 6 // Sets Pin PWM1 PWM-Output
#define PWM2 9 // Sets Pin PWM2 PWM-Output

//OVERRIDE PIN FOR SQUARE LFO
#define Square 13    //  Pin as LED for Tempo LED and as a square-LFO 
#define InvSquare 12 //  Pin as LED for Tempo LED and as a inverted square-LFO 

#define SWpin A0 //add 10nF to GND for debounce (not essential
#define Apin A1 //add 47nF/100nF to GND for debounce
#define Bpin A2 //add 47nF/100nF to GND for debounce
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

//#define RDY-BSY 12
//#define LDAC 13

/* -----------------------------------------------
 *  GLOBAL VAR
 * -----------------------------------------------
 */
boolean A_old=0, B_old=1, SW_old=0;
boolean left = false, right = false, button = false;

//Structure for keeping MIDI CH data for LED
boolean LEDData[4][4]; //(see state)

boolean LEDSelData = false, LEDSel2Data = false; 
unsigned int encoder[4], buttoncnt = 0;
unsigned int state = 0; 
//For MIDI In/Out/CV - State 00 = MidiDataInChannel - 01 = MIDI CH in select - 10 = MIDI CH OUT select - 11 = MIDI CH 2 CV select
//For MIDI In/CV/LFO - State 00 = MIDI CH 1 CV select - 01 = MIDI CH 2 CV select - 10 = LFO Waveform - 11 = LFO Speed

//byte midi_channel=4;
//Structure for keeping MIDI CH data for processing
//With LFO state 0 and 1 are reserved for CV MIDI channels
//With LFO state 2 and 3 are reserved for the LFO settings
byte MIDI_CH[4]; //(see state)

unsigned long lastwaveupdate = 0; // LFO millis timer between samples
unsigned int PWMshape1 = 0;
unsigned int PWMshape2 = 1;
unsigned int delayTime = 4; 
uint8_t tableStep = 0;
uint8_t PWMdata1 = 0;
uint8_t PWMdata2 = 0;

/* -----------------------------------------------
 *  PROTOTYPES
 * -----------------------------------------------
 */
void MyHandleNoteOn(byte channel, byte pitch, byte velocity);
void MyHandleNoteOff(byte channel, byte pitch, byte velocity);

/*void checkencoder();
//void updateLEDValue(unsigned int nibble,unsigned int updstate);
void updateLED();
void clearLED();
*/
