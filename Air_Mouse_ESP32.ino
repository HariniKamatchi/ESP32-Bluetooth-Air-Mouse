#include <Wire.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>

Adafruit_MPU6050 mpu;
int ldrPin = 34;  // ADC pin for LDR

// Calibration values
int ldrThreshold = 1500;  // adjust after Serial Monitor test

void setup() {
  Serial.begin(115200);
  Wire.begin();

  if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
  }

  Serial.println("Calibrate your LDR: open and cover it to see values...");
}

void loop() {
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);

  int ldrValue = analogRead(ldrPin);

  // Decide click based on LDR
  int click = (ldrValue < ldrThreshold) ? 1 : 0;

  // Scale gyro values (cursor speed)
  float gx = g.gyro.x * 2;
  float gy = g.gyro.y * 2;

  // Send to Processing: gx,gy,click,ldr
  Serial.print(gx, 2);
  Serial.print(",");
  Serial.print(gy, 2);
  Serial.print(",");
  Serial.print(click);
  Serial.print(",");
  Serial.println(ldrValue);

  delay(50);
}
