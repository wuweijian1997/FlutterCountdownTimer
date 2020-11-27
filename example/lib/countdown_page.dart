import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  CountdownController countdownController = CountdownController(duration: Duration(minutes: 1));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Countdown(countdownController: countdownController),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(countdownController.isRunning ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          if(!countdownController.isRunning) {
            countdownController.start();
          } else {
            countdownController.stop();
          }
          setState(() {
            ///change icon
          });
        },
      ),
    );
  }
}
