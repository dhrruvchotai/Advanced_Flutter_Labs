class Student {
  int rollNumber;
  String name;

  Student(this.name, this.rollNumber);

  void displayDetails() {
    print('Name of the student is - ${name}');
    print('Roll Number of the student is - ${rollNumber}');
  }
}

void main() {
  Student st = Student('Dhruv', 27);
  st.displayDetails();
}
