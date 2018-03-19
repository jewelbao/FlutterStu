/// 函数语法
class Func {

  final dynamic tip = '等价写法';
  final name = 'kevin';

  /// 函数定义等价语法
  void sample1() {
    printA(tip);
    printB(tip);
    printC(tip);
    printD(tip);
  }

  /// 函数可选参数语法
  sample2() {
    printName(name: name, age: 18);
    printName(name: name, sex: "male", age: 19);
    printName2(name);
    printName2(name, age: 20);
    printName3(name);
    printName3(name, 20);
//    printName3(name, "xxx", 20); // 位置参数指定了每个参数的位置，不可随意更改
  }

  /// 函数高阶用法
  sample3() {
    func();
    func2();
  }

  /// 函数高阶用法--闭包
  sample4() {
    Function add2 = add(2);
    Function add4 = add(4);

    print(add2(1));
    print(add4(1));
  }

  /// 函数高阶用法--类型比较
  sample5() {
    judge();
  }

  /// 函数高阶用法--类型检查
  sample6() {
    classJudge();
  }

  // ===================================函数定义等价语法=========================== //
  void printA(String tip) {
    print("the tip is $tip");
  }

  void printB(tip) {
    print("the tip is $tip");
  }

  void printC(String tip) => print("the tip is $tip");

  printD(tip) => print("the tip is $tip");

  // ==============================函数可选参数语法=========================== //
  /// 可选参数函数，其参数位置可任意放置但必须指定参数名，具体看本例的sample2函数示例
  void printName({String name, int age, String sex: "female"}) {
    print("my name is $name, $age year old, gender $sex");
  }

  printName2(String name, {age: 18, sex: "female"}) {
    print("my name is $name, $age year old, gender $sex");
  }

  /// 位置参数函数，其参数位置定义后不可随意变更且调用时无需指定参数名，具体看本例的sample2示例
  printName3(String name, [int age, String sex = "female"]) {
    print("my name is $name, $age year old, gender $sex");
  }

  // =============================函数高阶用法 ============================= //
  void func() {
    // 将函数作为参数传递给另一个函数
    List list = ['A', 'B', 'C'];
    list.forEach((msg) => print(msg)); // 原始写法
    list.forEach(printElement); // 高级写法
  }

  printElement(element) {
    print(element);
  }

  void func2() {
    // 将函数分配给一个变量
    var message = (String msg) => "!!!{$msg.toUpperCase()}!!!";
    print(message('hello'));
  }

  // =============================函数高阶用法--闭包 ============================= //
  /// 返回一个函数对象，功能是返回累加的数字
  Function add(int addBy) {
    return (int i) => addBy + i;
  }

  // =============================函数高阶用法--函数判断 ============================= //
  /// 类型比较
  judge() {
    var x;
    // 比较高阶函数
    x = foo;
    print(foo == x);

    // 比较静态方法
    x = SomeClass.bar;
    print(SomeClass.bar == x);

    // 比较实例方法
    var w = new SomeClass();
    var y = new SomeClass();
    var z = y;

    x = y.baz;

    print(z.baz == x);
    print(w.baz != y.baz);
  }

  /// 类型检查
  classJudge() {
    var x;
    var y = new SomeClass();
    x = y;
    if (x is SomeClass) {
      x.printInfo();
    }
    (x as SomeClass).printInfo(); // 此语法等价于上面的if判断

    // 如果类型错误，会报错，所以用try-catch
    try {
      if (x is SomeClass2) {
        x.printInfo();
      }
      (x as SomeClass2).printInfo(); // 此语法等价于上面的if判断
    } catch (e) {
      print(e.toString());
    }
  }

  foo() {}
}

class SomeClass {
  // 一个静态方法
  static void bar() {}

  // 一个实例方法
  void baz() {}

  void printInfo() {
    print('This is SomeClass!');
  }
}

class SomeClass2 {
  // 一个静态方法
  static void bar() {}

  // 一个实例方法
  void baz() {}

  void printInfo() {
    print('This is SomeClass2!');
  }
}