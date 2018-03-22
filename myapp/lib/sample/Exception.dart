import 'package:analyzer/exception/exception.dart';

void main() {
  List<int> fixedLengthList = new List<int>(5);

  fixedLengthList[0] = 2;
  print("$fixedLengthList, =================修改数组第一项的值");

  // 错误修改，不可变数组不能更改长度，以下会报错
  try {
    fixedLengthList.add(0);
    fixedLengthList.length = 6;
    print("$fixedLengthList, =================修改数组");
  } on MyException catch(e) {
    throw '自定义异常';
  } on UnsupportedError {
    print("$fixedLengthList, =================捕获不支持的操作异常");
  } catch (e) {
    print("$fixedLengthList, =================捕获所有异常 $e");
  } finally {
    print("$fixedLengthList, =================不管有没有发生异常，我都执行");
  }
}

class MyException extends Error {
  String error;

  MyException(this.error);

  @override
  String toString() {
    return 'catch error';
  }
}