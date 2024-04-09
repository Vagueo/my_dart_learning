// Importing core libraries
import 'dart:io';
import 'dart:math';

void main() {
  // Hello World#
  print("Hello,World!");
  // 变量
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'ur1': '//path/to/saturn.jpg'
  };
  // 流程控制语句
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  // 函数的调用
  var result = fibonacci(20);

  // 类的调用
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  // 枚举的使用

  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }

  var astronauts;
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }
}

// 函数
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// 类(Class)
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor,with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

// 枚举类型
enum PlanetType { terrestrial, gas, ice }

/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 3372, hasRings: true),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

// 扩展类（继承）
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

// Mixins
mixin Piloted {
  int astronauts = 1;

  void desribeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

// 接口和抽象类
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

// 异步
const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start descrbing $object in this file.');
    } on IOException catch (e) {
      print('Cannont create description for $object: $e');
    }
  }
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}

// 异常
Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
