import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

///Countdown timer controller.
class CountdownTimerController extends ChangeNotifier {
  CountdownTimerController({int endTime, this.onEnd})
      : assert(endTime != null),
        _endTime = endTime;
  ///Event called after the countdown ends
  final VoidCallback onEnd;
  ///The end time of the countdown.
  int _endTime;
  ///Is the countdown running.
  bool _isRunning = false;
  ///Countdown remaining time.
  CurrentRemainingTime _currentRemainingTime;
  ///Countdown timer.
  Timer _countdownTimer;
  ///Intervals.
  Duration intervals = const Duration(seconds: 1);
  ///Seconds in a day
  int _daySecond = 60 * 60 * 24;
  ///Seconds in an hour
  int _hourSecond = 60 * 60;
  ///Seconds in a minute
  int _minuteSecond = 60;
  bool get isRunning => _isRunning;

  set endTime(int endTime) => _endTime = endTime;

  ///Get the current remaining time
  CurrentRemainingTime get currentRemainingTime => _currentRemainingTime;

  ///Start countdown
  start() {
    _isRunning = true;
    disposeTimer();
    _countdownPeriodicEvent();
    _countdownTimer = Timer.periodic(intervals, (timer) {
      _countdownPeriodicEvent();
    });
  }

  ///Check if the countdown is over and issue a notification.
  _countdownPeriodicEvent() {
    _currentRemainingTime = _calculateCurrentRemainingTime();
    notifyListeners();
    if (_currentRemainingTime == null) {
      onEnd?.call();
      disposeTimer();
    }
  }

  ///Calculate current remaining time.
  CurrentRemainingTime _calculateCurrentRemainingTime() {
    if (_endTime == null) return null;

    int remainingTimeStamp =
        ((_endTime - DateTime.now().millisecondsSinceEpoch) / 1000).floor();
    if (remainingTimeStamp <= 0) {
      return null;
    }
    int days, hours, min, sec;

    ///Calculate the number of days remaining.
    if (remainingTimeStamp >= _daySecond) {
      days = (remainingTimeStamp / _daySecond).floor();
      remainingTimeStamp -= days * _daySecond;
    }
    ///Calculate remaining hours.
    if (remainingTimeStamp >= _hourSecond) {
      hours = (remainingTimeStamp / _hourSecond).floor();
      remainingTimeStamp -= hours * _hourSecond;
    }
    ///Calculate remaining minutes.
    if (remainingTimeStamp >= _minuteSecond) {
      min = (remainingTimeStamp / _minuteSecond).floor();
      remainingTimeStamp -= min * _minuteSecond;
    }
    ///Calculate remaining second.
    sec = remainingTimeStamp.toInt();
    return CurrentRemainingTime(days: days, hours: hours, min: min, sec: sec);
  }

  disposeTimer() {
    _isRunning = false;
    _countdownTimer?.cancel();
    _countdownTimer = null;
  }

  @override
  void dispose() {
    disposeTimer();
    super.dispose();
  }
}
