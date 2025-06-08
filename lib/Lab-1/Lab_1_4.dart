abstract class Demo {
  void display();
}

class Student extends Demo {
  void display() {
    print('This is method from abstract class!');
  }
}

void main() {
  Student st = Student();
  st.display();
}
