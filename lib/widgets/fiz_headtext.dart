import 'package:flutter/material.dart';

class FizHeadText extends StatelessWidget {
  final double top;
  final String text;
  final double fontSize;
  const FizHeadText({super.key, required this.top, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}