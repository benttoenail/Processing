//establishing size of boids
static float boidHeight = 12.0;
static float boidWidth  = 8.0;

static float perceptionDistance = 30;
static float perceptionAngle = PI;
static float perceptionMinimumDistance = 5;

static float alignmentWeight = 1.0;
static float cohesionWeight = 0.7;
static float seperationWeight = 0.1;

class Boid {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Boid() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2.5, 2.5), random(-2.5, 2.5));
    acceleration = new PVector();
  }
  //the actual rendering of the boids, nested within the "Boid" class
  void render() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(-(float)atan2(-velocity.y, velocity.x));
    triangle(-boidHeight/2.0, boidWidth/2.0, boidHeight/2.0, 0, -boidHeight/2.0, -boidWidth/2.0);
    popMatrix();
  }

  //setup for boids to find neighbors
  ArrayList getNeighbors(ArrayList boids) {

    ArrayList neighbors = new ArrayList();

    PVector locationDifference = new PVector();

    for (int i=0; i<boids.size(); i++) {
      Boid b = (Boid)boids.get(i);

      if (b== this)continue;

      locationDifference.set(b.location);
      locationDifference.sub(location);

      if (locationDifference.mag() > perceptionDistance) continue;

      if (PVector.angleBetween(velocity, locationDifference) > perceptionAngle) continue;

      neighbors.add(b);
    }

    return neighbors;
  }

  void update(ArrayList neighbors) {

    PVector locationDifference = new PVector();
    PVector velocityDifference = new PVector();

    //boid urges
    PVector alignment = new PVector();
    PVector cohesion = new PVector();
    PVector seperation = new PVector();

    for (int i=0; i<neighbors.size(); i++) {

      Boid b = (Boid)neighbors.get(i);

      locationDifference.set(b.location);
      locationDifference.sub(location);

      velocityDifference.set(b.location);
      velocityDifference.sub(location);

      alignment.add(velocityDifference);
      cohesion.add(locationDifference);
      if (locationDifference.mag() < perceptionMinimumDistance) seperation.add(locationDifference);
    }
    
    //normalizing the different boid variables if not zero
    if(alignment.mag()>0) alignment.normalize();
    if(cohesion.mag()>0) cohesion.normalize();
    if(seperation.mag()>0) seperation.normalize();
    
    //assign weights to urges
    alignment.mult(alignmentWeight);
    cohesion.mult(cohesionWeight);
    seperation.mult(seperationWeight);
    
    acceleration.set(alignment);
    acceleration.add(cohesion);
    acceleration.sub(seperation);
    
    velocity.add(acceleration);
    location.add(velocity);
    
   
    
  }
} //End of class

ArrayList boids;

void setup() {
  size(720, 460);
  boids = new ArrayList();

  for (int i=0; i<200; i++) {
    Boid b = new Boid();
    boids.add(b);
  }
}

void draw() {
  background(50, 50, 50);
  for (int i=0; i<boids.size(); i++) {
    Boid b = (Boid)boids.get(i);
    b.update(b.getNeighbors(boids));
    b.render();
  }
}

