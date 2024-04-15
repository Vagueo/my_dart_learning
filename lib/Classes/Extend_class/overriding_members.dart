class Television {
  // ···
  set contrast(int value) {}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {}
  // ···
}