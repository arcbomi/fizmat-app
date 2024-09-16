import 'package:fizmat_app/widgets/fiz_container.dart';
import 'package:flutter/material.dart';

class FizHomeContainer extends StatelessWidget {
  final String title;
  final Widget page;
  final Color color;

  const FizHomeContainer({
    super.key,
    required this.title,
    required this.page,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => page),
);

        },
        child: FizContainer(
          color: color,
          child: Center(
              child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )),
        ));
  }
}
