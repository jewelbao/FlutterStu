// 枚举类型

void main() {
  // 获得枚举值在列表的位置
  print(Color.red.index);
  print(Color.green.index);
  print(Color.blue.index);

  // 获得枚举值的列表
  List<Color> colors = Color.values;
  print(colors[2].toString());
  print(colors[0].runtimeType);

  Color color = Color.blue;
  switch (color) {
    case Color.red:
      print('color is red');
      break;
    case Color.blue:
      print('color is blue');
      break;
    default:
      print('color is green');
      break;
  }
}

enum Color {
  red,
  green,
  blue
}


