import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownTimerController extends ChangeNotifier {
  CountdownTimerController({int endTime, this.onEnd})
      : assert(endTime != null),
        _endTime = endTime;
  final VoidCallback onEnd;
  int _endTime;
  bool _isRunning = false;
  CurrentRemainingTime _currentRemainingTime;
  Timer _diffTimer;
  Duration _period = const Duration(seconds: 1);

  bool get isRunning => _isRunning;
  set endTime(int endTime) => _endTime = endTime;

  CurrentRemainingTime get currentRemainingTime => _currentRemainingTime;

  start() {
    _isRunning = true;
    disposeTimer();
    _onPeriodic();
  }

  _onPeriodic() {
    _timerDiffDate();
    _diffTimer = Timer.periodic(_period, (timer) {
      _timerDiffDate();
    });
  }

  _timerDiffDate() {
    _currentRemainingTime = _getCurrentRemainingTime();
    notifyListeners();
    if (_currentRemainingTime == null) {
      onEnd?.call();
      disposeTimer();
    }
  }

  CurrentRemainingTime _getCurrentRemainingTime() {
    if (_endTime == null) return null;
    int diff =
        ((_endTime - DateTime.now().millisecondsSinceEpoch) / 1000).floor();
    if (diff <= 0) {
      return null;
    }
    int days, hours, min, sec;
    if (diff >= 86400) {
      days = (diff / 86400).floor();
      diff -= days * 86400;
    }
    if (diff >= 3600) {
      hours = (diff / 3600).floor();
      diff -= hours * 3600;
    }
    if (diff >= 60) {
      min = (diff / 60).floor();
      diff -= min * 60;
    }
    sec = diff.toInt();
    return CurrentRemainingTime(days: days, hours: hours, min: min, sec: sec);
  }

  disposeTimer() {
    _isRunning = false;
    _diffTimer?.cancel();
    _diffTimer = null;
  }

  @override
  void dispose() {
    disposeTimer();
    super.dispose();
  }
}
