import processing.serial.*;

Serial myPort;
float xPos = 250;
float yPos = 250;
int clickState = 0;
int ldrVal = 0;

void setup() {
  size(500, 500);
  background(255);
  myPort = new Serial(this, "COM3", 115200);
  myPort.bufferUntil('\n');
}

void draw() {
  background(255);

  // Grid
  stroke(200);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  // Cursor
  noStroke();
  if (clickState == 1) {
    fill(0, 200, 0);
  } else {
    fill(0, 0, 200);
  }
  ellipse(xPos, yPos, 30, 30);

  // Data text
  fill(0);
  textSize(16);
  text("X: " + nf(xPos - width/2, 1, 2), 20, 30);
  text("Y: " + nf(yPos - height/2, 1, 2), 20, 55);
  text("Click: " + clickState, 20, 80);
  text("LDR: " + ldrVal, 20, 105);
}

void serialEvent(Serial myPort) {
  String data = myPort.readStringUntil('\n');
  if (data != null) {
    data = trim(data);
    String[] values = split(data, ',');
    if (values.length == 4) {
      float gx = float(values[0]);
      float gy = float(values[1]);
      clickState = int(values[2]);
      ldrVal = int(values[3]);

      xPos += gx;
      yPos += gy;

      xPos = constrain(xPos, 0, width);
      yPos = constrain(yPos, 0, height);
    }
  }
}
