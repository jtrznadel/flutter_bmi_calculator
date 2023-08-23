import 'package:bmi_calculator/utilities/colors_palette.dart';
import 'package:bmi_calculator/widgets/age_widget.dart';
import 'package:bmi_calculator/widgets/gender_widget.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:bmi_calculator/widgets/weight_widget.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BmiScreen> {
  bool isMalePressed = true;
  bool isFemalePressed = false;
  int age = 22;
  @override
  Widget build(BuildContext context) {
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
              const HeightWidget(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WeightWidget(),
                  AgeWidget(
                    initialAge: age,
                    onAgeChanged: (newAge) {
                      setState(() {
                        age = newAge;
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
                  onPressed: () {},
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
