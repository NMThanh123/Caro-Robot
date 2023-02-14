import processing.serial.*;

Serial myPort;

String data;

int buttonxx,buttonxy,
    buttonox,buttonoy,
    button33x,button33y,
    button55x,button55y,
    button77x,button77y,
    button3x3x,button3x3y,
    button5x5x,button5x5y,
    button7x7x,button7x7y;
    
boolean buttonxover=false,
        buttonoover=false,
        button33over=false,
        button55over=false,
        button77over=false,
        button3x3over=false,
        button5x5over=false,
        button7x7over=false;
        
boolean choosex=false,
        chooseo=false,
        choose33=false,
        choose55=false,
        choose77=false,
        choose3x3=false,
        choose5x5=false,
        choose7x7=false;
    
int i,j,k,x,sochia=0,dau=0;

color colorx,coloro,color33,color55,color77;

char mark;

void setup() {
  size(960, 900);
  myPort = new Serial(this, "COM1", 9600);
  
  colorx=color33=color55=color77=color(218,165,32);
  coloro=color(255, 106, 106);
  


  ellipseMode(CENTER);
  buttonxx=105;
  buttonox=buttonxx+115;
  buttonxy=buttonoy=155;
  button33y=button55y=button77y=155;
  button33x=565;
  button55x=button33x+115;
  button77x=button55x+115;
  
  button3x3x=210;button3x3y=285;
  button5x5x=210;button5x5y=285;
  button7x7x=210;button7x7y=285;
  
  title();
}

void draw() {
  update(mouseX, mouseY);
 
  
  draw_buttonx();
  draw_buttono();
  draw_button33();
  draw_button55();
  draw_button77();
  
   if(choosex){
    mark='X';
  }
  
   if(chooseo){
    mark='O';
  }

  
  if (buttonxover) {
    colorx=color(255, 250, 250);
  } 
  else if (buttonoover){
    coloro=color(255, 250, 250);
  }
  else if (button33over){
    color33=color(255, 250, 250);
  }
  else if (button55over){
    color55=color(255, 250, 250);
  }
  else if (button77over){
    color77=color(255, 250, 250);
  }
 
  else {
    if(choosex){
      colorx=color(255, 250, 250);
      coloro=color(255, 106, 106);
    }
    else if (chooseo){
      coloro=color(255, 250, 250);
      colorx=color(218,165,32);
    } 
    else {
      coloro=color(255, 106, 106); 
      colorx=color(218,165,32);
    }
    
    if(choose33){
      
      color33=color(255, 250, 250);
      color55=color77=color(218,165,32);
    }
    else if (choose55){
      
      color55=color(255, 250, 250);
      color33=color77=color(218,165,32);
    }
    else if (choose77){
      
      color77=color(255, 250, 250);
      color33=color55=color(218,165,32);
    } 
    else {
        color33=color55=color77=color(218,165,32);
    } 
  }
}

void update(int x, int y) {
  if ( state_button(buttonxx, buttonxy, 90,90) ) {
    buttonxover = true;
    buttonoover = false;
  } 
  else if ( state_button(buttonox, buttonoy, 90, 90) ) {
    buttonxover = false;
    buttonoover = true;
  } else {
    buttonxover =buttonoover= false;
  }
  if ( state_button(button33x, button33y, 90, 90) ) {
    button77over = false;
    button55over = false;
    button33over = true;
  } 
  else if ( state_button(button55x, button55y, 90, 90) ) {
    button77over = false;
    button33over = false;
    button55over = true;
  } 
  else if ( state_button(button77x, button77y, 90, 90) ) {
    button33over = false;
    button55over = false;
    button77over = true;
  } else {
    button33over = false;
    button55over = false;
    button77over = false;
  }
  
  if (choose33){
    for( i=0;i<3;i++){
      for( j=0;j<3;j++){
        if(state_button(button3x3x+i*180, button3x3y+j*180, 180,180)){
          button3x3over = true;
          button5x5over = false;
          button7x7over = false;
          k=1;

          break;
        } 
        else {
          button3x3over = false;
          button5x5over = false;
          button7x7over = false;  
          
        }
      }
      if (k==1){
        k=0;
        break;
      }
    }  
  }
  
  else if (choose55){
    for( i=0;i<5;i++){
      for( j=0;j<5;j++){
        if(state_button(button5x5x+i*108, button5x5y+j*108, 108, 108)){
          button5x5over = true;
          button3x3over = false;
          button7x7over = false;
          k=1;
          break;
        } 
        else {
          button3x3over = false;
          button5x5over = false;
          button7x7over = false;  
          
        }
      }
      if (k==1){
        k=0;
        break;
      }
    }  
  }
  
  else if (choose77){
    for( i=0;i<7;i++){
      for( j=0;j<7;j++){
        if(state_button(button7x7x+i*77, button7x7y+j*77, 77, 77)){
          button7x7over = true;
          button3x3over = false;
          button5x5over = false;
          k=1;
          break;
        } 
        else {
          button3x3over = false;
          button5x5over = false;
          button7x7over = false;  
          
        }
      }
      if (k==1){
        k=0;
        break;
      }
    }  
  }
  
}

void mousePressed() {
  if (buttonxover) {
    choosex=true;
    chooseo=false;
  }
  else if (buttonoover) {
    choosex=false;
    chooseo=true;
  } 
  if (button33over) {
    title();
    draw_3x3();
    choose33=true;
    choose55=false;
    choose77=false;
   
  }
  else if (button55over) {
    title();
    draw_5x5();
    choose55=true;
    choose33=false;
    choose77=false;
    
  }
  else if (button77over) {
    title();
    draw_7x7();
    choose77=true;
    choose55=false;
    choose33=false;

  }
  
  if (button3x3over) {
    textSize(200);
    if (choosex){
      fill(0, 104, 139);
      x=0;
      dau=0;
    }
    else if (chooseo){
      fill(139, 58 ,58);
      x=-15;
      dau=1;
    }
    sochia=3;
    updateData();
    myPort.write(data);
    text(mark, button3x3x+37+i*180+x, button3x3y+150+j*180);   
  }
  else if (button5x5over) {
    textSize(120);
    if (choosex){
      fill(0, 104, 139);
      x=0;
      dau=0;
    }
    else if (chooseo){
      fill(139, 58 ,58);
      x=-8;
      dau=1;
    }
    sochia=5;
    updateData();
    myPort.write(data);
    text(mark, button5x5x+22+i*108+x, button5x5y+95+j*108);   
  }
  
  else if (button7x7over) {
    textSize(80);
    if (choosex){
      fill(0, 104, 139);
      x=0;
      dau=0;
    }
    else if (chooseo){
      fill(139, 58 ,58);
      x=-4;
      dau=1;
    }
    sochia=7;
    updateData();
    myPort.write(data);
    text(mark, button5x5x+17+i*77+x, button5x5y+65+j*77);   
  }
  
  
}


boolean state_button(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void draw_buttonx(){
  fill(colorx);
  rect(buttonxx, buttonxy, 90, 90);
  textSize(100);
  fill(0, 0, 0);
  text("X", buttonxx+20, buttonxy+80); 
}
void draw_buttono(){
  fill(coloro);
  stroke(0, 0 ,0);
  rect(buttonox, buttonoy, 90, 90);
  textSize(100);
  fill(139, 58 ,58);
  text("O", buttonox+12, buttonoy+80); 
}
void draw_button33(){
  fill(color33);
  stroke(0, 0, 0);
  rect(button33x, button33y, 90, 90);
  textSize(50);
  fill(0, 0, 0);
  text("3x3", button33x+10, button33y+60);
}
void draw_button55(){
  fill(color55);
  stroke(0, 0, 0);
  rect(button55x, button55y, 90, 90);
  textSize(50);
  fill(0, 0, 0);
  text("5x5", button55x+10, button55y+60);
}
void draw_button77(){
  fill(color77);
  stroke(0, 0, 0);
  rect(button77x, button77y, 90, 90);
  textSize(50);
  fill(0, 0, 0);
  text("7x7", button77x+10, button77y+60);
}

void draw_3x3(){
  
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        fill(255);
        stroke(0);
        rect(button3x3x+i*180, button3x3y+j*180, 180,180);
      }
    }  
  }


void draw_5x5(){
  for(int i=0;i<5;i++){
    for(int j=0;j<5;j++){
      fill(255);
      stroke(0);
      rect(button5x5x+i*108, button5x5y+j*108, 108, 108);
    }
  }  
}

void draw_7x7(){
  for(int i=0;i<7;i++){
    for(int j=0;j<7;j++){
      fill(255);
      stroke(0);
      rect(button7x7x+i*77, button7x7y+j*77, 77, 77);
    }
  }  
}

void title (){
  background(color(248, 248, 255));
  textSize(40);
  fill(33);
  text("GIAO DIEN DIEU KHIEN ROBOT CARO", 150, 60); 
  textSize(26);
  fill(0, 0, 0);
  text("chon dau X,O", 120, 135); 
  text("Chon kich thuoc", 650, 135); 
}



public void updateData() {
  data = str(sochia)
    +","+str(dau)
    +","+str(i) 
    +","+str(j);
}
