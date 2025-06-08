class Demo {
  static int counter = 0;
}

class Increment extends Demo {
  void incrementCounter() {
    print(Demo.counter++);
  }
}

void main() {
  Increment i1 = Increment();
  i1.incrementCounter();
  Increment i2 = Increment();
  i2.incrementCounter();
}
