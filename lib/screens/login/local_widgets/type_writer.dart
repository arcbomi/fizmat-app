// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FizTypeWriterScreen extends StatelessWidget {
  final List<String> texts;

  const FizTypeWriterScreen({required this.texts});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      // 使用 AnimatedTextKit 小部件创建动画
      animatedTexts: texts.map((text) {
        // 将 texts 列表中的每个字符串映射为一个 TypewriterAnimatedText 对象
        return TypewriterAnimatedText(
          text, // 要显示的文本
          textStyle: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          speed: Duration(milliseconds: 100), // 每个字符的动画速度为 100 毫秒
        );
      }).toList(), // 将映射结果转换为列表
      repeatForever: true, // 动画将永远重复
      pause: Duration(milliseconds: 700), // 每次文本之间的暂停时间为 700 毫秒
      displayFullTextOnTap: true, // 点击时会显示完整的文本
      stopPauseOnTap: true, // 点击时会停止暂停
    );
  }
}
