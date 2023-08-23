import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {super.key, required this.color, required this.icon, required this.isPressed});

  final Color color;
  final bool isPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.42,
      height: size.width * 0.42,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: isPressed ? Colors.deepPurple[100] : Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 15.0, offset: Offset(5, 10))
          ]),
      child: Icon(
        icon,
        size: 60,
        color: color,
      ),
    );
  }
}
