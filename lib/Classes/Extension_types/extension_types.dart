extension type IdNumber(int id) {
  // Wraps the 'int' type's '<' operator:
  operator <(IdNumber other) => id < other.id;
  // Doesn't declare the '+' operator, for example,
  // because addition does not make sense for ID numbers.
}

void main() {
  // Without the discipline of an extension type,
  // 'int' exposes ID numbers to unsafe operations:
  int myUnsafeId = 42424242;
  myUnsafeId = myUnsafeId + 10; // This works, but shouldn't be allowed for IDs.

  var safeId = IdNumber(42424242);
  safeId + 10; // Compile-time error: No '+' operator.
  myUnsafeId = safeId; // Compile-time error: Wrong type.
  myUnsafeId = safeId as int; // OK: Run-time cast to representation type.
  safeId < IdNumber(42424241); // OK: Uses wrapped '<' operator.
}

extension type E(int i) {
  E.n(this.i);
  E.m(int j, String foo) : i = j + foo.length;
}

void main() {
  E(4); // Implicit unnamed constructor.
  E.n(3); // Named constructor.
  E.m(5, "Hello!"); // Named constructor with additional parameters.
}

extension type const E._(int it) {
  E(): this._(42);
  E.otherName(this.it);
}

void main2() {
  E();
  const E._(2);
  E.otherName(3);
}

extension type E1._(int i) {
  E1.fromString(String foo) : i = int.parse(foo);
}

extension type NumberE(int value) {
  // Operator:
  NumberE operator +(NumberE other) =>
      NumberE(value + other.value);
  // Getter:
  NumberE get myNum => this;
  // Method:
  bool isValid() => !value.isNegative;
}

extension type NumberI(int i) 
  implements int{
  // 'NumberI' can invoke all members of 'int',
  // plus anything else it declares here.
}

extension type Sequence<T>(List<T> _) implements Iterable<T> {
  // Better operations than List.
}

extension type Id(int _id) implements Object {
  // Makes the extension type non-nullable.
  static Id? tryParse(String source) => int.tryParse(source) as Id?;
}

extension type const Opt<T>._(({T value})? _) { 
  const factory Opt(T value) = Val<T>;
  const factory Opt.none() = Non<T>;
}
extension type const Val<T>._(({T value}) _) implements Opt<T> { 
  const Val(T value) : this._((value: value));
  T get value => _.value;
}
extension type const Non<T>._(Null _) implements Opt<Never> {
  const Non() : this._(null);
}

extension type MyString(String _) implements String {
  // Replaces 'String.operator[]'
  @redeclare
  int operator [](int index) => codeUnitAt(index);
}

extension type NumberE1(int value) {
  NumberE operator +(NumberE other) =>
      NumberE(value + other.value);

  NumberE get next => NumberE(value + 1);
  bool isValid() => !value.isNegative;
}

void testE1() { 
  var num = NumberE1(1);
}