// code 1 FA 18
// bryan ma

// generative portrait 2

// see description in w10_04_portrait1

PImage img;
ArrayList<Generator> generators;

void setup() {
  size(820, 785);
  img = loadImage("doggo.jpg");
  generators = new ArrayList<Generator>();
  generators.add(new Generator(width/2, height/2));
}

void draw() {
  background(0);
  for (int i = 0; i < generators.size(); i++) {
    Generator g = generators.get(i);
    g.addParticles();
    g.drawParticles();
  }
}

class Particle {
  int posX;
  int posY;
  float velX;
  float velY;
  float life;
  color get;

  Particle(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    velX = random(5, 0);
    velY = random(-1, 1);
    life = 10;
  }

  void displayParticle() {
    for (int x = 0; x < img.width; x +=10) {
      for (int y = 0; y < img.height; y += 10) {
        noStroke();
        get = img.get(x, y);
        fill(get, map(life, 15, 0, 255, 0));
        ellipse((posX+x)-width/2, (posY+y)-height/2, life, life);
      }
    }
  }

  void updateBall() {
    life--;
    posX += velX;
    posY += velY;
  }
}


class Generator {
  ArrayList<Particle> particle;
  int posX;
  int posY;

  Generator(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    particle = new ArrayList<Particle>();
  }
  void addParticles() {
    particle.add(new Particle(this.posX, this.posY));
  }

  void drawParticles() {
    for (int i = 0; i < particle.size(); i++) {
      Particle b = particle.get(i);
      b.updateBall();
      b.displayParticle();
    }

    for (int i = particle.size() - 1; i >= 0; i--) {
      Particle b = particle.get(i);

      if (b.life < 0) {
        particle.remove(i);
      }
    }
  }
}
