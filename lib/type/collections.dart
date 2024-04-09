void main() {
  // Lists
  var list = [1, 2, 3];
  var list1 = [
    'Car',
    'Boat',
    'Plane',
  ];
  var list2 = [1, 2, 3];
  assert(list2.length == 3);
  assert(list2[1] == 2);

  list2[1] = 1;
  assert(list2[1] == 1);

  // Sets
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);

  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };

  // Map
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  var gifts1 = Map<String, String>();
  gifts1['first'] = 'partridge';
  gifts1['second'] = 'turtledoves';
  gifts1['fifth'] = 'golden rings';

  var nobleGases1 = Map<int, String>();
  nobleGases1[2] = 'helium';
  nobleGases1[10] = 'neon';
  nobleGases1[18] = 'argon';

  var gifts2 = {'first': 'partridge'};
  gifts2['fourth'] = 'calling birds'; // Add a key-value pair
  assert(gifts2['first'] == 'partridge');
  assert(gifts2['fifth'] == null);
  assert(gifts2.length == 2);

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // constantMap[2] = 'Helium'; // This line will cause an error.

  // Operators
  var list3 = [1, 2, 3];
  var list4 = [0, ...list];
  assert(list4.length == 4);

  // Control-flow operators
  var promoActive;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
}
