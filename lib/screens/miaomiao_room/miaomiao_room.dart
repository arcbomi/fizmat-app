import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class BlackRoomScreen extends StatefulWidget {
  final DateTime endTime; // 结束时间

  BlackRoomScreen({required this.endTime});

  @override
  _BlackRoomScreenState createState() => _BlackRoomScreenState();
}

class _BlackRoomScreenState extends State<BlackRoomScreen> {
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.endTime.difference(DateTime.now().toUtc());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now().toUtc();
      setState(() {
        _remainingTime = widget.endTime.difference(now);
        if (_remainingTime.isNegative) {
          _remainingTime = Duration.zero;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fizmat App Unavailable'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please try again in ${_formatTimeAsPower(_remainingTime)} sec',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'You are imprisoned by the owner of fizmat-app',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeAsPower(Duration duration) {
    final seconds = duration.inSeconds.toDouble();
    if (seconds <= 0) {
      return '0';
    }
    final power = log(seconds) / log(2);
    return '2^${power.toStringAsFixed(5)}';
  }
}
