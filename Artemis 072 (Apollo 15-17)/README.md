# Artemis 072 - Apollo 15, 16, and 17 EMPs

## Dock Ang - Docked IMU Align

### Description

Calculates the docked LM IMU angles from the current CM IMU angles and an inputted roll cal angle.

### N26:

10001<br>
00605<br>
14007

### Procedures

- Verify N26 has been loaded successfully
- Enter V30E
- F 06 05 - Load roll cal angle
- PRO
- F 06 22 - Copy calculated LM IMU angles
- PRO to exit