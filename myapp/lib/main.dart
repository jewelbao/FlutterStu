import 'package:flutter/material.dart';
import 'package:myapp/OfficialSample.dart';
import 'package:myapp/util/custom_lib.dart';  // 自定义库导入

void main() {

  printPI(); // 库函数调用
  printTool(); // 库函数调用
  printUtil(); // 库函数调用

  runApp(new MaterialApp(
    title: 'Flutter Demo',
    theme: new ThemeData(
      primaryColor: Colors.white,
    ),
    home: new TutorialHome(),
  ));
}

