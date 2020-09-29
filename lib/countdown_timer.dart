library flutter_countdown_timer;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef CountdownTimerWidgetBuilder = Widget Function(
    BuildContext context, CurrentRemainingTime time);

/// A Countdown.
class CountdownTimer extends StatefulWidget {
  final int endTime;
  final Widget daysSymbol;
  final Widget hoursSymbol;
  final Widget minSymbol;
  final Widget secSymbol;
  final TextStyle textStyle;
  final VoidCallback onEnd;
  final Widget emptyWidget;
  final CountdownTimerWidgetBuilder widgetBuilder;

  CountdownTimer({
    Key key,
    this.endTime,
    this.daysSymbol = const Text("天"),
    this.hoursSymbol = const Text(":"),
    this.minSymbol = const Text(":"),
    this.secSymbol = const Text(""),
    this.textStyle = const TextStyle(fontSize: 20, color: Colors.black),
    this.onEnd,
    this.emptyWidget = const Center(
      child: Text('The current time has expired'),
    ),
    this.widgetBuilder,
  }) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountdownTimer> {
  CurrentRemainingTime currentRemainingTime = CurrentRemainingTime();

  Timer _diffTimer;

  VoidCallback get onEnd => widget.onEnd;

  TextStyle get textStyle => widget.textStyle;

  Widget get emptyWidget => widget.emptyWidget;

  Widget get daysSymbol => widget.daysSymbol;

  Widget get hoursSymbol => widget.hoursSymbol;

  Widget get minSymbol => widget.minSymbol;

  Widget get secSymbol => widget.secSymbol;

  CountdownTimerWidgetBuilder get widgetBuilder =>
      widget.widgetBuilder ?? builderCountdownTimer;

  @override
  void initState() {
    timerDiffDate();
    super.initState();
  }

  @override
  void didUpdateWidget(CountdownTimer oldWidget) {
    if (oldWidget.endTime != widget.endTime) {
      timerDiffDate();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widgetBuilder(context, currentRemainingTime);
  }

  Widget builderCountdownTimer(
      BuildContext context, CurrentRemainingTime time) {
    return DefaultTextStyle(
      style: textStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: timeListBuild(time),
      ),
    );
  }

  timeListBuild(CurrentRemainingTime time) {
    List<Widget> list = [];
    print('time: $time');
    if (time == null || time.isEnd) {
      list.add(emptyWidget);
      return list;
    }
    if (time.days != null) {
      var days = _getNumberAddZero(time.days);
      list.add(Text(days));
      list.add(daysSymbol);
    }
      var hours = _getNumberAddZero(time.hours ?? 0);
      list.add(Text(
        hours,
      ));
      list.add(hoursSymbol);
      var min = _getNumberAddZero(time.min ?? 0);
      list.add(Text(min));
      list.add(minSymbol);
      var sec = _getNumberAddZero(time.sec??0);
      list.add(Text(sec));
      list.add(secSymbol);
    return list;
  }

  String _getNumberAddZero(int number) {
    assert(number != null);
    if (number < 10) {
      return "0" + number.toString();
    }
    return number.toString();
  }

  void checkDateEnd(CurrentRemainingTime data) {
    if (data == null || data.isEnd) {
      onEnd?.call();
      disposeDiffTimer();
    }
  }

  CurrentRemainingTime getDateData() {
    if (widget.endTime == null) return null;
    int diff = ((widget.endTime - DateTime.now().millisecondsSinceEpoch) / 1000)
        .floor();
    if (diff < 0) {
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

  timerDiffDate() {
    CurrentRemainingTime data = getDateData();
    setState(() {
      currentRemainingTime = data;
    });
    disposeDiffTimer();
    if (data == null) {
      return null;
    }
    const period = const Duration(seconds: 1);
    _diffTimer = Timer.periodic(period, (timer) {
      //到时回调
      CurrentRemainingTime data = getDateData();
      setState(() {
        currentRemainingTime = data;
      });
      checkDateEnd(data);
      if (data == null) {
        disposeDiffTimer();
      }
    });
  }

  @override
  void dispose() {
    disposeDiffTimer();
    super.dispose();
  }

  disposeDiffTimer() {
    _diffTimer?.cancel();
    _diffTimer = null;
  }
}

class CurrentRemainingTime {
  final int days;
  final int hours;
  final int min;
  final int sec;

  bool get isEnd => days == null && hours == null && min == null && sec == null;

  CurrentRemainingTime({this.days, this.hours, this.min, this.sec});

  @override
  String toString() {
    return 'CurrentRemainingTime{days: $days, hours: $hours, min: $min, sec: $sec}';
  }
}
