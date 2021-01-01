import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownTimerPage extends StatefulWidget {
  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  CountdownTimerController controller;
  @override
  void initState() {
    super.initState();
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountdownTimer(
            textStyle: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
            controller: controller,
          ),
          CountdownTimer(
            controller: controller,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {
                return Text('Game over');
              }
              return Text(
                  'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
            },
          ),
          CountdownTimer(
            controller: controller,
            widgetBuilder: (BuildContext context, CurrentRemainingTime time) {
              if (time == null) {
                return Text('Game over');
              }
              List<Widget> list = [];
              if (time.days != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_dissatisfied),
                    Text(time.days.toString()),
                  ],
                ));
              }
              if (time.hours != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_satisfied),
                    Text(time.hours.toString()),
                  ],
                ));
              }
              if (time.min != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_dissatisfied),
                    Text(time.min.toString()),
                  ],
                ));
              }
              if (time.sec != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied),
                    Text(time.sec.toString()),
                  ],
                ));
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop),
        onPressed: () {
          onEnd();
          controller.disposeTimer();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
