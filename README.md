## CountdownTimer
A simple flutter countdown timer widget.Count down through the end timestamp,Trigger an event after the countdown ends.

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  flutter_countdown_timer: ^3.0.0
```
Install it
```yaml
$ flutter pub get
```
## CountdownTimer
| name                      | description                                                                                                                                                            |
| ------------------------- | ----------------------------------------------------------------- |
| endWidget               | The widget displayed at the end of the countdown                  |
| widgetBuilder             | Widget Function(BuildContext context, CurrentRemainingTime time)  |
| controller               | CountdownTimer start and dispose controller                       |
| endTime               | Countdown end time stamp                        |
| onEnd                     | Countdown end event                        |
| textStyle                     | Text color                        |

## CountdownTimerController
| name                      | description                                                                                                                                                            |
| ------------------------- | ----------------------------------------------------------------- |
| endTime                   | Countdown end time stamp                                          |
| onEnd                     | Countdown end event                                               |


## Example
### Simple to use
```dart
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

...
CountdownTimer(
  endTime: endTime,
),
```
### Execute event at end.
```dart
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

void onEnd() {
  print('onEnd');
}

...
CountdownTimer(
  endTime: endTime,
  onEnd: onEnd,
),
```
### Use the controller to end the countdown early.
```dart
  CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          CountdownTimer(
              controller: controller,
              onEnd: onEnd,
              endTime: endTime,
          ),
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
### Custom style.
```dart
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {
                return Text('Game over');
              }
              return Text(
                  'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
            },
          ),
      ),
    );
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

