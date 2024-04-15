import 'dart:math';

void main() {
  var p = Point(2, 2);

  // Get the value of y.
  assert(p.y == 2);

  // Invoke distanceTo() on p.
  double distance = p.distanceTo(Point(4, 4));

  // If p is non-null, set a variable equal to its y value.
  var a = p?.y;

  var p1 = Point(2, 2);
  var p2 = Point.fromJson({'x': 1, 'y': 2});

  var p3 = const ImmutablePoint(2, 2);

  var a1 = const ImmutablePoint(1, 1);
}

class Point {
  double? x; // Declare instance variable x,initially null.
  double? y; // Declare y, initially null.
  double z = 0;

  Point(this.x, this.y);

  double distanceTo(Point point) {
    return sqrt(x! * x! + y! * y!);
  }

  static fromJson(Map<String, int> map) {} // Declare z,initially 0.
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
