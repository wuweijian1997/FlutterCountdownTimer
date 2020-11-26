import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

Widget _defaultCountdownBuilder(
  BuildContext context,
  CurrentRemainingTime currentRemainingTime,
) {
  String timeText = '';
  if (currentRemainingTime == null) {
    return Text('0');
  }
  if (currentRemainingTime.days != null) {
    timeText = '${currentRemainingTime.days} ';
  }
  if (currentRemainingTime.hours != null) {
    timeText = '$timeText ${currentRemainingTime.hours}:';
  }
  if (currentRemainingTime.min != null) {
    timeText = '$timeText ${currentRemainingTime.min}:';
  }
  if (currentRemainingTime.sec != null) {
    timeText = '$timeText ${currentRemainingTime.sec}';
  }

  return Text('$timeText');
}

class Countdown extends StatefulWidget {
  final CountdownController countdownController;
  final CountdownTimerWidgetBuilder builder;

  Countdown({
    @required this.countdownController,
    this.builder = _defaultCountdownBuilder,
  });

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  CountdownController get countdownController => widget.countdownController;

  @override
  void initState() {
    super.initState();
    countdownController.addListener(() {
      setState(() {});
    });
  }

  CurrentRemainingTime get time => countdownController.currentRemainingTime;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
