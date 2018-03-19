import 'dart:math';

/// 类与方法
void main() {
  var point = new Point.fromJson({'x': 2});
  print(point.toString());

  point = new Point.X(1);
  print(point.toString());

  point = new Point(1, 2);
  print(point.toString());

  var point2 = new Point.fromJsonWithInit({});
  print(point2.toString());
  print(point2.distanceTo(point));

  var pointChild = new PointChild(1, 2, 3);
  print(pointChild.toString());

  pointChild = new PointChild.fromJson({'x': 3, 'y': 2});
  print(pointChild.toString());

  pointChild.z = 3;
  print(pointChild.toString());

  var pointChild2 = new PointChild.fromJson({});
  print(pointChild2.toString());

  var iPoint = new ImmutablePoint(x: 1, y: 1);
  print(iPoint.toString());

  var iPoint2 = ImmutablePoint.origin;
  print(iPoint2.toString());
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  /// 重定向构造函数
  Point.X(int x) : this(x, 0);

  /// 命名构造函数
  Point.fromJson(Map json) {
    x = json['x'] == null ? 0 : json['x'];
    y = json['y'] == null ? 0 : json['y'];
  }

  /// 命名构造函数--初始化实例变量
  Point.fromJsonWithInit(Map json)
      : x = json['x'] == null ? 0 : json['x'],
        y = json['y'] == null ? 0 : json['y'];


  double distanceTo(Point other) {
    int dx = x - other.x;
    int dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  @override
  String toString() {
    return '{x=$x, y=$y}';
  }
}

/// 子类构造函数调用父类默认构造函数
class PointChild extends Point {

  var z;

  /// 调用父类默认构造函数
  PointChild(x, y, this.z) : super(x, y);

  /// 调用父类默认构造函数
  PointChild.fromJson(Map json) : super.fromJson(json) {
    z = json['z'] == null ? '无' : json['z'];
  }

  @override
  String toString() {
    return '{x=$x, y=$y, z=$z}';
  }
}

/// 定义一个const构造函数并确保所有实例变量是final的，那么类生成的对象永远不会改变，可以让这些对象变成编译时常量
class ImmutablePoint {
  final int x; // 构造函数后不可变更
  final int y; // 构造函数后不可变更

  const ImmutablePoint({this.x, this.y});

  static final ImmutablePoint origin = const ImmutablePoint(x: 0, y: 0);

  @override
  String toString() {
    return '{x=$x, y=$y}';
  }
}

class ImmutablePoint2 {
  final int x; // 构造函数后不可变更
  final int y; // 构造函数后不可变更

  int z; // 构造函数后仍可变更

  ImmutablePoint2(this.x, this.y, this.z);

  static final ImmutablePoint2 origin = new ImmutablePoint2(0, 0, 0);

  @override
  String toString() {
    return '{x=$x, y=$y}';
  }
}