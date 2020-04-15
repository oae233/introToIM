//Omar ElGamal
//Food Eater Game

Creature c1; //introduces creature class
PImage clouds; //imports cloud image for background
PImage sushi1; //imports sushi image for food
PImage foodeater; //imports image for creature after winning
PFont pixelfont; //imports the font for game


class Creature { //creature class
  float size; //variable for size of charachter (changes based on level)
  float r; //variable for R value of charachter color (changes on creatures need)
  float g; //variable for G value of charachter color (changes on creatures need)
  float b; //variable for B value of charachter color (changes on creatures need)
  float mood; //variable for creatures mood (reflected by color and hunger)
  float angry; //variable that switches between one and two to display when the creature is angry
  float yfood; //variable for Y coordinate of food
  float foodIsOffered; //variable that creates a relation between food and mood
  float foodSupply; //variable reflecting the food supply left
  float foodGoal; //variable reflecting the food goal that needs to be reach for the creature to grow
  float hygiene; //variable reflecting hygiene level of creature
  float death; //variable that is used to test if creature is dead
  float level; // variable for death
  float win; // variable to test for winning condition 
  Creature( float S) {
    size = S;
    mood = 254; 
    yfood = 0;
    foodIsOffered = 0;
    foodSupply = 400;
    foodGoal = 0;
    death = 0;
    hygiene = 400;
    level = 1;
    angry = 0;
    win = 0;
    //mood = M;
    //r = R;
    //g = G;
    //b = B;
  }
  void display() { //diplays creature
    stroke(0);
    pushMatrix();
    translate(0, (-(height*0.30) - size)); //translates the board to view creature in the center
    noStroke();
    fill(r, g, b); //uses rgb values from void mood() to set a color for the creatures body
    rect(width/2-(size/2), height, size, size); //draws creature, creature is drawn at bottom center
    //of page so the scaling point can be at the bottom center
    // of the creature so when it is sized up it doesnt shift arround
    rect(width/2-(size/2), height + size, 40, (height*0.30) - (height*0.20)); // draws left leg, dynamically so it 
    //moves when charachter is sized up
    rect((width/2+(size/2))-40, height + size, 40, (height*0.30) - (height*0.20)); // draws right leg, dynamically so it 
    //moves when charachter is sized up
    popMatrix(); 
    fill(255); 
    ellipse((width/2-(90/2))+25, height -(height*0.30)- 40, 25, 25); //draws left eye
    ellipse((width/2+(90/2))-25, height -(height*0.30) -40, 25, 25); //draws right eye
    fill(0);
    ellipse((width/2-(90/2))+25, height -(height*0.30)- 40, 20, 20); //draws left pupil
    ellipse((width/2+(90/2))-25, height -(height*0.30) -40, 20, 20); //draws right pupil
    state();
    mouth();
  }

  void mouth() { //displays the mouth for the creature, the mouth opens when food is offered
    // it is a sad face when creature gets too hungry, overly fed, or too dirty
    //alerting the player if its about to die
    state();
    if (foodIsOffered == 1) { //mouth opens when food is available
      ellipse(width/2, height -(height*0.30)-18, 22, 20);
    } else {
      if (angry == 0) { //if creature is not angry a smiley face is shown
        noFill();
        strokeWeight(2);
        stroke(0);
        arc(width/2, height -(height*0.30)- 25, 22, 20, 0+(PI*0.15), PI-(PI*0.15)); //draws an arc
        //arc starts at PI*0.15 and ends at PI-(PI*0.15)
      } else if (angry == 1 ) { //shows sad face if angry
        pushMatrix();
        translate(width/2, height -(height*0.30)- 15);
        rotate(PI); //rotates mouth 180 degrees so it looks sad
        noFill();
        strokeWeight(2);
        stroke(0);
        arc(0, 0, 22, 20, 0+(PI*0.15), PI-(PI*0.15));
        popMatrix();
      }
    }
  }
  void state() { //determines the state of the creature, 
    //sets its color to reflect its level of hunger
    food();
    if (foodIsOffered == 1) { // if food is being offered 
      if (mood < 280 && mood > 1) { // and the charachters mood is between 280 and 1
        mood = mood + 1; //mood is increased by one
      } else {  //if mood is more than 280 or less than 1
        death = 1; //charachter dies
      }
    }
    if (mood != 0 && foodIsOffered == 0) { //if mood is not zero and food is not offered
      mood = mood - 0.5*level; //the mood is decreased by 0.5 multiplied by the level the 
      //player is in, this allows the game to progressivley get harder as you advance
      //the mood decreases faster the bigger the creature
    }
    r = (255-mood)+1; //the red value for the color of the creature is the 255 - mood
    // as mood increases red value decreases (inverse)
    g = mood; //green value is equal to the mood value
    b = 70;
    if (mood < 30 || mood >259) { //if mood is below 30 or over 259
      angry = 1; //charchter is angry
      stroke(0);
      strokeWeight(8);
      line((width/2-(90/2))+12, height -(height*0.30)- 55, (width/2-(90/2))+35, height -(height*0.30)- 50);
      stroke(0);
      strokeWeight(8);
      line((width/2-(90/2))+74, height -(height*0.30)- 55, (width/2-(90/2))+53, height -(height*0.30)- 50);
      //these lines draw eyebrows that make the creature appear angry 
      //this if statment makes sure the creature appears as angry when it is close to dying 
      //or had a bad mood alerting the player to stop overfeeding it of to feed it
    } else { //otherwise
      angry = 0; //creature is not angry
    }
    if (mood < 1 || mood > 275 ) { //if mood is smaller than 1 or more than 275
      death = 1; //creature dies
    }
    fill(24, 19, 17); 
    textAlign(LEFT, CENTER);
    createFont("PixieSerif-Bold", 150);
    text("Level: " + level, width - 100, 20 ); //displays level at top right
    win();
  }

  void food() { 
    eatfood();
    fill(240, 190, 40);
    //noStroke();
    rect (20, 10, foodSupply/2, 10); //shows bar at top left that reflects the food supply the player
    //has remaining
    fill(70, 50, 30);
    textAlign(RIGHT, CENTER);
    //pixelfont = createFont("PixieSerif-Bold");
    createFont("PixieSerif-Bold", 8);
    text("Food Supply", 100 + foodSupply/2, 12 ); //writes food supply next to bar
    if (keyPressed == true) { //if key is pressed
      if ( keyCode == UP ) { //if that key is UP key
        pushMatrix(); 
        translate(-(10/2), (-(height*0.20) - 10 -(-yfood))); //translates board to animate food to move upwards
        //intocreatures mouth
        sushi1 = loadImage("sushi1.png"); //loads food image or sushi image
        image(sushi1, width/2, height, 20, 20); //displays the image
        popMatrix();
        foodIsOffered = 1; //notifies that food is being offered
        foodGoal += 1; //foodGoal increases (creature gets closer to its food goal)
        //when creature eventually reaches the food goal of 400 it grows in size and
        //player moves to next level
        if (foodSupply > 0) { //if food supply is more than 0

          foodSupply -= 1; //food supply decreases by one
          //this ensures that food supply decreases when food is offered
        }
      }
    } else if (keyPressed == false) { //if key is not pressed
      foodIsOffered = 0; //no food is offered
    }
    grow();
  }
  void eatfood() { //changes the y value that determine sthe food position to allow it to
    //move upwards
    if ( yfood > -50) { //sets a limit to the movement 
      yfood = yfood -1 ; //y value decreases push it upward
    } else { //otherwise
      yfood = 0; //the y value stops changing
    }
  }
  void grow() { //makes the creature grow
    if (foodGoal == 400) { //if food goal is reached
      foodGoal = 0; //food goal is reset for new level
      foodSupply = 400; // food supply is refilled for new level
      size = size *1.25; //creature grows in size 1.25 times
      level ++; //level increases
    }
  }
  void death () { //checks if creature dies and displays deaths screen
    if (death == 1) {//if creature is dead
      fill(0, 0, 0, 96); //draw a black box with transparency of 96/255
      noStroke(); 
      rect(0, 0, width, height);//filld the whole screen
      textAlign(CENTER, CENTER);
      createFont("PixieSerif-Bold", 80);
      fill(240, 190, 170);
      text("YOU LOST!", width/2, height/2 ); //writes you lost
    }
  }
  void clean() { //cleans creature

    if (keyPressed == true) {//if key is pressed
      if ( keyCode == DOWN ) { //if that key is the DOWN key
        float bubblesX = random((width/2) - (size/2)+5, (width/2) + (size/2)+5); 
        //generate a random value to act as x value for bubbles
        //the value is generated to draw the buble within the bounds of the creature (+5)
        //this ensures that when the creature grows in size bubbles are drawn dynamically
        //and still cover the creature
        float bubblesY = random((height*0.6) - (size/2)+5, (height*0.6) + (size/2)+5);
        //generate a random value to act as y value for bubbles
        bubblesX = bubblesX + 0.5; //allows the values to change so they can move through time
        bubblesY = bubblesY + 0.5;
        float bx1 = noise(bubblesX); //applies perin noise to the x and y values
        float by1 = noise(bubblesY); //the values generated from the perlin noise
        float bx2 = noise(bubblesX); //functions are used to draw other smaller
        float by2 = noise(bubblesY); //bubbles that surround the main bubble
        float bx3 = noise(bubblesX);    
        float by3 = noise(bubblesY);
        fill(100, 100, 255, 60);//fills a bubble with a transparent light blue color
        stroke(255); //white stroke
        strokeWeight(1);
        ellipse(bubblesX, bubblesY, 15, 15); //draws first bubble
        ellipse(bx1, by1, 18, 18);
        ellipse(bx2, by2, 10, 10);
        ellipse(bx3, by3, 5, 5); //draws the rest of the bubbles
        if (hygiene < 400) { //if hygiene is under the maximum
          hygiene = hygiene + 1; //hygiene increases
        }
      }
    } else { //if key is not pressed
      if (hygiene > 0 && hygiene <= 400) { //if hygiene is between 0 and 400
        hygiene = hygiene - 1*level; //hygiene decreases
      }
    }
    fill(67, 78, 255); 
    rect (20, 30, hygiene/2, 10); //draws a rectangle at top left corner to 
    //reflect the level of hygiene for creatures
    textAlign(RIGHT, CENTER);
    createFont("PixieSerif-Bold", 8);
    fill(70, 50, 30);
    text("Hygiene", 90 + hygiene/2, 32 ); //types hygiene next to it
    if (hygiene < 1) { //if hygiene falls below 1
      death = 1; //creature dies
    }
  }
  void win() { //checks for winning
    if (level == 6) { //if level 6 is reached
      win = 1; // winning condition is true
    }
    if ( win == 1) { //if winning condition is true
      fill(255, 222, 0); //draws a yellow rectangle
      noStroke();
      rect(0, 0, width, height); //rectangle takes up whole screen
      textAlign(CENTER, CENTER);
      createFont("PixieSerif-Bold", 500);
      fill(24, 19, 17);
      text("YOU WON!!!", width/2, height/2 );//writes you won
      death = 0;
      foodeater = loadImage("foodeater.png"); //shows a small picture of the creature as celebration
      image(foodeater, width/2-25, height*0.6, 50, 50);
    }
  }
}

void setup() {
  frameRate(35);
  size(620, 350); //sets frame size
  //the whole game is coded dynamically so no matter what size the game is set to 
  //all other elements adapt to the new size
  smooth();
  clouds = loadImage("cloud.png"); //adds cloud image to the background
  c1 = new Creature(90);
}

void draw() {
  background(200, 230, 255);
  image(clouds, 0, 0, width, height/2);
  fill(70, 50, 30);
  noStroke();
  rect(0, height-(height*0.20), width, height);
  c1.state();
  c1.display();
  c1.food();
  c1.clean();
  c1.death();
  c1.win();
}
