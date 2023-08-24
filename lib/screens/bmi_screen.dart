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

  final BmiModel _bmiModel = BmiModel(gender: "male", age: 22, height: 170, weight: 70);
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
                  onPressed: () {
                    _bmiModel.calculateBmi();
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: double.infinity,
                          height: size.height * 0.5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(_bmiModel.height.toString()),
                              Text(_bmiModel.weight.toString()),
                              Text(_bmiModel.age.toString()),
                              Text(_bmiModel.gender),
                              Text(_bmiModel.result.toString()),
                            ],
                          ),
                        );
                      },
                    );
                  },
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
}
