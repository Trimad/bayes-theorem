class Area {

  PVector[] vectors = new PVector[4];

  Area(PVector[] _vectors) {
    this.vectors = _vectors;
  }

  void show(color c) {
    beginShape();
    //texture(a_texture);
    fill(c);
    vertex(vectors[0].x, vectors[0].y, 0, 0);
    vertex(vectors[1].x, vectors[1].y, 1, 0);
    vertex(vectors[2].x, vectors[2].y, 1, 1);
    vertex(vectors[3].x, vectors[3].y, 0, 1);
    endShape();
  }

  void lerp(Area other, float howMuch) {
    for (int i = 0; i < a.vectors.length; i++) {
      this.vectors[i] = this.vectors[i].lerp(other.vectors[i], howMuch);
    }
  }
}
