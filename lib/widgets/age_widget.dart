import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  const AgeWidget({
    super.key,
  });

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int age = 22;

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
      child: Column(children: [
        const Text(
          "Age",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    age -= 1;
                  });
                },
                icon: const Icon(Icons.remove)),
            Text(
              "$age",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    age += 1;
                  });
                },
                icon: const Icon(Icons.add)),
          ],
        )
      ]),
    );
  }
}
