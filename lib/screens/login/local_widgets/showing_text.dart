import 'package:flutter/material.dart';

//登录界面的提示词
class FizLoginShowingText extends StatelessWidget {
  final String text;
  const FizLoginShowingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

//登陆界面的head
class FizLoginHeadText extends StatelessWidget {
  final String text;
  final double size;
  const FizLoginHeadText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
