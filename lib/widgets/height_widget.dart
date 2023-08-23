import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({
    super.key,
  });

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
      child: const Column(
        children: [
          Text(
            "Height (cm)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
