import controlP5.*;

ControlP5 cp5;
Table xy;
int y = 0;
int index = 0;
String x = "";

int myColorBackground = color(0,0,0);

RadioButton r1;
Table table;
Table table1;
Table table2;

void setup() {
  size(700,400);
  table = new Table();
  table1 = new Table();
  table2 = new Table();
  cp5 = new ControlP5(this);
// change data
  xy = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2023-03-01T21%3A17%3A57&rToDate=2023-08-23T21%3A16%3A59&rFamily=people_sh&rSensor=CB11.PC02.14.Broadway&rSubSensor=CB11.02.Broadway.East+In", "csv");
  r1 = cp5.addRadioButton("radioButton")
         .setPosition(100,180)
         .setSize(40,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(3)
         .setSpacingColumn(50)
         .addItem("1 week",1)
         .addItem("1 month",2)
         .addItem("3 months",3)
         
         ;
     
     for(Toggle t:r1.getItems()) {
       t.getCaptionLabel().setColorBackground(color(255,80));
       t.getCaptionLabel().getStyle().moveMargin(-7,0,0,-3);
       t.getCaptionLabel().getStyle().movePadding(7,0,0,3);
       t.getCaptionLabel().getStyle().backgroundWidth = 45;
       t.getCaptionLabel().getStyle().backgroundHeight = 13;
     }
     
     for (int index = 0; index < xy.getRowCount(); index++) {
    // read the 2nd column (the 1), and read the row based on index which increments each draw()
    x = xy.getString(index, 0);
    y = xy.getInt(index, 1); // index is the row, 1 is the column with the data.
    println(x+"," + y);

  }
   
}


  
void draw() {
  background(myColorBackground);
}


void keyPressed() {
  switch(key) {
    case('0'): r1.deactivateAll(); break;
    case('1'): r1.activate(0); break;
    case('2'): r1.activate(1); break;
    case('3'): r1.activate(2); break;
  }
  
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(r1)) {
    print("got an event from "+theEvent.getName()+"\t");
    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
  
   
    println("\t "+theEvent.getValue());

    if (theEvent.getGroup().getValue() == 1.0){
    print("filtering data for 1 week \n");
    for (int day = 16; day < 24; day++){
    for (TableRow  row: xy.matchRows("2023-08-"+day+" .*", 0)){
      //2023-08-"+day+" 12:55:00", 0)) {
      print(row.getString(0) + ": " + row.getString(1) + "\n");
      TableRow newRow = table.addRow();
      newRow.setString(row.getString(0), row.getString(1));
 // probably point to function with parameter of table
    }
    }
  //  }
    
  }
  
  if (theEvent.getGroup().getValue() == 2.0){
    print("filtering data for 1 month \n");
    String month = "08";
    for (TableRow  row: xy.matchRows("2023-"+month+".*", 0)) {
      print(row.getString(0) + ": " + row.getString(1) + "\n");
      TableRow newRow1 = table1.addRow();
      newRow1.setString(row.getString(0), row.getString(1));
   // probably point to function with parameter of table1
    }
    
  //  }
    
  }
  
  
  
  
  if (theEvent.getGroup().getValue() == 3.0){
    print("filtering data for 3 months \n");
    for (int month = 6; month < 9; month++){
    for (TableRow  row: xy.matchRows("2023-0"+month+".*", 0)) {
      print(row.getString(0) + ": " + row.getString(1) + "\n");
      TableRow newRow2 = table2.addRow();
      newRow2.setString(row.getString(0), row.getString(1));
      // probably point to function with parameter of table2
    }
    }
  //  }
    
  }
  
  
  
  
  
  
  
  
    
  }
}

void radioButton(int a) {
  println("a radio Button event: "+a);
}

// if table(1wk), table1(1mnth), if table2(3mnths)
