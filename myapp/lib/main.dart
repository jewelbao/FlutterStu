import 'package:flutter/material.dart';
import 'package:myapp/widget/RandomWords.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Demo',
    theme: new ThemeData(
      primaryColor: Colors.white,
    ),
    home: new RandomWords(),
  ));
}

