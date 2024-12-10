import 'dart:io';

bool isUglyNumber(int num) {
  if (num <= 0){
    return false;
  }

  while (num % 2 == 0) {
    num ~/= 2;
  }
  while (num % 3 == 0) {
    num ~/= 3;
  }
  while (num % 5 == 0) {
    num ~/= 5;
  }

  return num == 1;
}

void main() {
  print("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  if (isUglyNumber(number)) {
    print("$number is an Ugly Number.");
  } else {
    print("$number is not an Ugly Number.");
  }
}
