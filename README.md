## CountdownTimer
A simple flutter countdown timer component.

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  flutter_countdown_timer: ^1.4.0
```
Install it
```yaml
$ flutter pub get
```
##
| name                      | description                                                                                                                                                            |
| ------------------------- | ----------------------------------------------------------------- |
| endTime                   | Countdown end time stamp                                          |
| onEnd                     | Countdown end event                                               |
| emptyWidget               | The widget displayed at the end of the countdown                  |
| daysSymbol                | final Widget daysSymbol                                           |
| hoursSymbol               | final Widget hoursSymbol                                          |
| minSymbol                 | final Widget minSymbol                                            |
| secSymbol                 | final Widget secSymbol                                            |
| textStyle                 | final TextStyle textStyle                                         |
| widgetBuilder             | Widget Function(BuildContext context, CurrentRemainingTime time)  |


## Example
Now in your Dart code, you can use:
```dart
@override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountdownTimer(
            endTime: endTime,
          ),
          CountdownTimer(
            endTime: endTime,
            textStyle: TextStyle(fontSize: 30, color: Colors.pink),
          ),
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
              return Text(
                  'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
            },
          ),
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (BuildContext context, CurrentRemainingTime time) {
              List<Widget> list = [];
              if(time.days != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_dissatisfied),
                    Text(time.days.toString()),
                  ],
                ));
              }
              if(time.hours != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_satisfied),
                    Text(time.hours.toString()),
                  ],
                ));
              }
              if(time.min != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_dissatisfied),
                    Text(time.min.toString()),
                  ],
                ));
              }
              if(time.sec != null) {
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
    );
  }
```
<img src="./001.gif" height="600">
<img src="./example_2.jpg" height="600">
<img src="./example_0.jpg" height="600">
<img src="./example_1.jpg" height="600">
<img src="./000.gif" height="600">

