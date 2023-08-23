import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final int initialAge;
  final ValueChanged<int> onAgeChanged;
  const AgeWidget({super.key, this.initialAge = 22, required this.onAgeChanged});

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  late int age;

  @override
  void initState() {
    super.initState();
    age = widget.initialAge;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width * 0.42,
      height: size.width * 0.42,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 15.0, offset: Offset(5, 10))
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                    widget.onAgeChanged(age);
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
                    widget.onAgeChanged(age);
                  });
                },
                icon: const Icon(Icons.add)),
          ],
        )
      ]),
    );
  }
}
