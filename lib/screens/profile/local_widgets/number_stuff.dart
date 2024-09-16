import 'package:flutter/material.dart';

class FizProfileNumbersStuff extends StatelessWidget {
  final List<Widget> children;

  const FizProfileNumbersStuff({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平方向均匀分布
      children: children,
    );
  }

  static Widget buildDivider() => const SizedBox(
    height: 24,
    child: VerticalDivider(),
  );

  static Widget buildButton(BuildContext context, String value, String text) =>
    MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 5),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
}
