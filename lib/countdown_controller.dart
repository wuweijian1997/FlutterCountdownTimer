import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownController extends ValueNotifier<int> {
  CountdownController({
    int? timestamp,
    Duration? duration,
    this.stepDuration = const Duration(milliseconds: 1000),
  })  : assert((timestamp != null && timestamp > 0) || duration != null),
        super((timestamp ?? duration?.inMilliseconds)!);
  Timer? _diffTimer;
  int? _lastTimestamp;
  int? _lostTime;
  final Duration stepDuration;

  bool get isRunning => _diffTimer != null;

  CurrentRemainingTime get currentRemainingTime {
    int? days, hours, min, sec;
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

  Duration get currentDuration {
    return Duration(milliseconds: value);
  }

  ///start
  start() {
    if (value <= 0) return;
    _dispose();
    Duration duration = _getDuration();
    if(duration == stepDuration) {
      _diffTimer = Timer.periodic(stepDuration, (Timer timer) {
        _diffTime(stepDuration);
      });
    } else {
      Future.delayed(duration, () {
        _diffTime(duration);
        _diffTimer = Timer.periodic(stepDuration, (Timer timer) {
          _diffTime(stepDuration);
        });
      });
    }
  }

  _diffTime(Duration duration) {
    value = max(value - duration.inMilliseconds, 0);
    _lastTimestamp = DateTime.now().millisecond;
    if (value <= 0) {
      stop();
      return;
    }
  }

  ///pause
  stop() {
    if (_lastTimestamp != null && value > 0) {
      _lostTime = DateTime.now().millisecond - _lastTimestamp!;
    }
    _dispose();
  }

  Duration _getDuration() {
    if (_lostTime != null && _lostTime! > 0 && _lostTime! < 1000) {
      return Duration(milliseconds: 1000 - _lostTime!);
    }
    return stepDuration;
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  _dispose() {
    _diffTimer?.cancel();
    _diffTimer = null;
  }
}
