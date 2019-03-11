#include <EEPROM.h>
#include <Adafruit_MCP4725.h>
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

#define SWpin A0 //add 100nF to GND for debounce 
#define Apin A1 //add 100nF to GND for debounce
#define Bpin A2 //add 100nF to GND for debounce
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

#define Gate1 8
#define Gate2 9
/*#define Gate1 6
#define Gate2 7
#define Gate3 8
#define Gate4 9*/

//#define RDY-BSY 12
//#define LDAC 13

#define MCP4725_ADDR 0x60   
#define MCP4725_ADDR2 0x61   
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
byte MIDI_CH[4]; //(see state above)

unsigned long lastwaveupdate = 0; // LFO millis timer between samples
//unsigned int PWMshape = 0;
unsigned int delayTime = 4; 
uint8_t tableStep = 0;
uint8_t PWMdata = 0;

/* -----------------------------------------------
 *  MIDI2CV VAR
 * -----------------------------------------------
 */
Adafruit_MCP4725 dac;
 
int pitches[61] = 
{
     0,   70,  142,  214,  286,  358,  419,  500, 
   571,  642,  713,  786,  860,  933, 1006, 1080, 
  1153, 1226, 1299, 1372, 1445, 1518, 1591, 1664, 
  1737, 1808, 1880, 1952, 2024, 2096, 2168, 2240,
  2310, 2380, 2452, 2525, 2600, 2670, 2740, 2810,
  2880, 2950, 3020, 3090, 3160, 3230, 3300, 3370,
  3440, 3510, 3580, 3650, 3720, 3790, 3860, 3930,
  4000, 4070
};

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
