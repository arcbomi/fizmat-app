import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FizTimetb extends StatefulWidget {
  const FizTimetb({super.key});

  @override
  State<FizTimetb> createState() => _FizTimetbState();
}

class _FizTimetbState extends State<FizTimetb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InAppWebView(initialUrlRequest: URLRequest(url: WebUri("https://arcbomi.github.io/timetable")))
      ),
    );
  }
}