// 静态变量和方法

void main() {
  var color = new Color('blue');
  print(Color.red.name);
  print(Color.equalColor(color, 'blue'));
  print(Color.equalColor(color.name, 'blue'));
}


class Color {

  /// 不可变的实例变量
  final String name;
  /// 构造常量函数
  const Color(this.name);
  /// 静态常量
  static const red = const Color('red');

  /// 静态方法
  static bool equalColor(c1, c2) {
    return c1 == c2;
  }
}


