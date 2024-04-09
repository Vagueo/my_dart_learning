// 延迟初始化变量
late String description;
// This is the program's only call to readThermometer().
late String temperature = readThermometer(); // Lazily initialized.

void main() {
  // 创建并初始化变量
  var name = 'Bob';
  Object name1 = 'Bob';
  String name2 = 'Bob';

  // 空安全
  String? name3;
  String name4;

  // 默认值
  int? lineCount;
  assert(lineCount == null);

  int lineCount1 = 0; // 对于空安全，必须在使用非空变量之前初始化它们的值

  int lineCount2;
  bool weLikeToCount = false;
  if (weLikeToCount) {
    lineCount2 = countLines();
  } else {
    lineCount2 = 0;
  }
  print(lineCount2);

  // 延迟初始化变量
  description = 'Feijoada!';
  print(description);

  // 终值和常量
  final name5 = 'Bob';
  final String nickname = 'Boddy';

  const bar = 1000000;
  const double atm = 1.01325 * bar;

  var foo = const [];
  final bar1 = const [];
  const baz = []; // Equivalent to `const []`
  foo = [1, 2, 3]; // Was const []

  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
}

int countLines() {
  return 10;
}
// 延迟初始化变量
String readThermometer() {
  return "37.5℃";
}
