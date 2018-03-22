// 类的继承和隐式接口

void main() {
  print(greetBob(new Person('jewel')));
  print(greetBob(new Imposter()));
  print(greetBob(new FuncPerson('jewel')));
}

greetBob(Person person) => person.greet('bob');

class Person {
  final name;

  Person(this.name);

  String greet(who) => 'Hello $who. I am $name';
}

/// 每个类都有一个隐式定义的接口，所以可以用implements声明一个新类
class Imposter implements Person {

  final name = '';

  @override
  String greet(who) {
    return 'Hi $who. I am $name';
  }
}

class FuncPerson extends Person {

  FuncPerson(name) : super(name);

  String greet(who);
}