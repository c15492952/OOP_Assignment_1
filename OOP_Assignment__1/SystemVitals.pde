class Vital
{
  String information;
  float value;
  color colour;

  Vital(String line)
  {
    String[] parts = line.split("\t");
    information = parts[0];
    value = Float.parseFloat(parts[1]);
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  Vital()
  {
  }

}

void loadVitals()
  {
    for(TableRow row : table.rows())
    {
      Vital v = new Vital();
      
      v.information = row.getString("information");
      v.value = row.getFloat("value");
      
      vitals.add(v);
      
      println(v.value);
    }
  }
  
  void barchart()
  {
    fill(0);
    strokeWeight(1);
    stroke(255);
    rect(70, height - 240, 420, 220);
    
    int barwidth = 50;
    int gap = 120;
    int start = 140;
    
    fill(150);
    rect(70, height - 240, 420, 40);
    textSize(25);
    fill(0);
    text("System Vitals", 77, height - 207);
    textSize(25);
    fill(255);
    text("System Vitals", 80, height - 210);
    
    textSize(15);
    text("Engine 1",75,height -130);
    
    textSize(15);
    text("Oxygen",210,height - 130);
    
    textSize(15);
    text("Engine 2",340,height -130);
    
    
    Vital v = new Vital();
    for(int i = 0; i < vitals.size(); i++)
    {
      v = vitals.get(i);
      fill(random(255), random(255), random(255));
      noStroke();
      rect(start, height - 20, barwidth, - v.value );
      start += gap;
    }
  }
  
  void trendGraph()
  {
    fill(0);
    strokeWeight(1);
    stroke(255);
    rect(70, height - 240, 420, 220);
    
    float x = 140;
    float y = height - 20;
    int gap = 120;
    
    fill(150);
    rect(70, height - 240, 420, 40);
    textSize(25);
    fill(0);
    text("System Vitals", 77, height - 207);
    textSize(25);
    fill(255);
    text("System Vitals", 80, height - 210);
    
    textSize(15);
    text("Engine 1",75,height -130);
    
    textSize(15);
    text("Oxygen",230,height -75);
    
    textSize(15);
    text("Engine 2",320,height -130);
    
    Vital v2 = new Vital();
    Vital v = new Vital();
    for(int i = 0; i < vitals.size() - 1; i++)
    {
      v = vitals.get(i);
      v2 = vitals.get(i+1);
      strokeWeight(4);
      stroke(random(255), random(255), random(255));
      line(x, y -v.value, x + gap, y -v2.value);
      noFill();
      strokeWeight(2);
      stroke(5,255,50);
      ellipse(x,y - v.value,15,15);
      x += gap;
    }
    stroke(random(255), random(255), random(255));
    line(70, y, 140, height - (20 + 98));
    stroke(random(255), random(255), random(255));
    line(x,height - (20 + 86),490,y);
    noFill();
    strokeWeight(2);
    stroke(5,255,50);
    ellipse(x,height - (20 + 86),15,15);
  }
  
  