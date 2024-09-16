import 'package:flutter/material.dart';

class FizProfileName extends StatelessWidget {
  final String name;
  final String email;
  const FizProfileName({super.key, required this.name,required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}