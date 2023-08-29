import 'dart:math';

import 'package:flutter/material.dart';

class BmiModel {
  String gender;
  int age;
  double height;
  int weight;
  late BmiResultModel result = BmiResultModel();
  BmiModel(this.gender, this.age, this.height, this.weight) {
    result = BmiResultModel();
  }
  void calculateBmi() {
    var score = weight / ((height / 100) * (height / 100));
    result.score = score;
    if (score < 18.5) {
      result.info = 'Underweight';
      result.description = 'You may need to gain some weight.';
      result.color = Colors.blueGrey;
      result.quote =
          '"Take care of your body. It\'s the only place you have to live." - Jim Rohn';
    } else if (score < 24.9) {
      result.info = 'Healthy range';
      result.description = 'You have a healthy weight. Keep it up!';
      result.color = Colors.green;
      result.quote =
          '"Physical fitness is not only one of the most important keys to a healthy body, but it is also the basis of dynamic and creative intellectual activity." - John F. Kennedy';
    } else if (score < 29.9) {
      result.info = 'Overweight';
      result.description = 'Consider losing some weight for better health.';
      result.color = Colors.amber;
      result.quote =
          '"It does not matter how slowly you go as long as you do not stop." - Confucius';
    } else if (score < 39.9) {
      result.info = 'Obesity';
      result.description = 'It\'s important to focus on weight loss and overall health.';
      result.color = Colors.deepOrange;
      result.quote = '"The journey of a thousand miles begins with one step." - Lao Tzu';
    } else {
      result.info = 'Severe obesity';
      result.description = 'Immediate lifestyle changes are crucial for your health.';
      result.color = Colors.red;
      result.quote =
          '"You don’t have to be great to start, but you have to start to be great." - Zig Ziglar';
    }
  }
}

class BmiResultModel {
  late double score;
  late Color color;
  late String info;
  late String description;
  late String quote;

  BmiResultModel();
}
