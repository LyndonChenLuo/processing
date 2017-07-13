// in this project, I intend to transfer the csv to a 2D Arrays using split

// libraries
import processing.pdf.*;

// global variables
PShape baseMap;
String csv[];
// declare an 2D Arrays
String myData[][];
PFont myFont;

// setup
void setup(){
  size(1800, 900);
  // prohibit loop
  noLoop();
  myFont = createFont("Helvetica", 12);
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("MeteorStrikes.csv");
  myData = new String[csv.length][6];
  //println(csv);
  //println(csv[23]);
  for(int i = 0; i < csv.length; i++){
    myData[i] = csv[i].split(",");
  }
  //println(myData[23][4]);
}

// draw
void draw(){
  beginRecord(PDF, "meteorStrokes.pdf");
  
  shape(baseMap, 0, 0, width, height);
  noStroke();
  //fill(random(0, 255), 0, 0, 50);
  //rect(100, 100, 200, 100);

  //ellipse(500, 500, 100, 100);
  
  for(int i = 0; i < myData.length; i++){
    fill(255, 0, 0, 50);
    //textMode(MODEL);
    noStroke();
    //println(myData[i][3] + " / " + myData[i][4]);
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    // Attention: not -90, 90, but 90, -90
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    float markerSize = 0.05 * sqrt(float(myData[i][2])) / PI;
    //println(graphLong + " / " + graphLat);
    ellipse(graphLong, graphLat, markerSize, markerSize);
    
    if(i < 10){
      fill(0);
      textFont(myFont);
      text(myData[i][0], graphLong + markerSize + 5, graphLat + 4);
      noFill();
      stroke(0);
      line(graphLong + markerSize/2, graphLat, graphLong + markerSize, graphLat);
    }
  }
  
  save("meteorStrikes.png");
  endRecord();
  println("PDF Saved.");
}