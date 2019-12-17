library flutter_package;

import 'dart:async';

import 'package:flutter/widgets.dart';

/// A Countdown.
class CountdownTimer extends StatefulWidget {
  final int endTime;
  final String defaultDays;
  final String defaultHours;
  final String defaultMin;
  final String defaultSec;
  final String daysSymbol;
  final String hoursSymbol;
  final String minSymbol;
  final String secSymbol;
  final TextStyle textStyle;
  final TextStyle daysTextStyle;
  final TextStyle hoursTextStyle;
  final TextStyle minTextStyle;
  final TextStyle secTextStyle;
  final TextStyle daysSymbolTextStyle;
  final TextStyle hoursSymbolTextStyle;
  final TextStyle minSymbolTextStyle;
  final TextStyle secSymbolTextStyle;

  CountdownTimer({
    this.endTime,
    this.defaultDays = "--",
    this.defaultHours = "--",
    this.defaultMin = "--",
    this.defaultSec = "--",
    this.daysSymbol = "天",
    this.hoursSymbol = ":",
    this.minSymbol = ":",
    this.secSymbol = "",
    this.textStyle,
    this.daysTextStyle,
    this.hoursTextStyle,
    this.minTextStyle,
    this.secTextStyle,
    this.daysSymbolTextStyle,
    this.hoursSymbolTextStyle,
    this.minSymbolTextStyle,
    this.secSymbolTextStyle,
  });

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountdownTimer> {
  DiffDate diffDate;
  Timer _diffTimer;
  final defaultTextStyle = TextStyle(fontSize: 20);

  DiffDate getDateData() {
    if (widget.endTime == null) return null;
    var diff = (widget.endTime - DateTime.now().millisecondsSinceEpoch) / 1000;
    if (diff <= 0) {
      return null;
    }
    int days, hours, min, sec = 0;
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
    return DiffDate(days: days, hours: hours, min: min, sec: sec);
  }

  @override
  void initState() {
    timerDiffDate();
    super.initState();
  }

  timerDiffDate() {
    DiffDate data = getDateData();
    if (data != null) {
      setState(() {
        diffDate = data;
      });
    } else {
      return null;
    }
    const period = const Duration(seconds: 1);
    _diffTimer = Timer.periodic(period, (timer) {
      //到时回调
      DiffDate data = getDateData();
      if (data != null) {
        setState(() {
          diffDate = data;
        });
      } else {
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

  @override
  void didUpdateWidget(CountdownTimer oldWidget) {
    if (oldWidget.endTime != widget.endTime) {
      timerDiffDate();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${diffDate?.days ?? widget.defaultDays}',
          style: _getTextStyle(widget.daysTextStyle),
        ),
        Text(
          widget.daysSymbol,
          style: _getTextStyle(widget.daysSymbolTextStyle),
        ),
        Text(
          '${diffDate?.hours ?? widget.defaultHours}',
          style: _getTextStyle(widget.hoursTextStyle),
        ),
        Text(
          widget.hoursSymbol,
          style: _getTextStyle(widget.hoursSymbolTextStyle),
        ),
        Text(
          '${diffDate?.min ?? widget.defaultMin}',
          style: _getTextStyle(widget.minTextStyle),
        ),
        Text(
          widget.minSymbol,
          style: _getTextStyle(widget.minSymbolTextStyle),
        ),
        Text(
          '${diffDate?.sec ?? widget.defaultSec}',
          style: _getTextStyle(widget.secTextStyle),
        ),
        Text(
          widget.secSymbol,
          style: _getTextStyle(widget.secSymbolTextStyle),
        ),
      ],
    );
  }

  _getTextStyle(textStyle) {
    return textStyle ?? widget.textStyle ?? defaultTextStyle;
  }
}

class DiffDate {
  final int days;
  final int hours;
  final int min;
  final int sec;
  DiffDate({this.days, this.hours, this.min, this.sec});
}
