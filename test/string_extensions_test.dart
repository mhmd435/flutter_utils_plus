import 'package:flutter_test/flutter_test.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('String extensions', () {
    test('isNullOrEmpty', () {
      String? nullString;
      expect(nullString.isNullOrEmpty, isTrue);
      expect(''.isNullOrEmpty, isTrue);
      expect('hello'.isNullOrEmpty, isFalse);
    });

    test('capitalize and capitalizeWords', () {
      expect('hello'.capitalize(), 'Hello');
      expect('hELLo'.capitalize(), 'Hello');
      expect('hello world'.capitalizeWords(), 'Hello World');
      expect(' multiple   spaces '.capitalizeWords(), ' Multiple   Spaces ');
    });

    test('toInt and toDouble', () {
      expect('42'.toInt(), 42);
      expect('invalid'.toInt(), isNull);
      expect('3.14'.toDouble(), closeTo(3.14, 0.0001));
      expect('abc'.toDouble(), isNull);
    });

    test('toBool', () {
      expect('YES'.toBool(), isTrue);
      expect('off'.toBool(), isFalse);
      expect('maybe'.toBool(), isNull);
    });

    test('isNumeric, isEmail, isPhoneNumber', () {
      expect('1234'.isNumeric, isTrue);
      expect('12ab'.isNumeric, isFalse);
      expect('user@example.com'.isEmail, isTrue);
      expect('user@'.isEmail, isFalse);
      expect('+1234567890'.isPhoneNumber, isTrue);
      expect('12345'.isPhoneNumber, isFalse);
    });

    test('truncate', () {
      expect('HelloWorld'.truncate(5), 'He...');
      expect('Hi'.truncate(5), 'Hi');
      expect('abc'.truncate(3), 'abc');
      expect(() => 'test'.truncate(-1), throwsArgumentError);
    });

    test('reverse, removeWhitespaces, onlyDigits', () {
      expect('abc'.reverse(), 'cba');
      expect('a b\nc'.removeWhitespaces(), 'abc');
      expect('a1b2c3'.onlyDigits(), '123');
    });

    test('containsIgnoreCase', () {
      expect('Hello World'.containsIgnoreCase('world'), isTrue);
      expect('Hello'.containsIgnoreCase('bye'), isFalse);
    });

    test('toDateTime', () {
      expect('2023-09-11'.toDateTime(), DateTime(2023, 9, 11));
      expect('31/12/2023'.toDateTime('dd/MM/yyyy'), DateTime(2023, 12, 31));
      expect('2023-09-11 13:45:10'.toDateTime('yyyy-MM-dd HH:mm:ss'),
          DateTime(2023, 9, 11, 13, 45, 10));
      expect('invalid'.toDateTime(), isNull);
    });

    test('mask', () {
      expect('1234567890'.mask(), '12******90');
      expect('12'.mask(), '**');
      expect(() => '1234'.mask(start: -1), throwsArgumentError);
    });
  });
}
