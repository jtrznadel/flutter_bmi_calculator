import 'dart:math';

class BmiModel {
  String gender;
  int age;
  double height;
  int weight;
  late double result;

  BmiModel(
      {required this.gender,
      required this.age,
      required this.height,
      required this.weight});

  double calculateBmi() {
    return result = weight / ((height / 100) * (height / 100));
  }
}
