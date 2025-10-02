import 'package:flutter_test/flutter_test.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('Bool extensions', () {
    test('toggle', () {
      expect(true.toggle(), isFalse);
      expect(false.toggle(), isTrue);
    });

    test('toInt', () {
      expect(true.toInt(), 1);
      expect(false.toInt(), 0);
    });

    test('string conversions', () {
      expect(true.toYesNo(), 'Yes');
      expect(false.toYesNo(), 'No');
      expect(true.toOnOff(), 'On');
      expect(false.toOnOff(), 'Off');
    });
  });
}
