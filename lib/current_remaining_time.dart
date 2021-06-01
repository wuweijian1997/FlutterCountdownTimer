import 'package:flutter/animation.dart';

class CurrentRemainingTime {
  final int? days;
  final int? hours;
  final int? min;
  final int? sec;
  final Animation<double>? milliseconds;

  CurrentRemainingTime({
    this.days,
    this.hours,
    this.min,
    this.sec,
    this.milliseconds,
  });

  @override
  String toString() =>
      'CurrentRemainingTime{days: $days, hours: $hours, min: $min, sec: $sec, milliseconds: ${milliseconds?.value}';
}
