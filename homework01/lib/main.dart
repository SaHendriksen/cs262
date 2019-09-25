import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int total = 0;
  final value1Controller = TextEditingController();
  final value2Controller = TextEditingController();
  String operatorValue = '+';

  void calculateTotal() {
    setState(() {
      if (operatorValue == '+') {
        total = int.parse(value1Controller.text) + int.parse(value2Controller.text);
      } else if (operatorValue == '-') {
        total = int.parse(value1Controller.text) - int.parse(value2Controller.text);
      } else if (operatorValue == '*') {
        total = int.parse(value1Controller.text) * int.parse(value2Controller.text);
      } else if (operatorValue == '/') {
        total = int.parse(value1Controller.text) ~/ int.parse(value2Controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Value 1:"),
                keyboardType: TextInputType.number,
                controller: value1Controller,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Value 2:"),
                keyboardType: TextInputType.number,
                controller: value2Controller,
              ),
              DropdownButton<String>(
                value: operatorValue,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    color: Colors.deepPurple
                ),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    operatorValue = newValue;
                  });
                },
                items: <String>['+', '-', '*', '/']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                        'Calculate'
                    ),
                    onPressed: () {
                      calculateTotal();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: 10 ),
                  ),
                  Text(
                    total.toString(),
                    style: TextStyle(
                        fontSize: 24
                    ),
                  )
                ],
              )
            ],
          ),
        )
      );
  }
}
