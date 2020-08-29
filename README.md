## CountdownTimer
A simple flutter countdown timer component.

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  flutter_countdown_timer: ^1.1.0
```
Install it
```yaml
$ flutter pub get
```
##
| name                       | description                                                                                                                                                            |
| ------------------------- | ------------------------------------------------------------- |
| endTime                   | Countdown end time stamp                                      |
| onEnd                     | Countdown end event                                           |
| emptyWidget               | The widget displayed at the end of the countdown              |
| defaultDays               | String defaultDays                                            |
| defaultHours              | String defaultHours                                           |
| defaultMin                | String defaultMin                                             |
| defaultSec                | final String defaultSec                                       |
| daysSymbol                | final String daysSymbol                                       |
| hoursSymbol               | final String hoursSymbol                                      |
| minSymbol                 | final String minSymbol                                        |
| secSymbol                 | final String secSymbol                                        |
| textStyle                 | final TextStyle textStyle                                     |
| daysTextStyle             | final TextStyle daysTextStyle                                 |
| hoursTextStyle            | final TextStyle hoursTextStyle                                |
| minTextStyle              | final TextStyle minTextStyle                                  |
| secTextStyle              | final TextStyle secTextStyle                                  |
| daysSymbolTextStyle       | final TextStyle daysSymbolTextStyle                           |
| hoursSymbolTextStyle      | final TextStyle hoursSymbolTextStyle                          |
| minSymbolTextStyle        | final TextStyle minSymbolTextStyle                            |
| secSymbolTextStyle        | final TextStyle secSymbolTextStyle                            |


## Example
Now in your Dart code, you can use:
```dart
import 'package:flutter_countdown_timer/countdown_timer.dart';

  ...
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60;
  ...
  
  CountdownTimer(endTime: endTime),
  CountdownTimer(endTime: endTime,
    onEnd: (){
    print("Game Over");
    },
  ),
  CountdownTimer(
    endTime: endTime,
    textStyle: TextStyle(fontSize: 30, color: Colors.orange),
  ),
  CountdownTimer(
    endTime: endTime,
    defaultDays: "==",
    defaultHours: "--",
    defaultMin: "**",
    defaultSec: "++",
    daysSymbol: "days",
    hoursSymbol: "h ",
    minSymbol: "m ",
    secSymbol: "s",
    daysTextStyle: TextStyle(fontSize: 20, color: Colors.red),
    hoursTextStyle:
        TextStyle(fontSize: 30, color: Colors.orange),
    minTextStyle:
        TextStyle(fontSize: 40, color: Colors.lightBlue),
    secTextStyle: TextStyle(fontSize: 50, color: Colors.pink),
    daysSymbolTextStyle:
        TextStyle(fontSize: 25, color: Colors.green),
    hoursSymbolTextStyle:
        TextStyle(fontSize: 35, color: Colors.amberAccent),
    minSymbolTextStyle:
        TextStyle(fontSize: 45, color: Colors.black),
    secSymbolTextStyle:
        TextStyle(fontSize: 55, color: Colors.deepOrange),
```

onEnd => End of time trigger

example 01
```
Countdown(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60); // timestamp
```
![./example_2.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_2.jpg)

example 02
```
Countdown(
    endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
    defaultDays: "==",
    defaultHours: "--",
    defaultMin: "**",
    defaultSec: "++",
    daysSymbol: "days",
    hoursSymbol: "h ",
    minSymbol: "m ",
    secSymbol: "s",
    daysTextStyle: TextStyle(fontSize: 20, color: Colors.red),
    hoursTextStyle: TextStyle(fontSize: 30, color: Colors.orange),
    minTextStyle: TextStyle(fontSize: 40, color: Colors.lightBlue),
    secTextStyle: TextStyle(fontSize: 50, color: Colors.pink),
    daysSymbolTextStyle: TextStyle(fontSize: 25, color: Colors.green),
    hoursSymbolTextStyle: TextStyle(fontSize: 35, color: Colors.amberAccent),
    minSymbolTextStyle: TextStyle(fontSize: 45, color: Colors.black),
    secSymbolTextStyle: TextStyle(fontSize: 55, color: Colors.deepOrange),
),
```
![/example_0.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_0.jpg)

![example_1.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_1.jpg)
![000.gif](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/000.gif)

