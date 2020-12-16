## CountdownTimer
A simple flutter countdown timer component.

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  flutter_countdown_timer: ^1.6.0
```
Install it
```yaml
$ flutter pub get
```
## CountdownTimer
| name                      | description                                                                                                                                                            |
| ------------------------- | ----------------------------------------------------------------- |
| emptyWidget               | The widget displayed at the end of the countdown                  |
| widgetBuilder             | Widget Function(BuildContext context, CurrentRemainingTime time)  |
| wcontroller               | CountdownTimer start and dispose controller                       |

## CountdownTimerController
| name                      | description                                                                                                                                                            |
| ------------------------- | ----------------------------------------------------------------- |
| endTime                   | Countdown end time stamp                                          |
| onEnd                     | Countdown end event                                               |


## Example
Now in your Dart code, you can use:
```dart
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
```
## Countdown
```
CountdownController countdownController = CountdownController(duration: Duration(minutes: 1));


Scaffold(
      body: Center(
        child: Countdown(countdownController: countdownController),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(countdownController.isRunning ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          if(!countdownController.isRunning) {
          ///start
            countdownController.start();
          } else {
          ///pause
            countdownController.stop();
          }
          setState(() {
            ///change icon
          });
        },
      ),
    )
```
![countdown.gif](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example/countdown.gif)

![000.gif](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/001.gif)

![./example_2.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_2.jpg)
![/example_0.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_0.jpg)

![example_1.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_1.jpg)
![000.gif](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/000.gif)

