void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  // 一级对象的函数
  var list = [1, 2, 3];
  // Pass printElement as a parameter.
  list.forEach(printElement);
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}

void printElement(int element) {
  print(element);
}
