import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.42,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
