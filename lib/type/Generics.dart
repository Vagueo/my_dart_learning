abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

void main() {
  var names = <String>['Seth', 'Kathy', 'Lars'];
  var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  };

  var nameSet = Set<String>.from(names);
  var views = Map<int, View>();

  var names1 = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<String>); // true

  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();

  var foo = Foo();
  print(foo); // Instance of 'Foo<SomeBaseClass>'
}

class View {
}

class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}


class Extender extends SomeBaseClass {}

class SomeBaseClass {
}

T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
