import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onValueChanged;
  final String name;
  const CounterWidget(
      {super.key,
      this.initialValue = 22,
      required this.onValueChanged,
      required this.name});

  @override
  State<CounterWidget> createState() => _CounterWidget();
}

class _CounterWidget extends State<CounterWidget> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
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
        Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                    value -= 1;
                    widget.onValueChanged(value);
                  });
                },
                icon: const Icon(Icons.remove)),
            Text(
              "$value",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    value += 1;
                    widget.onValueChanged(value);
                  });
                },
                icon: const Icon(Icons.add)),
          ],
        )
      ]),
    );
  }
}
