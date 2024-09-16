import 'package:flutter/material.dart';


//其实某一天我得重写这个FizTimetbScrollPages
class FizTimetbScrollPages extends StatefulWidget {
  final List<Widget> pages;
  const FizTimetbScrollPages({super.key, required this.pages});

  @override
  State<FizTimetbScrollPages> createState() => _FizTimetbScrollPagesState();
}

class _FizTimetbScrollPagesState extends State<FizTimetbScrollPages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() { //用于释放资源和执行清理操作
    _pageController.dispose();
    super.dispose();
  }

  //用于检测滑动方向，以及控制PageController
  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity == null) return;

    if (details.primaryVelocity! > 0) {
      // User swiped Right
      if (_currentPage > 0) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else if (details.primaryVelocity! < 0) {
      // User swiped Left
      if (_currentPage < widget.pages.length) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: widget.pages,
        ),
      ),
    );
  }
}
