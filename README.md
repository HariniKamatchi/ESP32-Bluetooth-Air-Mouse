# ESP32-Based Bluetooth Air Mouse Using MPU6050

A gesture-controlled wireless air mouse developed using an ESP32 microcontroller and MPU6050 motion sensor. The project explores an alternative approach to traditional computer input devices by translating hand movements into cursor control.

## 1. Project Overview

The Air Mouse is an embedded system designed to enable computer interaction through hand gestures rather than a conventional physical mouse.

The system uses the MPU6050, which integrates a 3-axis accelerometer and a 3-axis gyroscope, to capture hand movement and orientation. The ESP32 processes the sensor readings and supports wireless communication with a host computer.

An LDR-based input mechanism is also incorporated to detect gesture-based clicking.

The project combines motion sensing, embedded programming, wireless communication and custom PCB development to demonstrate gesture-based human-computer interaction.

## 2. Key Features

- Gesture-based cursor movement using MPU6050.
- ESP32-based embedded processing.
- 3-axis accelerometer and gyroscope data acquisition.
- I2C communication between ESP32 and MPU6050.
- LDR-based click detection.
- Serial data transmission for host-side visualization.
- Custom PCB design using KiCad.
- Compact and portable hardware architecture.

## 3. Hardware Components

| Component | Function |
|---|---|
| ESP32 Development Board | Main microcontroller |
| MPU6050 | Motion and orientation sensing |
| LDR | Gesture-based click detection |
| 56 kΩ Resistor | LDR voltage divider |
| Li-ion Battery | Portable power supply |
| TP4056 Module | Battery charging |
| Perfboard | Initial hardware implementation |
| Custom PCB | Hardware integration |

## 4. Software and Tools

- Arduino IDE
- Embedded C/C++
- Processing IDE
- KiCad PCB Design Suite
- Adafruit MPU6050 Library
- Adafruit Unified Sensor Library
- Wire Library
- Processing Serial Library

## 5. System Architecture

The system consists of three primary stages:

**1. Motion Sensing**

The MPU6050 captures hand movements and orientation using its accelerometer and gyroscope.

**2. Data Acquisition and Processing**

The ESP32 reads the sensor values through the I2C interface. Gyroscope readings are scaled to generate cursor movement values. The LDR input is used to determine the click state.

**3. Host-Side Visualization**

The ESP32 transmits the processed values through serial communication. A Processing application receives the data and visualizes cursor movement, click status and LDR readings.

### Data Communication Format

The ESP32 sends the following comma-separated data:

`gx,gy,click,ldrValue`

The data is transmitted at 115200 baud with a 50 ms sampling delay.

## 6. PCB Design

A custom Printed Circuit Board (PCB) was designed using **KiCad** to organize and integrate the electronic components.

The PCB design files are included in the repository.

The PCB development work includes:

- Circuit schematic design.
- PCB layout and routing.
- Component placement.
- Track routing and connectivity.
- PCB design visualization.

The repository includes the updated circular PCB layout. The earlier rectangular PCB design is documented in the original project report.

## 7. Repository Structure

```text
ESP32-Bluetooth-Air-Mouse/
│
├── Firmware/
│   └── Air_Mouse_ESP32.ino
│
├── Processing/
│   └── Air_Mouse_Processing.pde
│
├── PCB_Design/
│   ├── airmouse_embedded.kicad_pro
│   ├── airmouse_embedded.kicad_pcb
│   ├── airmouse_embedded.kicad_sch
│   ├── airmouse_embedded.net
│   └── README.md
│
├── Hardware/
│
├── Images/
│
├── Documentation/
│
├── README.md
└── LICENSE
```

## 8. Getting Started

### ESP32 Firmware Setup

1. Install Arduino IDE.
2. Install ESP32 board support.
3. Install the Adafruit MPU6050 and Adafruit Unified Sensor libraries.
4. Open `Firmware/Air_Mouse_ESP32.ino`.
5. Connect the MPU6050 and LDR to the ESP32.
6. Select the appropriate ESP32 board and COM port.
7. Upload the firmware.

### Processing Setup

1. Install Processing IDE.
2. Open `Processing/Air_Mouse_Processing.pde`.
3. Change `COM3` to the serial port assigned to your ESP32, if required.
4. Ensure the Arduino Serial Monitor is closed.
5. Run the Processing sketch.

The Processing application displays a simulated cursor inside a 500 × 500 window, along with the click state and LDR readings.

### KiCad Project Setup

1. Install KiCad.
2. Navigate to the `PCB_Design/` directory.
3. Open `airmouse_embedded.kicad_pro`.
4. View or modify the circuit schematic and PCB layout.

## 9. Applications

- Wireless presentation control.
- Gesture-based computer interaction.
- Smart device and media control.
- Interactive gaming interfaces.
- Virtual reality interaction.
- Assistive human-computer interaction.

## 10. Future Improvements

- Improved motion calibration and filtering.
- Advanced gesture recognition.
- Reduced sensor drift and improved cursor sensitivity.
- Rechargeable battery integration.
- Low-power operation.
- Ergonomic enclosure development.
- Expanded gesture-based controls.


**Institution:** Vellore Institute of Technology, Chennai  
**Department:** Electronics and Communication Engineering  
**Course:** BECE403E – Embedded System Design  
**Project Year:** 2025

## 11. License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

*Exploring the intersection of embedded systems, motion sensing, wireless communication and human-computer interaction.*
