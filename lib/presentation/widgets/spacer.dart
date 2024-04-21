import 'package:flutter/material.dart';

class SpacerHeight extends StatelessWidget {
  const SpacerHeight({super.key, this.height = 8.0});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
