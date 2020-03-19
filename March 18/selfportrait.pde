void setup(){
size (600,600);
background(233,211,97);
fill(170,118,65);
noStroke();
rect(100,100,400,400); // face
fill(255);
ellipse(210,260,70,40); //eye frame right
fill(255);
ellipse(390,260,70,40); // eye frame left
fill(0);
ellipse(210,260,40,40); // pupil right
fill(0);
ellipse(390,260,40,40); //pupil left
stroke(0);
strokeWeight(20);
line(165,215,245,215); // right eyebrow
stroke(0);
strokeWeight(20);
line(350,215,430,215); // left eyebrow
noStroke();
fill(71,21,21);
ellipse(300,385,250,120); // mouth 
fill(170,118,65);
noStroke();
rect(170,315,280,70); // mouth mask top
noFill();
stroke(0);
strokeWeight(1);
triangle(300,220,270,380,330,380); // nose outline
fill(170,118,65);
noStroke();
rect(280,220,50,60); // nose mask top
fill(170,118,65);
noStroke();
rect(270,352,70,30); // nose mask bottom
fill(170,118,65);
noStroke();
rect(225,500,150,100); // neck
fill(0);
noStroke();
rect(100,70,400,40); // hair
fill(170,118,65);
noStroke();
ellipse(95,300,70,130); // right ear
fill(170,118,65);
noStroke();
ellipse(505,300,70,130); // left ear
noFill();
stroke(220);
strokeWeight(3);
ellipse(90,370,20,25); // earring
fill(255);
noStroke();
rect(210,385,180,20); // mouth mask top
fill(12,30,90);
noStroke();
triangle(300,520,120,600,480,600); // shirt
fill(170,118,65);
noStroke();
ellipse(300,547,150,70); // shirt mask


}

void loop(){
  
}
