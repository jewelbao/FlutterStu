import 'package:flutter/material.dart';
import 'package:myapp/OfficialSample.dart';
import 'package:myapp/widget/product.dart';
import 'package:myapp/util/custom_lib.dart';  // 自定义库导入
import 'package:english_words/english_words.dart';


void main() {

  printPI(); // 库函数调用
  printTool(); // 库函数调用
  printUtil(); // 库函数调用

//  _runHomeApp(new TutorialHome());
  _runHomeApp(new ShoppingList(
    products: generateWordPairs().take(100).map((wordPair){
      return new Product(name: wordPair.asPascalCase);
    }).toList(),
  ));
}


void _runHomeApp(Widget homeWidget) {
  runApp(new MaterialApp(
    title: 'Flutter Demo',
    theme: new ThemeData(
      primaryColor: Colors.white,
    ),
    home: homeWidget,
  ));
}

