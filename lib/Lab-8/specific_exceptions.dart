import 'dart:io';

void main() {
  try {
    String num = stdin.readLineSync()!;
    print("Number is ${int.parse(num)}");
  } on FormatException catch (e) {
    print("Error can not convert string to num : $e");
  } catch (e) {
    print("Error : $e");
  } finally {
    print("Always executes!!");
  }
}
