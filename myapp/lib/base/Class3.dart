// 抽象方法、getter和setter示例
void main() {
  var rect = new Rectangle(0, 0, 100, 50);
  print(rect.right);
  rect.bottom = 20;
  print(rect.top);

  var rect2 = new RectSample(0, 0, 100, 50);
  print(rect2.right);
  rect2.bottom = 20;
  print(rect2.top);

  var rect3 = new RectSample2(0, 0, 100, 50);
  print(rect3.right);
  rect3.bottom = 20;
  print(rect3.top);

}

/// getter和setter是特殊的方法，可以读写访问对象的属性，每个实例变量都有一个隐式的getter，适当的加上一个setter，可以通过实现getter和setter创建附加属性，使用get和set关键词
class Rectangle {
  int left;
  int top;
  int width;
  int height;

  Rectangle(this.left, this.top, this.width, this.height);

  int get right => left + width;

  set right(int value) => left = value - width;

  int get bottom => top + height;

  set bottom(int value) => top = value - height;
}

/// 抽象类--用abstract关键字修饰类class关键字
abstract class AbstractRect {

  int left;
  int top;
  int width;
  int height;

  AbstractRect(this.left, this.top, this.width, this.height);

  int get right;

  set right(int value);

  int get bottom;

  set bottom(int value) => top = value - height;

  AbstractRect getRect();
}

/// 实例、getter和setter方法可以是抽象的，抽象方法使用分号 ; 而不是方法体
class RectSample extends AbstractRect {

  RectSample(int left, int top, int width, int height)
      : super(left, top, width, height);

  @override
  int get right => left + width;

  @override
  set right(int value) => left = value - width;

  @override
  int get bottom => top + height;

  @override
  AbstractRect getRect() {
    return new RectSample(0, 0, 100, 100);
  }
}

/// 抽象方法--external修饰
class Rect {

  int left;
  int top;
  int width;
  int height;

  Rect(this.left, this.top, this.width, this.height);

  external int get right;

  external set right(int value);

  external  int get bottom ;

  set bottom(int value) => top = value - height;

  external AbstractRect getRect();
}

class RectSample2 extends Rect {

  RectSample2(int left, int top, int width, int height) : super(left, top, width, height);

  @override
  int get right => left + width;

  @override
  set right(int value) {
    left = value - width;
  }

  @override
  int get bottom => top + height;

  @override
  set bottom(int value) {
    top = value - height;
  }
}