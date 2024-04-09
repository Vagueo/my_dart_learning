import 'dart:html';

void main() {
  // if
  var you;
  var car;
  if (isRaining()) {
    you.bringRainCoat();
  } else if (isSnowing()) {
    you.wearJacket();
  } else {
    car.putTopDown();
  }

  // switch statements
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      executeClosed();
      break;
    case 'PENDING':
      executePending();
      break;
    case 'APPROVED':
      executeApproved();
      break;
    case 'DENIED':
      executeDenied();
      break;
    case 'OPEN':
      executeOpen();
      break;
    default:
      executeUnknown();
  }
  switch (command) {
    case 'OPEN':
      executeOpen();
      continue newCase; // Continues executing at the newCase label.

    case 'DENIED': // Empty case falls through.
    case 'CLOSED':
      executeClosed();
      break; // Runs for both DENIED and CLOSED,
    newCase:
    case 'PENDING':
      executeNowClosed(); // Runs for both OPEN and PENDING.
  }
  
  
  // 穷尽性检查
    // Non-exhaustive switch on bool?, missing case to match null possibility:
  var nullableBool;
  switch (nullableBool) {
    case true:
      print('yes');
      break;
    case false:
      print('no');
  }
  
}

number() {
}

punctuation(charCode) {
}

operator(charCode) {
}

void executeNowClosed() {
}

void executeDenied() {}

void executeUnknown() {}

void executeOpen() {}

void executePending() {}

void executeClosed() {}

void executeApproved() {}

bool isSnowing() {
  return false;
}

bool isRaining() {
  return false;
}