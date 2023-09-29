Table pcData;
int index = 0;
PImage img;

// Foot
int imageX;
int imageY;

int numImages = 10;
int imageSize = 80;
int imageSpacing = 10;
int totalWidth = numImages * (imageSize + imageSpacing) - imageSpacing;
int imageWidthX;

// BoxCover
int rectHeight = 80;
int rectWidth = 10;
int rectY = 900;
int fixedRightX = 950;
int maxBoxWidth = 900;

// Data
int peopleIn;
float maxPeopleIn = 48;
int dateColumnIndex;

int peopleInPercentage=0;
float boxX = 0;


void setup() {
  size(1000, 1000);
  background(58, 56, 56, 255);
  img = loadImage("Shoe.png");

  pcData = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2023-03-01T21%3A40&rToDate=2023-08-28T21%3A15&rFamily=people_sh&rSensor=CB11.PC02.14.Broadway&rSubSensor=CB11.02.Broadway.East+In", "csv");

  dateColumnIndex = 0;

  imageWidthX = (width - totalWidth) / 12;
}

void draw() {
  foot_f();
  boxCover();
  processingData();
}

void processingData() {
  if (index < pcData.getRowCount()) {
    TableRow row = pcData.getRow(index);
    String dateString = row.getString(dateColumnIndex);

    if (isDateInRange(dateString, "2023-03-01", "2023-08-28")) {
     peopleIn = row.getInt(1);
     //println(dateString + ": " + peopleIn);

      }
    }
    index++;
}

void foot_f() {
  for (int i = 0; i < numImages; i++) {
    imageX = imageSpacing * 5 + imageWidthX + i * (imageSize + imageSpacing);
    imageY = height - imageSize - imageSpacing * 5;
    image(img, imageX, imageY, imageSize, imageSize * 0.8);
  }
}

void boxCover() {
  if (index < pcData.getRowCount()) {
    TableRow row = pcData.getRow(index);
    
    boxX = map(row.getInt(1), 0, 48, 0, 900);
    println(boxX);
    fill(58, 56, 56, 255);
    noStroke();
    rect(fixedRightX, rectY - imageSpacing * 4, 0-(maxBoxWidth-boxX), rectHeight);
    
    
  }
  index++;
}

boolean isDateInRange(String date, String fromDate, String toDate) {
  return date.compareTo(fromDate) >= 0 && date.compareTo(toDate) <= 0;
}
