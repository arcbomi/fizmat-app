import 'package:flutter/material.dart';

class FizLogoutButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final IconData icon;

  const FizLogoutButton(
      {Key? key,
      required this.text,
      required this.onClicked,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.surface
      ),
      label: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.surface, // 修改文本颜色为红色
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      onPressed: onClicked,
    );
  }
}

