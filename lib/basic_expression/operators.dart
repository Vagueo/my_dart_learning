import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  // 运算符优先级的示例
  int n = 4, i = 2, d = 3;
  // Parentheses improve readability.
  if ((n % i == 0) && (d % i == 0)) {}

  // Harder to read, but equivalent.
  if (n % i == 0 && d % i == 0) {}

  // 算术运算符的示例
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder
  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  // 自增和自减的示例
  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  assert(a != b); // -1 != 0

  // 等式和关系运算符的示例
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  // Type test operators 型式试验操作员
  var employee;
  (employee as Person).firstName = 'Bob';
  if (employee is Person) {
    // Type check
    employee.firstName = 'Bob';
  }

  // 赋值操作符的示例
  var c = 2; // Assign using =
  c *= 3; // Assign and multiply: c = c * 3
  assert(c == 6);

  // 逻辑运算符的示例
  bool done = false;
  int col = 1;
  if (!done && (col == 0 || col == 3)) {
    // ...Do something...
  }

  // 位和移位运算符的示例
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR

  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right

  // Shift right example that results in different behavior on web
  // because the operand value changes when masked to 32 bits:
  assert((-value >> 4) == -0x03);

  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >>> 4) > 0); // Unsigned shift right

  // 条件表达式的示例
  var isPublic;
  var visibility = isPublic ? 'public' : 'private';

  String playerName(String? name) => name ?? 'Guest';
  /* 上面这条语句可以分别等价于下面这两段代码
  String playerName(String? name) => name != null ? name : 'Guest';

  String playerName(String? name) {
   if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }
  */

  // 级联的符号的示例
  var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  querySelector('#confirm') // Get an object.
    ?..text = 'Confirm' // Use its members.
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'))
    ..scrollIntoView();

  final addressBook = (AddressBookBuilder()
        ..name = 'jenny'
        ..email = 'jenny@example.com'
        ..phone = (PhoneNumberBuilder()
              ..number = '415-555-0100'
              ..label = 'home')
            .build())
      .build();
}

class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName) {
    // Initialization code goes here.
  }
}

// 级联的符号的示例
class Paint {
  late Color color;
  late StrokeCap strokeCap;
  late double strokeWidth;

  Paint() {
    this.color = Colors.black;
    this.strokeCap = StrokeCap.round;
    this.strokeWidth = 5.0;
  }
}

// 级联
PhoneNumberBuilder() {
  var number;
  var label;
}

class AddressBookBuilder {
  var name;
  var email;
  var phone;

  build() {}
}
