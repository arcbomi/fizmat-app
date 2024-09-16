import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class FizNavBar extends StatefulWidget {
  final List<Widget> pages;

  const FizNavBar({super.key, required this.pages});
  @override
  _FizNavBarState createState() => _FizNavBarState();
}

class _FizNavBarState extends State<FizNavBar> {
  int _pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF111C25);
    final appBarColor = Theme.of(context).appBarTheme.backgroundColor!;
    //我不知道为什么“!”

    return Scaffold(
      body: IndexedStack(
        ///https://github.com/pichillilorenzo/flutter_inappwebview/issues/447
        ///but i cant preload fck
        index: _pageIndex,
        children: widget.pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: backgroundColor,
        color: appBarColor,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.list),
          Icon(Icons.cake),
          Icon(Icons.person),
        ],
      ),
    );
  }
}

