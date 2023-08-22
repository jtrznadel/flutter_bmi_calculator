import 'package:flutter/material.dart';

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width * 0.42,
      height: size.width * 0.42,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: const Column(children: [
        Text(
          "Weight (kg)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          width: 50,
          height: 20,
        )
      ]),
    );
  }
}
