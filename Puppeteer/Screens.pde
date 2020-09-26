//For Main-Menu and Instructions.
public class Screen extends GameObject {
  PImage image;
  public Screen(Scene s){
    super(s);
    tags.add(tag.SCN);
  }
  
  void chooseImage(String image_dir) {
    image = loadImage(image_dir);
  }
  
  void render(){
    image(image,0,0);
  }
}

public class Main_Menu extends Scene {
  Screen s;
  public Main_Menu() {
    s = new Screen(this);
    s.chooseImage("Assets/mm.jpg");
    tButton puppeteer_button = new tButton(this,1074,318,482,174,2);
    tButton puppet_button = new tButton(this,1071,592,537,201,1);
    tButton instructions_button = new tButton(this,1087,863,674,105,3);
    addObj(puppeteer_button);
    addObj(puppet_button);
    addObj(instructions_button);
    addObj(s);
  }
  
   int handleStatus(int status){
    switch(status){
      case 0:
        //
      case 1:
        //
      default:
        return status;
    }
  }
}

public class Instructions extends Scene {
  Screen s;
  public Instructions() {
    s = new Screen(this);
    s.chooseImage("Assets/instructions.jpg");
    tButton back_button = new tButton(this,1396,0,518,100,4);
    addObj(back_button);
    addObj(s);
    
  }
  
  int handleStatus(int status){
    switch(status){
      case 0:
        //
      case 1:
        //
      default:
        return status;
    }
  }
}
