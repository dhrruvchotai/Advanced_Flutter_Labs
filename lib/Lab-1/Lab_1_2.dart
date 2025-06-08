class Student {
  int rollNumber = 27;
  String name = 'Dhruv';

  void displayDetails() {
    print('Name of the student is - ${name}');
    print('Roll Number of the student is - ${rollNumber}');
  }
}

class Junior extends Student {
  void display() {
    print('Hello from junior class!');
  }
}

void main() {
  Junior js = Junior();
  js.displayDetails();
  js.display();
}
