import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FizBookOnline extends StatefulWidget {
  const FizBookOnline({super.key});

  @override
  State<FizBookOnline> createState() => _FizBookOnlineState();
}

class _FizBookOnlineState extends State<FizBookOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InAppWebView(initialUrlRequest: URLRequest(url: WebUri("https://arcbomi.github.io/book")))
      ),
    );
  }
}