// 使用with关键字后面跟着一个或多个扩展类名
// 要实现扩展类，创建一个没有构造函数，没有父类调用的类

void main() {
  var student = new Student('jewel');
}

class Person {
  String name;

  Person(this.name);

  Person.fromJson(Map json) : name = json['name'];
}

/// 可作为扩展类使用,因为没有构造函数和父类调用的类
abstract class Behavior {
  String action;

  void analysisAction() {
    print('action is $action');
  }
}

/// 可作为扩展类使用,因为没有构造函数和父类调用的类
class Feature {
  String feature;

  void analysisFeature() {
    print('feature is $feature');
  }
}

/// 不可作为扩展类使用，因为使用了构造函数
class Func {
  String func;

  Func(this.func);
}

/// 不可作为扩展类使用，因为使用了构造函数
class Func2 {

  String func2;

  Func2.from(this.func2);
}

/// 不可作为扩展类使用，因为有父类调用的类
class Func3 extends Func2 {

  Func3.from(String func2) : super.from(func2);

}


/// 使用with实现多个扩展类
class Student extends Person with Behavior, Feature {

  Student(String name, {String action, String feature}) : super(name) {
    this.action = action;
    this.feature = feature;
    analysisAction();
    analysisFeature();
  }

  Student.fromJson(Map json) : super.fromJson(json) {
    action = json['action'];
    feature = json['feature'];
  }

  @override
  void analysisAction() {
    print('$name\'s action is $action');
  }
}