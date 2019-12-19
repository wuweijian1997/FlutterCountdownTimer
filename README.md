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

## Example
Now in your Dart code, you can use:
```dart
import 'package:flutter_countdown_timer/countdown_timer.dart';


  CountdownTimer(endTime: 1594829147719),
  CountdownTimer(endTime: 1576682634231, 
    onEnd: (){
    print("Game Over");
    },
  ),
  CountdownTimer(
    endTime: 1594829147719,
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
Countdown(endTime: 1576839556732); // timestamp
```
![./example_2.png](https://github.com/wuweijian1997/FlutterCountdownTimer/blob/master/example_2.jpg)

example 02
```
Countdown(
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

