void main() {
  enableFlags(bold: true, hidden: false);
  // bold will be true; hidden will be false.
  enableFlags1(bold: true);

  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');

  assert(say1('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
}

bool isNoble(int atomicNumber) {
  var _nobleGases;
  return _nobleGases[atomicNumber] != null;
}

// 命名函数
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {}

/// Sets the [bold] and [hidden] flags ...
void enableFlags1({bool bold = false, bool hidden = false}) {}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

String say1(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}
