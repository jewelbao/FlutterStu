// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.Func

import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/sample/Function.dart';

void main() {

  Func fun = new Func();

  testWidgets('函数定义等价语法 test', (WidgetTester tester) async {
    print('函数定义等价语法');
    fun.sample1();
  });

  testWidgets('函数可选参数语法 test', (WidgetTester tester) async {
    print('函数可选参数语法');
    fun.sample2();
  });

  testWidgets('函数高阶用法 test', (WidgetTester tester) async {
    print('函数高阶用法');
    fun.sample3();
  });

  testWidgets('函数高阶用法--闭包 test', (WidgetTester tester) async {
    print('函数高阶用法--闭包');
    fun.sample4();
  });

  testWidgets('函数高阶用法--类型比较 test', (WidgetTester tester) async {
    print('函数高阶用法--类型比较');
    fun.sample5();
  });

  testWidgets('函数高阶用法--类型检查 test', (WidgetTester tester) async {
    print('函数高阶用法--类型检查');
    fun.sample6();
  });
}