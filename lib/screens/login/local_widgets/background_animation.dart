import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

//谢谢chatgpt
class MovingWidget extends StatefulWidget {
  @override
  _MovingWidgetState createState() => _MovingWidgetState();
}

class _MovingWidgetState extends State<MovingWidget>
    with WidgetsBindingObserver {
  final List<_BoxData> _boxDataList = [];
  late Timer _timer;
  bool _isRunning = false; // 标志位，用于控制定时器是否运行

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 注册生命周期监听器
    _startTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 移除生命周期监听器
    _stopTimer(); // 停止定时器
    super.dispose();
  }

  // 生命周期回调，处理应用生命周期变化事件
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 应用从后台切换到前台，重新启动定时器
      if (!_isRunning) {
        _startTimer();
      }
    } else {
      // 应用进入后台，停止定时器
      _stopTimer();
    }
  }

  // 启动定时器
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (mounted) {
        setState(() {
          for (int i = 0; i < 1; i++) {
            final double randomTopPosition = Random().nextDouble();
            final Color randomColor = Color.fromRGBO(
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextDouble() * 0.35 + 0.3,
            );
            _boxDataList.add(_BoxData(randomTopPosition, randomColor));
          }
        });
      }
    });
    _isRunning = true;
  }

  // 停止定时器
  void _stopTimer() {
    _timer.cancel();
    _isRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _boxDataList.map((boxData) {
          return MovingRotatedBox(
            topPosition: boxData.topPosition,
            color: boxData.color,
          );
        }).toList(),
      ),
    );
  }
}

class _BoxData {
  final double topPosition;
  final Color color;

  _BoxData(this.topPosition, this.color);
}

class MovingRotatedBox extends StatefulWidget {
  final double topPosition;
  final Color color;

  const MovingRotatedBox({
    Key? key,
    required this.topPosition,
    required this.color,
  }) : super(key: key);

  @override
  _MovingRotatedBoxState createState() => _MovingRotatedBoxState();
}

class _MovingRotatedBoxState extends State<MovingRotatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _boxHeight;
  late double _animationDuration;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    const double minHeight = 70.0;
    const double maxHeight = 250.0;
    _boxHeight = minHeight + (maxHeight - minHeight) * Random().nextDouble()+sqrt(Random().nextDouble()*100);

    const double minDuration = 4.0;
    const double maxDuration = 9.5;
    _animationDuration = minDuration +
        (maxDuration - minDuration) * (maxHeight - _boxHeight) / (maxHeight - minHeight);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _animationDuration.toInt()),
    );

    _animation = Tween<double>(
      begin: -1.0,
      end: 1.2,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {});
          }
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: _animation.value * MediaQuery.of(context).size.height,
          left: MediaQuery.of(context).size.width * widget.topPosition,
          child: RotatedBox(
            quarterTurns: -1,
            child: Container(
              height: 2,
              width: _boxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [widget.color, widget.color.withOpacity(0.0)],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
