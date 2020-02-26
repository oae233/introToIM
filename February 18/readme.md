### Description:
For this project I created a little game. The game consists of trying to figure out how to light up a red LED light. Firstly there is a flex sensor, representing the analog read, connected to a blue LED that changes brightness/ light intensity based on the value received from the flex sensor (analog write). The player has to figure out in which position would the blue LED turn off, because thats the first condition needed for the red one to turn on. The second condition changes randomly each time the code is re-uploaded. I used a long at the begging of the code to introduce random numbers, the code generates a random number 3 times (either 1 or 0) and assigns each to a variable name. The code has an if statement that allows the red LED to light up if the buttonStates of each of the buttons is equal to the random value assigned to it, the player needs to figure out the combination of buttons to press to make the LED light up.
### Schematic:
![](toneCircuitDiagram.png)
### Images:
![](tone1.jpg)
![](tone2.jpg)

