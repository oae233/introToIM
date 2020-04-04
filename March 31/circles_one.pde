float xh = 0; // setting an value that would be modified by the perlin noise and would set the boards transformation value across the x-axis
float yw = 3829; // setting an value that would be modified by the perlin noise and would set the boards transformation value across the y-axis 
                 // (put a random value other than 0 because when both numbers are zero the perlin noise generates 
                 // the same values for the x and y and circles are only generated diagonally on the board)
float zs = 0; // setting an value that would be modified by the perlin noise and would determine the size of the circles drawn
void setup() {
  size(700, 500); // setting the window dimesions (close ot the dimensions of the computer art i'm attempting to emulate
  background(0); // setting the background color to black to match the computer art
  execute(xh,yw,zs); // executes the "execute" function
}

void execute(float xh, float yw, float zs) { // this function applies perlin noise to the variables xh, yw and zs and then uses the map function
                                             //to return values outside the range of 1 and 0, the values returned are named x, y and z respectively
                                             // finally the function executes the function "polygonDraw"
  for (int i = 0; i < 40; i = i+1) { // for loop that allows the statments to be run 40 times, eventually drawing 40 shapes on the screen all with different 
                                     // values as new values are generated for all 40 times
    xh = xh + 2689; 
    yw = yw + 8595;
    zs = zs + 4468; // this and the two statements above it change the values of the variables so the perlin noise function recieves different inputs everytime
                   // the code is run and therefore generates different values, if the values are small (eg: 0.05) the shapes are drawn very close to eachother 
                   // with very little and gradual size changes, the bigger the values the bigger the differences
                   // I chose these specific values because I thought they generated results taht best reflect the computer art I am trying to emulate,
                   // choosing large and random numbers that decrease the correlation and kind of push back against the "order" perlin noise might be trying to create
    float x = noise(xh); 
    float y = noise(yw);
    float z = noise(zs); // applies perlin noise to values
    x = map(x, 0, 1, 0, width);  // maps the x value (between 1 and 0) generated from the perlin noise  to a value between 0 and the width
    y = map(y, 0, 1, 0, height); // maps the y value (between 1 and 0) generated from the perlin noise  to a value between 0 and the height
    z = map(z, 0, 1, 5, 200); // maps the z value (between 1 and 0) generated from the perlin noise  to a value between 5 and 200 
                              // a size range I thought was close ot that of the computer art
    polygonDraw( x, y, z); // executes the "polygonDraw" funtion
  }
}

void polygonDraw(float x, float y, float z) { //this function translates the board, it uses push and pop and runs the "polygon" function while also 
                                              //determining a fill and stroke
  pushMatrix(); //allows the changes made in terms of translation to the board to only be temporary, lasting till the popMatrix line runs
  translate(x, y); //translates the board by the x and y values generated
  stroke(255); //creates a white stroke
  noFill(); // adds no fill to the shape, shape is transparent 
  polygon(0, 0, z, 14); // runs the "polygon" function, the 0 , 0 determine the coordinates, the z determinates the radius while the 14 determines the number of sides
  popMatrix(); //resets the position of the board
}

void polygon(float x, float y, float radius, int npoints) { // creates a circle by drawing a regular polygon with 14 sides
                                                            // in the attempted computer art the circles do not have smooth borders but rather look like regular
                                                            // polygons with a large number of sides, this function aims ot execute that look
                                                            // I learned this code from https://processing.org/examples/regularpolygon.html
  float angle = TWO_PI / npoints; // to get the angle between the sides, it divides 2 pi by the number of sides (geometry)
  beginShape(); // begins drawing shape
  for (float a = 0; a < TWO_PI; a += angle) { // for loop to draw each side with the angle calculated above from the last side
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy); // draws vertex
  }
  endShape(CLOSE); // shape is closed
}

