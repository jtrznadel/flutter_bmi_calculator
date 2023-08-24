import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final ValueChanged<double> onValueChanged;
  final double initialValue;
  const HeightWidget({
    this.initialValue = 170,
    required this.onValueChanged,
    super.key,
  });

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  late double _currentHeightValue;

  @override
  void initState() {
    super.initState();
    _currentHeightValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      height: size.width * 0.42,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 15.0, offset: Offset(5, 10))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Height (cm)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            _currentHeightValue.toStringAsFixed(0),
            style: const TextStyle(fontSize: 18),
          ),
          Slider(
            value: _currentHeightValue,
            max: 220,
            min: 140,
            divisions: 80,
            onChanged: (double value) {
              setState(() {
                _currentHeightValue = value;
                widget.onValueChanged(_currentHeightValue);
              });
            },
          )
        ],
      ),
    );
  }
}
