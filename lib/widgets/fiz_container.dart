import 'package:flutter/material.dart';

class FizContainer extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;
  final Color? color;
  const FizContainer({
    Key? key,
    required this.child,
    this.horizontal = 0,
    this.vertical = 0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: child,
      ),
    );
  }
}
