import 'dart:io';

void main() {
  try {
    int a = int.parse(stdin.readLineSync()!);
    int b = int.parse(stdin.readLineSync()!);
    print("a/b is : ${a ~/ b}");
  } catch (e) {
    print('Error : $e');
  }
}
