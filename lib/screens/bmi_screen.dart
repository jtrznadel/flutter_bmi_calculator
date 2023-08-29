import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/utilities/colors_palette.dart';
import 'package:bmi_calculator/widgets/counter_widget.dart';
import 'package:bmi_calculator/widgets/gender_widget.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BmiScreen> {
  bool isMalePressed = true;
  bool isFemalePressed = false;

  final BmiModel _bmiModel = BmiModel("male", 22, 170, 70);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: GenderWidget(
                      color: kMaleColor,
                      isPressed: isMalePressed,
                      icon: Icons.male_outlined,
                    ),
                    onTap: () {
                      setState(() {
                        _bmiModel.gender = "male";
                        isMalePressed = true;
                        isFemalePressed = false;
                      });
                    },
                  ),
                  GestureDetector(
                    child: GenderWidget(
                      color: kFemaleColor,
                      isPressed: isFemalePressed,
                      icon: Icons.female_outlined,
                    ),
                    onTap: () {
                      setState(() {
                        _bmiModel.gender = "female";
                        isMalePressed = false;
                        isFemalePressed = true;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HeightWidget(
                initialValue: _bmiModel.height,
                onValueChanged: (newHeight) {
                  setState(() {
                    _bmiModel.height = newHeight;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterWidget(
                    name: "Weight (cm)",
                    initialValue: _bmiModel.weight,
                    onValueChanged: (newWeight) {
                      setState(() {
                        _bmiModel.weight = newWeight;
                      });
                    },
                  ),
                  CounterWidget(
                    name: "Age",
                    initialValue: _bmiModel.age,
                    onValueChanged: (newAge) {
                      setState(() {
                        _bmiModel.age = newAge;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  onPressed: showResult,
                  child: const Text(
                    "Calculate Yours BMI",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void showResult() {
    _bmiModel.calculateBmi();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;

        return SizedBox(
          width: double.infinity,
          height: size.height * 0.35,
          child: Padding(
            padding: const EdgeInsets.all(30.0).copyWith(top: 20),
            child: Column(
              children: [
                Text(
                  'Your score is: ${(_bmiModel.result.score).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _bmiModel.result.info,
                  style: TextStyle(
                    fontSize: 28,
                    color: _bmiModel.result.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  _bmiModel.result.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  _bmiModel.result.quote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
