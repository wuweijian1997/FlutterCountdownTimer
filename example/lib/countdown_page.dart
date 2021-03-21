import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  CountdownController countdownController =
      CountdownController(duration: Duration(minutes: 1));
  bool isRunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Countdown(
            countdownController: countdownController,
            builder: (_, Duration time) {
              return Text(
                '${time.inSeconds}',
                style: TextStyle(fontSize: 80),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isRunning ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          if (!countdownController.isRunning) {
            countdownController.start();
            setState(() {
              isRunning = true;
            });
          } else {
            countdownController.stop();
            setState(() {
              isRunning = false;
            });
          }
        },
      ),
    );
  }
}
