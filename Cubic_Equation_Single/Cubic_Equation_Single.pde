//based on this site https://math.vanderbilt.edu/schectex/courses/cubic/
float a = 3;
float b = 3;
float c = 1;
float d = 5;

void setup(){
  solveCubicEquation(a, b, c, d);
  println(solveEquation(a, b, c, d));
}

//to check https://www.calculatorsoup.com/calculators/algebra/cubicequation.php
Compl solveCubicEquation(float a, float b, float c, float d){
  float p = -b/(3*a);
  float q = p*p*p + (b*c-3*a*d)/(6*a*a);
  float r = c/(3*a);//based on this site https://math.vanderbilt.edu/schectex/courses/cubic/
  float t11pre = q*q + (r-p*p)*(r-p*p)*(r-p*p);
  Compl t11 = t11pre>0 ? new Compl(sqrt(t11pre), 0) : new Compl(0, sqrt(-t11pre));//(x>0) sqrt(x) = sqrt(x) sqrt(-x)=sqrt(x)i
  Compl cq = new Compl(q, 0);
  Compl t1 = cq.add(t11);
  Compl t2 = cq.sub(t11);
  println(t1.powt(1./3), t2.powt(1./3), p,t1.powt(1./3).add(t2.powt(1./3)).add(p));
  return t1.powt(1./3).add(t2.powt(1./3)).add(p);
}

class Compl{//complex number
  float x, y;
  Compl(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  String toString(){
    return "("+str(x)+","+str(y)+")";
  }
  
  Compl powt(float value){//return this^value
    float angle = atan2(y, x);
    float mag = sqrt(x*x + y*y);
    float rangle = angle*value;
    float rmag = pow(mag, value);
    return new Compl(cos(rangle)*rmag, sin(rangle)*rmag);
  }
  
  Compl add(Compl target){
    return new Compl(x+target.x, y+target.y);
  }
  
  Compl add(float target){
    return new Compl(x+target, y);
  }
  
  Compl sub(Compl target){
    return new Compl(x-target.x, y-target.y);
  }
  
  Compl sub(float target){
    return new Compl(x-target, y);
  }
}

float solveEquation(float a, float b, float c, float d){
  float p = -b/(3*a);
  float q = p*p*p + (b*c-3*a*d)/(6*a*a);
  float r = c/(3*a);//based on this site https://math.vanderbilt.edu/schectex/courses/cubic/
  float t1 = pow(q + sqrt(q*q + (r-p*p)*(r-p*p)*(r-p*p)), 1./3);//use sign function?
  float t2 = pow(q - sqrt(q*q + (r-p*p)*(r-p*p)*(r-p*p)), 1./3);
  println(t1, t2, p);
  return t1 + t2 + p;
}
