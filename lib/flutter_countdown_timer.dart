import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/index.dart';

typedef CountdownTimerWidgetBuilder = Widget Function(
    BuildContext context, CurrentRemainingTime time);

/// A Countdown.
class CountdownTimer extends StatefulWidget {
  final Widget emptyWidget;
  final CountdownTimerWidgetBuilder widgetBuilder;
  final CountdownTimerController controller;
  final TextStyle textStyle;

  CountdownTimer({
    Key key,
    this.emptyWidget = const Center(
      child: Text('The current time has expired'),
    ),
    this.widgetBuilder,
    @required this.controller,
    this.textStyle,
  }) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountdownTimer> {
  CurrentRemainingTime get currentRemainingTime =>
      controller.currentRemainingTime;

  Widget get emptyWidget => widget.emptyWidget;

  CountdownTimerWidgetBuilder get widgetBuilder =>
      widget.widgetBuilder ?? builderCountdownTimer;

  CountdownTimerController get controller => widget.controller;
  TextStyle get textStyle => widget.textStyle;

  @override
  void initState() {
    super.initState();
    if (controller.isRunning == false) {
      controller.start();
    }
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widgetBuilder(context, currentRemainingTime);
  }

  Widget builderCountdownTimer(
      BuildContext context, CurrentRemainingTime time) {
    if (time == null) {
      return emptyWidget;
    }
    String value = '';
    if (time.days != null) {
      var days = _getNumberAddZero(time.days);
      value = '$value$days days ';
    }
    var hours = _getNumberAddZero(time.hours ?? 0);
    value = '$value$hours : ';
    var min = _getNumberAddZero(time.min ?? 0);
    value = '$value$min : ';
    var sec = _getNumberAddZero(time.sec ?? 0);
    value = '$value$sec';
    return Text(value, style: textStyle,);
  }

  String _getNumberAddZero(int number) {
    assert(number != null);
    if (number < 10) {
      return "0" + number.toString();
    }
    return number.toString();
  }
}
