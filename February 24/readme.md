### Description:
For this project I decided to make something that represents a guitar, an electric form of it. I connected 4 piezo buzzers with different pins, each of the buzzers have a long solid core wire, where it should connect to ground, that extends along a breadboard. I cut a guitar pick shape out of cardboard and covered it in copper tape, I then taped a stranded core wire to it that was connected to the ground pin. The guitar pick upon contact with the solid core wires closes the circuit allowing the buzzer to produce its specific assigned frequency / tone. As an addition to my project I added a servo motor that moves from position 0 to 45 at the press of a button. The servo is connected by a wooden stick to a plastic hollow ball that I filled up with nuts. This part can be used to shake the bolts or to hit a surface to create a different sound. For the code I used the “tone” command to set the frequencies for the buzzers. At first I faced a problem, only the buzzer in the first tone command would work while the others would be blocked because tone is a blocking command. I got around this problem by assigning each tone for 10 milliseconds with a delay of 11 milliseconds, the code switches between the buzzer really fast that the sound almost seems continuous. Although this isn’t the most practical solution it works. For the servo, I used a simple if condition that checks if the buttonState is 1 or 0 and accordingly moves the servo between 0 and 45 degree.
### Schematic:
![](toneCircuitDiagram.png)
### Images:
![](tone1.jpg)
![](tone2.jpg)

