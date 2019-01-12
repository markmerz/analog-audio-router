#include <string.h>
#include <stdio.h>

#define NUM_BOARDS 4 // nr of connected boards
int latchPin = 3; // r clock
int clockPin = 2; // serial clock
int dataPin = 4;  // serial data

#define COMMAND_LINE_BUFFER_LEN 64

const uint8_t chips[6][4] = {{1, 1, 1, 1}, {0, 0, 0, 0}, {0, 0, 0, 0}, {2, 2, 2, 2}, {2, 2, 2, 2}, {1, 1, 1, 1}};
const uint8_t values[6][4] = {{8, 4, 2, 1}, {128, 64, 32, 16}, {8, 4, 2, 1}, {128, 64, 32, 16}, {8, 4, 2, 1}, {128, 64, 32, 16}};

uint8_t state[NUM_BOARDS][3];
char inData[COMMAND_LINE_BUFFER_LEN];
uint8_t inDataIndex = 0;

uint16_t pingCounter = 0;

void writeState() {
  digitalWrite(latchPin, LOW);
  for (int c = 0; c < NUM_BOARDS; c++) {
    for (int d = 0; d < 3; d++) {
      shiftOut(dataPin, clockPin, LSBFIRST, state[c][d]);
    }
  }
  digitalWrite(latchPin, HIGH);
}

void clearState() {
  for (int c = 0; c < NUM_BOARDS; c++) {
    state[c][0] = state[c][1] = state[c][2] = 0;
  }
}

void handleInput() {
  if (strcmp(inData, "clear") == 0) {
    clearState();
    Serial.write("OK\n");
  } else if (strcmp(inData, "commit") == 0) {
    writeState();
    Serial.write("OK\n");
  } else if (strncmp(inData, "sethard ", 8) == 0) {
    int board, chip, value;
    int res = sscanf(inData, "sethard %i %i %i", &board, &chip, &value);
    if (res == 3) {
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

  clearState();
  writeState();

  Serial.begin(115200);
  while (!Serial) {}
//  Serial.print(NUM_BOARDS);
//  Serial.write(" boards ready\n");
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

