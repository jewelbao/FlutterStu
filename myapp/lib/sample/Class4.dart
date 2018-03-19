/// 重写运算符:<、+、|、[]、>、/、^、[]=、<= 、~/、&、~、>=、*、<<、==、– 、%、>>


void main() {
  final vector1 = new Vector(2, 3);
  final vector2 = new Vector(1, 1);

  print(vector1.x == 2 && vector1.y == 3);

  var vector3 = vector1 + vector2;
  var vector4 = vector1 + vector2;
  print(vector3.x == 2 && vector3.y == 4);
  print(vector3.x == 3 && vector3.y == 4);
  print(vector3 == vector4);

  var vector5 = -vector1;
  print(vector5.toString());

  var vector6 = vector1 - vector2;
  print(vector6.toString());
}

class Vector {
  final int x;
  final int y;

  const Vector(this.x, this.y);

  /// 重写 + 算术运算符
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  /// 重写 - 运算符
  Vector operator -() {
    return new Vector(-x, -y);
  }

  /// 重写 - 算术运算符
  operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }

  @override
  String toString() {
    return '{$x, $y}';
  }

}