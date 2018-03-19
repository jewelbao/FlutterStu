import 'package:flutter/material.dart';


class Counter extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new CounterState();
  }

}

class CounterState extends State<Counter> {

  int counter = 0;

  void increment() {
    setState(() {
      counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: increment,
        child: new Text('$counter'),
        color: Colors.blue,
        highlightColor: Colors.lightBlue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)));
  }
}

