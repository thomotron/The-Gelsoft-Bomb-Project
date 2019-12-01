# Core module serial interface
The serial interface with the core module operates on 5v logic using AVR's built-in Universal Serial Interface in three-wire mode (SPI-compatible).
The core module acts as the master serial device, so it provides its own clock source.

Communication is started by first sending a single-byte command from the command table below:

| 7 (MSB) | 6 | 5 | 4 | 3 | 2 | 1 | 0 (LSB) | Command             |
| ------- | - | - | - | - | - | - | ------- | ------------------- |
| 0       | 0 | 0 | 0 | 0 | 0 | 0 | 0       | Do nothing          |
| 0       | 0 | 0 | 0 | 0 | 0 | 0 | 1       | Defuse              |
| 0       | 0 | 0 | 0 | 0 | 0 | 1 | 0       | Detonate            |
| 0       | 0 | 0 | 0 | 0 | 0 | 1 | 1       | Add strike          |
| 0       | 0 | 0 | 0 | 0 | 1 | 0 | 0       | Add time            |
| 0       | 0 | 0 | 0 | 0 | 1 | 0 | 1       | Remove time         |
| 1       | 0 | 0 | 0 | 0 | 1 | 1 | 0       | Get strikes         |
| 1       | 0 | 0 | 0 | 0 | 1 | 1 | 1       | Get time remaining  |
| 1       | 0 | 0 | 0 | 1 | 0 | 0 | 0       | Get low power state |

Data is sent as another byte following the command which may be either to or from the core module.
The most-significant bit denotes whether the data will be sent by the core module (Bit 7 = 1) or the puzzle module (Bit 7 = 0).

# Commands
## Defuse
**Command:** `0b00000001`  
**Payload:** No  
Defuses the device, stopping the timer. The device will not accept commands that modify its state while defused.

## Detonate
**Command:** `0b00000010`  
**Payload:** No  
Detonates the device, adding the maximum number of strikes and stopping the timer. The device will not accept commands that modify its state while detonated.

## Add strike
**Command:** `0b00000011`  
**Payload:** No  
Adds one strike. If the number of strikes exceeds the maximum, the device will detonate.

## Add time
**Command:** `0b00000100`  
**Payload:** Yes  
**Direction:** Puzzle-to-core  
Adds up to 5999 seconds to the timer. The timer will not exceed 5999 seconds.
Because this is larger than an 8-bit unsigned integer, the value may be split over two bytes with 7 bits of data each.
The most-significant bit of each byte is used as a flag to expect a following byte with additional data.
If the first byte given has the most-significant bit set to 1, the given bits are shifted left 7 places and another byte will be expected with the remaining 7 bits of data.
These bits are shifted MSB-first into a 16-bit unsigned integer.

**Payload format table:**

| 7 (MSB) | 6 | 5 | 4 | 3 | 2 | 1 | 0 (LSB) | Command                              |
| ------- | - | - | - | - | - | - | ------- | ------------------------------------ |
| 0       | a | b | c | d | e | f | g       | Add the given bits to the timer      |
| 1       | a | b | c | d | e | f | g       | Shift bits 0-6 and await 7 more      |

## Remove time
**Command:** `0b00000101`  
**Payload:** Yes  
**Direction:** Puzzle-to-core  
Removes up to 5999 seconds from the timer. The timer will not drop below 0 seconds.
Because this is larger than an 8-bit unsigned integer, the value may be split over two bytes with 7 bits of data each.
The most-significant bit of each byte is used as a flag to expect a following byte with additional data.
If the first byte given has the most-significant bit set to 1, the given bits are shifted left 7 places and another byte will be expected with the remaining 7 bits of data.
These bits are shifted MSB-first into a 16-bit unsigned integer.

**Payload format table:**

| 7 (MSB) | 6 | 5 | 4 | 3 | 2 | 1 | 0 (LSB) | Command                              |
| ------- | - | - | - | - | - | - | ------- | ------------------------------------ |
| 0       | a | b | c | d | e | f | g       | Remove the given bits from the timer |
| 1       | a | b | c | d | e | f | g       | Shift bits a-g and await 7 more      |

## Get strikes
**Command:** `0b10000110`  
**Payload:** Yes  
**Direction:** Core-to-puzzle  
Gets the current number of strikes as an 8-bit unsigned integer.

**Payload format table:**

| 7 (MSB) | 6 | 5 | 4 | 3 | 2 | 1 | 0 (LSB) | Command           |
| ------- | - | - | - | - | - | - | ------- | ----------------- |
| a       | b | c | d | e | f | g | h       | Number of strikes |

## Get time remaining
**Command:** `0b10000111`  
**Payload:** Yes  
**Direction:** Core-to-puzzle  
Gets the current amount of time remaining.
Because this is larger than an 8-bit unsigned integer, the value may be split over two bytes with 7 bits of data each.
The most-significant bit of each byte is used as a flag to expect a following byte with additional data.
If the first byte received has the most-significant bit set to 1, the remaining bits are shifted left 7 places and another byte should be expected with the remaining 7 bits of data.
These bits should be shifted MSB-first into a 16-bit unsigned integer.

**Payload format table:**

| 7 (MSB) | 6 | 5 | 4 | 3 | 2 | 1 | 0 (LSB) | Command                              |
| ------- | - | - | - | - | - | - | ------- | ------------------------------------ |
| 0       | a | b | c | d | e | f | g       | Remaining time                       |
| 1       | a | b | c | d | e | f | g       | Shift bits a-g and await 7 more      |

## Get low power state
**Command:** `0b10001000`  
**Payload:** Yes  
**Direction:** Core-to-puzzle  
Gets whether the device is in low-power mode. When the device is in low-power mode, all high-current

**Payload format table:**

| 7 (MSB) | 6 | 5 | 4 | 3 | 2 | 1 | 0 (LSB) | Command               |
| ------- | - | - | - | - | - | - | ------- | --------------------- |
| X       | X | X | X | X | X | X | 1       | Low power is enabled  |
| X       | X | X | X | X | X | X | 0       | Low power is disabled |
