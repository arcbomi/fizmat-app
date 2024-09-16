import 'package:fizmat_app/widgets/fiz_headtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FizBirthday extends StatefulWidget {
  const FizBirthday({super.key});

  @override
  State<FizBirthday> createState() => _FizBirthdayState();
}

class _FizBirthdayState extends State<FizBirthday> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        FizHeadText(
          top: 50,
          text: "Birthday",
          fontSize: 50,
        ),
        Expanded(
          child: InAppWebView(
            initialUrlRequest:
            //如果今天过生日的人太多的话不能往下滑查看
            //也不知道如何解决
            //因为不能expanded,所以只能以后写一个动态的吧
                URLRequest(url: WebUri("https://arcbomi.github.io/birthday")),
          ),
        ),
      ],
    );
  }
}
