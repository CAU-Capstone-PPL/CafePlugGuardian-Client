import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  late Timer _timer;

  void startTimer(VoidCallback callback) {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      callback();
    });
  }

  void stopTimer() {
    _timer.cancel();
  }
}
