/* 
 * ShapeGridCircles.pde
 * 
 * Pete Prodoehl <pete@2xlnetworks.com>
 * 
 * <http://rasterweb.net/raster/>
 * 
 */

import processing.pdf.*;
import java.util.Date;


// set width and height of canvas as well as border at edges
int canvasWidth = 800;
int canvasHeight = 600;

// starting diameter of the shape
int shapeWidth = 50;

// space between the shapes (also affects other variables)
float spaceBetween = 36;

// amount we draw the shape smaller each iteration
int shapeDecrement = 10;

// the smaller diameter shape we draw
int shapeSmallest = 9;

/* ----------------------------------------------------------- */

// other variables
float xPos = spaceBetween;
float yPos = spaceBetween;
float canvasBorder = shapeWidth * 2;

// get date to use for filename
Date date = new Date();
long currentTime = date.getTime()/1000; 


void settings() {
  size(canvasWidth, canvasHeight);
}

void setup() {
  background(255);
  stroke(0);
  strokeWeight(1);
  beginRecord(PDF, "output-" + currentTime + ".pdf");
}

void draw() {
      
      noFill();
      
      int lineOrNot = int(random(2));
      
      if (lineOrNot == 1) {
        stroke(0);
        circle(xPos, yPos, shapeWidth);
      }
      
      if (xPos > (canvasWidth-canvasBorder)) {
        xPos = spaceBetween;
        yPos = yPos + spaceBetween;
      }
      else {
        xPos = xPos + spaceBetween;
      }
      
      if (yPos > (canvasHeight-canvasBorder)) {
        yPos = spaceBetween;
        shapeWidth = shapeWidth - shapeDecrement;
      }
      
      if (shapeWidth < shapeSmallest) {
        endRecord();
        exit();
      }

}
