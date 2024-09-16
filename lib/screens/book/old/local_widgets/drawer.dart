import 'package:fizmat_app/models/theme.dart';
import 'package:flutter/material.dart';

class FizBookDrawer extends StatelessWidget {
  const FizBookDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: FizTheme().getLightNavyBlue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text('7-grade'), // 年龄段选项：全部
            onTap: () {
              Navigator.pop(context); // 关闭抽屉
            },
          ),
          ListTile(
            title: const Text('8-garde'), // 年龄段选项：儿童
            onTap: () {
              Navigator.pop(context); // 关闭抽屉
            },
          ),
          ListTile(
            title: const Text('9-grade'), // 年龄段选项：青少年
            onTap: () {
              Navigator.pop(context); // 关闭抽屉
            },
          ),
          ListTile(
            title: const Text('10-grade'), // 年龄段选项：成人
            onTap: () {
              Navigator.pop(context); // 关闭抽屉
            },
          ),
        ],
      ),
    ));
  }
}
