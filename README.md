## CountdownTimer
A simple flutter countdown timer component.
## Example
```
Countdown(endTime: 1576839556732); // timestamp
```
![./example_2.png](/example_2.png)

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
![/example_0.png](/example_0.png)

![example_1.png](/example_1.png)

