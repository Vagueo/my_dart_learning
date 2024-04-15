void main() {
  int.parse('42');
  '42'.parseInt();
  print('42'.parseInt()); // Use an extension method.

  print('42'.padLeft(5)); // Use a String method.
  print('42'.parseInt()); // Use an extension method.

  dynamic d = '2';
  print(d.parseInt()); // Runtime exception: NoSuchMethodError

  var v = '2';
  print(v.parseInt()); // Output: 2
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

// 不愿意透露姓名的扩展
extension on String {
  bool get isBlank => trim().isEmpty;
}

// 泛型扩展
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
