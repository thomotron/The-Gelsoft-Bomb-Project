// This file is written to correspond with the
// following pinout:
//
//                    ATTiny24A
//                   .----v----.
//              Vcc -| 1    14 |- GND
// B0   MAX7219 DIN -| 2    13 |- CORRECT IN    A0
// B1   MAX7219 CLK -| 3    12 |- STRIKE IN     A1
// B3     ISP RESET -| 4    11 |- DISARM OUT    A2
// B2  MAX7219 LOAD -| 5    10 |- LOWPOWER OUT  A3
// A7        BUZZER -| 6     9 |- ISP SCK       A4
// A6      ISP MOSI -| 7     8 |- ISP MISO      A5
//                   *---------*

#include <avr/interrupt.h>

bool running = true;
volatile bool solved = false;
volatile int strikes = 0;
const int maxStrikes = 3;

volatile unsigned long onStrikeLast = 0;
volatile unsigned long onCorrectLast = 0;
const unsigned int bounceDelay = 200;

void setup() {

    pinMode(2, INPUT_PULLUP);
    pinMode(3, INPUT_PULLUP);
    enableInterrupts();
    Serial.begin(9600);
}

void loop() {
    if (!running) return;

    // Disable interrupts if solved or dead
    if (solved || strikes == maxStrikes)
    {
        disableInterrupts();
        running = false;
    }

    // Wait half a second
    delay(500);

    // Wipe the last reading off the face of the planet
    for (int i = 0; i < 50; i++) Serial.println();

    // Print the current status
    Serial.println(solved ? "Solved" : "Not solved");
    Serial.print(strikes);
    Serial.print(" strikes (");
    Serial.print(strikes >= maxStrikes ? "dead" : "not dead");
    Serial.println(")");
}

void onCorrect()
{
    if (millis() < onCorrectLast + bounceDelay)
    {
        return; // Do nothing, must be a bounce
    }

    onCorrectLast = millis();

    //Serial.println("Got a correct");
    solved = true;
}

void onStrike()
{
    if (millis() < onStrikeLast + bounceDelay)
    {
        return; // Do nothing, must be a bounce
    }

    onStrikeLast = millis();

    //Serial.println("Got a strike");
    strikes = ++strikes > maxStrikes ? maxStrikes : strikes; // Cap strikes at maxStrikes
}

void enableInterrupts()
{
    attachInterrupt(digitalPinToInterrupt(2), onCorrect, FALLING);
    attachInterrupt(digitalPinToInterrupt(3), onStrike, FALLING);
}

void disableInterrupts()
{
    detachInterrupt(digitalPinToInterrupt(2));
    detachInterrupt(digitalPinToInterrupt(3));
}
