#include <string.h>
#include <stdio.h>

//These define's must be placed at the beginning before #include "TimerInterrupt.h"
#define TIMER_INTERRUPT_DEBUG      0

#define USE_TIMER_1     true
#define USE_TIMER_2     false
#define USE_TIMER_3     false
#define USE_TIMER_4     false
#define USE_TIMER_5     false

#include "TimerInterrupt.h"

#define NUM_BOARDS 4 // nr of connected boards
int latchPin = 3; // r clock
int clockPin = 2; // serial clock
int dataPin = 4;  // serial data
int outputEnable = 7; // 595 output enable pins are pulled high (disabled) in hardware. We need to pull it down (enable) when ready.

#define COMMAND_LINE_BUFFER_LEN 64

// i messed up component placement on board
// it amazing what you can fix in software later..
const uint8_t chips[6][4] = {{1, 1, 1, 1}, {0, 0, 0, 0}, {0, 0, 0, 0}, {2, 2, 2, 2}, {2, 2, 2, 2}, {1, 1, 1, 1}};
const uint8_t values[6][4] = {{8, 4, 2, 1}, {128, 64, 32, 16}, {8, 4, 2, 1}, {128, 64, 32, 16}, {8, 4, 2, 1}, {128, 64, 32, 16}};

uint8_t state[NUM_BOARDS][3];
char inData[COMMAND_LINE_BUFFER_LEN];
uint8_t inDataIndex = 0;

uint16_t pingCounter = 0;
uint8_t powerState = 0;
uint8_t inTransition = 0;

void myShiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, byte val) {
  for (int i = 0; i < 8; i++) {
    if (bitOrder == LSBFIRST) {
      digitalWrite(dataPin, !!(val & (1 << i)));
      delayMicroseconds(50);
    } else {
      digitalWrite(dataPin, !!(val & (1 << (7 - i))));
      delayMicroseconds(50);
    }

    digitalWrite(clockPin, HIGH);
    delayMicroseconds(50);
    digitalWrite(clockPin, LOW);
    delayMicroseconds(50);
  }
}



void writeState() {
  for (int c = 0; c < NUM_BOARDS; c++) {
    for (int d = 0; d < 3; d++) {
      myShiftOut(dataPin, clockPin, LSBFIRST, state[c][d]);
    }
  }
  digitalWrite(latchPin, HIGH);
  delayMicroseconds(50);
  digitalWrite(latchPin, LOW);
  inTransition = 0;
}

void clearState() {
  for (int c = 0; c < NUM_BOARDS; c++) {
    state[c][0] = state[c][1] = state[c][2] = 0;
  }
}

inline uint8_t countSetBits(uint8_t n) { // Brian Kernighan’s Algorithm
  uint8_t count = 0;
  while (n) {
    n &= (n - 1);
    count++;
  }
  return count;
}

int testState() {
  unsigned int bitcount = 0;
  for (int c = 0; c < NUM_BOARDS; c++) {
    for (int d = 0; d < 3; d++) {
      bitcount += countSetBits(state[c][d]);
    }
  }
  if (bitcount > 16) {
    return 0;
  }
  return 1;
}

void handleInput() {
  if (strcmp(inData, "clear") == 0) {
    inTransition = 1;
    clearState();
    Serial.write("OK\n");
  } else if (strcmp(inData, "commit") == 0) {
    if (powerState) {
      if (testState()) {
        writeState();
        Serial.write("OK\n");
      } else {
        Serial.write("ERROR: not commiting too many connections.\n"); // because power module from ebay might expode!
      }
    } else {
      Serial.write("ERROR: not commiting, daughter boards are not powered.\n");
    }
  } else if (strncmp(inData, "sethard ", 8) == 0) {
    int board, chip, value;
    int res = sscanf(inData, "sethard %i %i %i", &board, &chip, &value);
    if (res == 3) {
      inTransition = 1;
      state[board][chip] = value;
      Serial.write("OK\n");
    } else {
      Serial.write("ERROR: sethard parse error: ");
      Serial.print(res);
      Serial.write("\n");
    }
  } else if (strncmp(inData, "connect ", 8) == 0) {
    int connector, bus;
    int res = sscanf(inData, "connect %i bus %i", &connector, &bus);
    if (res == 2) {
      if (connector < 1 || connector > (NUM_BOARDS * 6)) {
        Serial.write("ERROR: connect parse error: connector nr. out of bounds.\n");
      } else if (bus < 1 || bus > 4) {
        Serial.write("ERROR: connect parse error: bus nr. out of bounds.\n");
      } else {
        inTransition = 1;
        connector = connector - 1;
        bus = bus - 1;
        uint8_t board = connector / 6;
        connector = connector % 6;
        uint8_t chip = chips[connector][bus];
        uint8_t value = values[connector][bus];
        state[board][chip] = state[board][chip] | value;
        Serial.write("OK\n");
      }
    } else {
      Serial.write("ERROR: connect parse error: ");
      Serial.print(res);
      Serial.write("\n");
    }
  } else if (strncmp(inData, "disconnect ", 11) == 0) {
    int connector, bus;
    int res = sscanf(inData, "disconnect %i bus %i", &connector, &bus);
    if (res == 2) {
      if (connector < 1 || connector > (NUM_BOARDS * 6)) {
        Serial.write("ERROR: disconnect parse error: connector nr. out of bounds.\n");
      } else if (bus < 1 || bus > 4) {
        Serial.write("ERROR: disconnect parse error: bus nr. out of bounds.\n");
      } else {
        inTransition = 1;
        connector = connector - 1;
        bus = bus - 1;
        uint8_t board = connector / 6;
        connector = connector % 6;
        uint8_t chip = chips[connector][bus];
        uint8_t value = values[connector][bus];
        state[board][chip] = state[board][chip] & (~value);
        Serial.write("OK\n");
      }
    } else {
      Serial.write("ERROR: disconnect parse error: ");
      Serial.print(res);
      Serial.write("\n");
    }
  } else if (strcmp(inData, "ping") == 0) {
    Serial.write("Audio Switch OK\n");
  } else if (strcmp(inData, "test_count") == 0) {
    Serial.write("Test counter: ");
    Serial.print(pingCounter);
    Serial.write("\n");
    pingCounter++;
  } else if (strcmp(inData, "power") == 0) {
    int power = analogRead(A0);
    Serial.write("Power reading: ");
    Serial.print(power);
    Serial.write("\n");
  } else {
    Serial.write("ERROR: Unknown command: ");
    Serial.write(inData);
    Serial.write("\n");
  }
}

void setup() {
  pinMode(latchPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);

  pinMode(outputEnable, INPUT); // to Z-mode. Hardware has pullups.

  pinMode(LED_BUILTIN, OUTPUT); // led is on when running on external power

  clearState();

  ITimer1.init();
  ITimer1.attachInterruptInterval(1000, TimerHandler1); // timer fires once in a second

  Serial.begin(115200);
  while (!Serial) {}
  //  Serial.print(NUM_BOARDS);
  //  Serial.write(" boards ready\n");
}

void checkPower() {
  int power = analogRead(A0);

#define VOLTAGE10V 740

  if (powerState) { // when incoming power is less then 10V then we set 595 output enable pins high disabling them
    if (power < VOLTAGE10V) {
      // digitalWrite(outputEnable, HIGH);
      pinMode(outputEnable, INPUT); // Go to Z-mode. Hardware pulls line up.
      clearState();
      powerState = 0;
      digitalWrite(LED_BUILTIN, LOW);
    }
  } else {
    if (power >= VOLTAGE10V) {
      clearState();
      writeState();
      powerState = 1;
      pinMode(outputEnable, OUTPUT);
      digitalWrite(outputEnable, LOW); // pull line low.
      digitalWrite(LED_BUILTIN, HIGH);
    }
  }


}

void TimerHandler1(void) {
  checkPower();
  // we rewrite our state regulary to work around intermittent errors because electrical noise. It is a hardware design error somewhere.
  if (inTransition == 0 && powerState == 1) {
    writeState();
  }
}

void loop() {
  if (Serial.available() > 0) {
    if (inDataIndex < (COMMAND_LINE_BUFFER_LEN)) {
      inData[inDataIndex] = Serial.read();
      if (inData[inDataIndex] == '\n') {
        inData[inDataIndex] = '\0';
        handleInput();
        inDataIndex = 0;
      } else {
        inDataIndex++;
      }
    } else {
      inDataIndex = 0;
      Serial.write("ERROR: Buffer full, input rejected.\n");
    }
  }

}
