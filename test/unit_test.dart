import 'package:flutter_test/flutter_test.dart';

int addOne(int value) {       //Eine einfache Funktion, die eine Zahl um 1 erhöht
  return value + 1;
}

void main() {                 //auch bei Tests ist die main()-Funktion der Startpunkt
  test('addOne erhöht den Eingabewert um 1', () {         //test() ist eine Funktion aus dem Paket flutter_test. //sie definiert einen einzelnen Unit-Test.
    expect(addOne(2), 3);                                 //expect() überprüft, ob das Ergebnis von addOne(2) gleich 3 ist. Also ob wirklich um 1 erhöht wurde.
  });
}
