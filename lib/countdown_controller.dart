import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownController extends ValueNotifier<int> {
  CountdownController({int timestamp, Duration duration})
      : assert((timestamp != null && timestamp > 0) || duration != null),
        super(timestamp ?? duration.inMilliseconds);
  Timer _diffTimer;

  CurrentRemainingTime get currentRemainingTime {
    int days, hours, min, sec;
    int _timestamp = (value / 1000).floor();
    if (value >= 86400) {
      days = (_timestamp / 86400).floor();
      _timestamp -= days * 86400;
    }
    if (_timestamp >= 3600) {
      hours = (_timestamp / 3600).floor();
      _timestamp -= hours * 3600;
    }
    if (_timestamp >= 60) {
      min = (_timestamp / 60).floor();
      _timestamp -= min * 60;
    }
    sec = _timestamp.toInt();
    return CurrentRemainingTime(days: days, hours: hours, min: min, sec: sec);
  }

  start() {
    stop();
    _diffTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      value = max(value - 1000, 0);
      if (value <= 0) {
        stop();
      }
    });
  }

  stop() {
    _diffTimer?.cancel();
  }

  @override
  void dispose() {
    _diffTimer?.cancel();
    super.dispose();
  }
}
