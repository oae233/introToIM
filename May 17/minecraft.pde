// Omar ElGamal - oae233
// Final Project: Minecraft Inspired Survival Game
// In this game the player needs to cross the river to get to the magical door. 
// in order to cross the river the player must build a bridge across
// Like in minecraft, the player needs to collect food and material to survive.
// The player uses arrows to move around
// SPACEBAR allows the player to break / utilise the object one square below him
// 'e' is used to EAT collected food
// 'c' is used to place down a wooden plank to create the bridge
// The player needs 2 tree logs to make one plank
// If the charachters stamina falls to zero the player dies
Game g1;

int cols = 20; 
int rows = 20; //columns and rows for grid
int [][] board; // 2d list for board to place everything in
int bx = 25;
int by = 25; //size of one block
float br= 59;
float bg = 159;
float bb= 63; // block green rgb values
float charx = 8;
float chary = 8; //inital coordinats of charachter/player
PImage omar; //image of player who i named after me
PImage tree; // image of tree
PImage grass; //image of grass
PImage dooropen; //image of opened door for when player enters
PImage doorclosed; //image of closed door 
PImage pumkin; //image of pumpkin
PImage wood; // image of log for wood icon
PImage food; //image of pumpkin for food icon
float randLocx; //random x cooridnate
float randLocy; //random y coordinate
float utilise; // value to test if player is utilising block below
float resistance= 60; //resistance of block being utilised/ destroyed 
// prevents trees from being destroyed immediately 
int woodheld = 0; //value to keep track of wood collected by player
int foodheld = 0; //value to keep track of food collected by player
float stamina = 2000; //value of initial stamina for player
float eating; //checks if charachter is eating
float creating; //checks if charachter is creating (ex:laying down planks)
float death = 0; //checks for death
float win = 0; //checks for victory

class Game {
  Game() {
  }
  void createBoard() { 

    board = new int[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int w = 0; w < rows; w ++) {
        board[i][w] = 0; //creates the 2d list of the board and fills it with zeros
      }
    }
    for (int i = 0; i < 30; i++) {
      randLocx = int(random(cols));
      randLocy = int(random(rows));
      if (board[int(randLocx)][int(randLocy)] == 0) {
        board[int(randLocx)][int(randLocy)] = 1; 
        //inserts a 1 in random spots in the 2d list of the board
        // the code laters checks for 1s and prints trees where they are on the board
      }
    }
    for (int i = 0; i < 10; i++) {
      randLocx = int(random(cols));
      randLocy = int(random(rows));
      if (board[int(randLocx)][int(randLocy)] == 0) {
        board[int(randLocx)][int(randLocy)] = 4;
        //inserts a 4 in random spots in the 2d list of the board
      }
    }
    for (int i = 1; i < 3; i++) {
      for (int w = 17; w < 19; w++) {
        board[i][w] = 0; // ensures area around the door is 0
        // which translates into plain grass so nothing can obstruct player path
      }
    }
    for (int i = 0; i < 1; i++) {
      for (int w = 0; w < 20; w++) {
        board[i][w] = 1;
        //draws tree border
      }
    }
    for (int i = 19; i < 20; i++) {
      for (int w = 1; w < 20; w++) {
        board[i][w] = 1;
        //draws tree border
      }
    }


    drawRiver(); //calls draw river function
  }
  void drawRiver() { //this function enters the value "2" in specific spots in the
    //grid/2d list that later correspond to blue blocks that represent the river
    for (int i = 0; i < 4; i++) {
      for (int w = 10; w < 14; w++) {
        board[i][w] = 2;
      }
    }
    for (int w = 10; w < 15; w++) {
      board[4][w] = 2;
    }
    for (int w = 11; w < 17; w++) {
      board[5][w] = 2;
    }
    for (int w = 12; w < 19; w++) {
      board[6][w] = 2;
    }
    for (int w = 13; w < 20; w++) {
      board[7][w] = 2;
    }
    for (int w = 17; w < 20; w++) {
      board[8][w] = 2;
    }
    for (int w = 18; w < 20; w++) {
      board[9][w] = 2;
    }
    board[10][19] = 2;
    board[4][13] = 2;
    board[4][14] = 2;
  }
  void bg() { //this draws the background, checking what each value in the 2d
    // list is and draws in that coordinate the corresponding object
    // 0 = grass
    // 1 = tree
    // 2 = water
    // 4 = pumpkin
    // 5 = plank

    create(); //calls create function

    for (int i = 0; i < cols; i++) {
      for (int w = 0; w < rows; w ++) { //goes through the list
        int x = i*bx;
        int y = w*by; //translates position in list into coordinates on board
        if ( board[i][w] != 2 ) { // if position is not is not water
          //this draws the green everywhere where there isint water because 
          //the images placed later are pngs and need green backgrounds
          noStroke();
          //stroke(255);
          fill(br, bg, bb);
          rect(x, y, bx, by);// make a rectangle with the grass green fill
        }
        if ( board[i][w] == 1 ) { // if the list holds a 1
          noStroke();
          fill(br, bg, bb);
          rect(x, y, bx, by);
          tree = loadImage("tree.png");
          image(tree, x, y, bx, by); //place the tree image
        }
        if (board[i][w] == 2) { //if list holds a 2
          noStroke();
          fill(88, 207, 255);
          rect(x, y, bx, by); //color blue
        }
        if (board[i][w] == 4) { // if list holds a 4
          pumkin = loadImage("pumkin.png");
          image(pumkin, x, y, bx, by); //place pumpkin picture
        }
        if (board[i][w] == 5) { //if list holds a 5
          noStroke();
          fill(154, 106, 58);
          rect(x, y, bx, by); //place a dark brown color to represent plank
        }
      }
      if (win == 0) { //switches between open and closed door 
        //when winning condition is satisfied
        doorclosed = loadImage("doorclosed.png");
        image(doorclosed, 1*bx, 16*by, bx*2, by*2);
      } else if (win == 1) {
        dooropen = loadImage("dooropen.png");
        image(dooropen, 1*bx, 16*by, bx*2, by*2);
      }
    }
  }

  void omar() { //draws charachter
    eat();
    utilise();
    for (int i = 0; i < cols; i++) {
      if (i == charx) {
        for (int w = 0; w < rows; w ++) {
          if (w == chary) {
            int x = i*bx;
            int y = w*by;
            if (win == 0) {
              omar = loadImage("omar.png");
              image(omar, x, y, bx, by);
            }
          }
        }
      }
    }
    stats();
  }

  void utilise() { //allows player to pick up food or chop down wood 
    if (utilise == 1) {
      resistance--;
      fill(255, 0, 0);
      rect(charx*bx, chary*by - 10, 20*(1/resistance), 5);
    }
    if (resistance <= 0) {
      if (board[int(charx)][int(chary+1)] == 1 || board[int(charx)][int(chary+1)] == 5) {
        woodheld = woodheld + 1;
      } else if (board[int(charx)][int(chary+1)] == 4) {
        foodheld = foodheld + 1;
      }
      if (board[int(charx)][int(chary+1)] != 2) {
        board[int(charx)][int(chary+1)] = 0;
      }
      utilise = 0;
      resistance = 60;
    }
  }


  void stats() { //shows stats for player
    eat();
    wood = loadImage("wood.png");
    image(wood, 19*bx- 5, 0*by, bx, by);
    fill(255); 
    textAlign(LEFT, CENTER);
    textSize(15);
    text(woodheld, 19*bx +9, 0*by+ 18);
    food = loadImage("food.png");
    image(food, 18*bx- 5, 0*by, bx, by);
    fill(255); 
    textAlign(LEFT, CENTER);
    textSize(15);
    text(foodheld, 18*bx +9, 0*by+ 18);

    fill(230, 230, 130);
    rect(bx*13, 19*by, stamina/20, 10);
    fill(255); 
    textAlign(LEFT, CENTER);
    createFont("PixieSerif-Bold", 13);
    textSize(13);
    text("Stamina", bx*13, 19*by-13);
    ;
  }

  void eat() { //allows the stamina to decrease and increase based on 
  //whetheer player is eating or not
    if (stamina > -1) {
      stamina --;
    }
    if (eating == 1 && foodheld > 0) {
      stamina = stamina + 1500;
      foodheld = foodheld - 1;
      eating = 0;
    }
    if (stamina == 0) {
      death = 1;
    }
  }

  void create() { //allows player to lay down planks
    if (creating == 1 && woodheld > 1) {
      woodheld = woodheld - 2;
      board[int(charx)][int(chary+1)] = 5;
      creating = 0;
    }
  }

  void death() { //checks for and displays death screen
    if (death == 1) {
      fill(0);
      rect(0, 0, 500, 500);
      textAlign(CENTER, CENTER);
      createFont("PixieSerif-Bold", 30);
      textSize(30);
      fill(255);
      text("YOU DIED", width/2, height/2);
    }
  }
  void win() { //checks for winning and displays winning screen
    if (charx >= 1 && charx <= 2 && chary >= 16 && chary <= 17) {
      win = 1;
      textAlign(CENTER, CENTER);
      createFont("PixieSerif-Bold", 30);
      textSize(30);
      fill(255);
      text("YOU WON!", width/2, height/2);
    }
  }
}



void setup() {
  size(500, 500);
  g1 = new Game();
  g1.createBoard();
}

void draw() {
  g1.bg();
  g1.omar();
  g1.death();
  g1.win();
}


void keyPressed() { //allows player to move charachter with buttons and 
//execute actions
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (charx < cols - 1) {
        if (board[int(charx + 1)][int(chary)] == 0 || board[int(charx + 1)][int(chary)] == 5 ) {
          charx++;
        }
      }
    }
    if (keyCode == LEFT) {
      if (charx - 1 > -1) {
        if (board[int(charx - 1)][int(chary)] == 0 || board[int(charx - 1)][int(chary)] == 5) {
          charx--;
        }
      }
    }
    if (keyCode == UP) {
      if (chary - 1 > -1) {
        if (board[int(charx)][int(chary - 1)] == 0 || board[int(charx)][int(chary - 1)] == 5) {
          chary--;
        }
      }
    }
    if (keyCode == DOWN) {
      if (chary < rows - 1) {
        if (board[int(charx)][int(chary + 1)] == 0 || board[int(charx)][int(chary + 1)] == 5) {
          chary++;
        }
      }
    }
  }
  if (keyCode == 32) { //space bar to use
    utilise = 1;
  } else {
    utilise = 0;
    resistance= 50;
  }
  if (keyCode == 69) { //e for eat
    eating = 1;
  } else {
    eating = 0;
  }
  if (keyCode == 67) { // c for create
    creating = 1;
  } else {
    creating = 0;
  }
}
