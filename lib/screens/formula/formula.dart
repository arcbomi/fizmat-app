import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FizFormula extends StatefulWidget {
  const FizFormula({super.key});

  @override
  State<FizFormula> createState() => _FizFormulaState();
}

class _FizFormulaState extends State<FizFormula> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InAppWebView(initialUrlRequest: URLRequest(url: WebUri("https://arcbomi.github.io/fizmat-formula-book")))
      ),
    );
  }
}