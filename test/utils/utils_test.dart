import 'package:fa_dart_core/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('checkIfNotEmpty', () {
    test('checkIfNotEmpty should return false when string is null', () {
      final String? myString = null;
      final result = checkIfNotEmpty(myString);
      expect(result, false);
    });
    test('checkIfNotEmpty should return false when string is empty', () {
      final String myString = '';
      final result = checkIfNotEmpty(myString);
      expect(result, false);
    });
    test("checkIfNotEmpty should return false when string is 'null'", () {
      final String myString = 'null';
      final result = checkIfNotEmpty(myString);
      expect(result, false);
    });
    test("checkIfNotEmpty should return true when string is not null/empty",
        () {
      final String myString = "Hello";
      final result = checkIfNotEmpty(myString);
      expect(result, true);
    });
  });

  group('checkIfListIsNotEmpty', () {
    test('checkIfListIsNotEmpty should return false when the list is null', () {
      final List? myList = null;
      final result = checkIfListIsNotEmpty(myList);
      expect(result, false);
    });

    test('checkIfListIsNotEmpty should return false when the list is empty',
        () {
      final List myList = [];
      final result = checkIfListIsNotEmpty(myList);
      expect(result, false);
    });

    test(
        'checkIfListIsNotEmpty should return true when the list is not null/empty',
        () {
      final List<int> myList = <int>[1];
      final result = checkIfListIsNotEmpty(myList);
      expect(result, true);
    });
  });

  group('ifContainsKeyAndNotEmpty', () {
    test('ifContainsKeyAndNotEmpty should return false when map is empty', () {
      final map = <String, String>{};
      expect(ifContainsKeyAndNotEmpty(map, 'abc'), false);
    });

    test('ifContainsKeyAndNotEmpty should return false when key value is null',
        () {
      final map = <String, String?>{'abc': null};
      expect(ifContainsKeyAndNotEmpty(map, 'abc'), false);
    });

    test('ifContainsKeyAndNotEmpty should return false when key value is empty',
        () {
      final map = <String, String>{'abc': ''};
      expect(ifContainsKeyAndNotEmpty(map, 'abc'), false);
    });

    test(
        'ifContainsKeyAndNotEmpty should return true when key value is matched',
        () {
      final map = <String, String>{'abc': 'v1'};
      expect(ifContainsKeyAndNotEmpty(map, 'abc'), true);
    });
  });

  group('isStringEmpty', () {
    test('isStringEmpty should return true when string is null', () {
      final String? myString = null;
      final result = isStringEmpty(myString);
      expect(result, true);
    });
    test('isStringEmpty should return true when string is empty', () {
      final String myString = '';
      final result = isStringEmpty(myString);
      expect(result, true);
    });
    test("isStringEmpty should return true when string is 'null'", () {
      final String myString = 'null';
      final result = isStringEmpty(myString);
      expect(result, true);
    });
    test("isStringEmpty should return false when string is not null/empty", () {
      final String myString = "Hello";
      final result = isStringEmpty(myString);
      expect(result, false);
    });
  });

  group('isListEmpty', () {
    test('isListEmpty should return true when the list is null', () {
      final List? myList = null;
      final result = isListEmpty(myList);
      expect(result, true);
    });

    test('isListEmpty should return true when the list is empty', () {
      final List myList = [];
      final result = isListEmpty(myList);
      expect(result, true);
    });

    test('isListEmpty should return false when the list is not null/empty', () {
      final List<int> myList = <int>[1];
      final result = isListEmpty(myList);
      expect(result, false);
    });
  });

  group('formatValue', () {
    test('value less than 1000', () {
      final value = 234.1;
      final result = formatValue(value);
      expect(result, '234');
    });

    test('value less than 1000, decimalePlace: 2', () {
      final value = 234.1;
      final result = formatValue(value, decimalPlaces: 2);
      expect(result, '234.10');
    });
    test('value greater than 1000', () {
      final value = 2341.1;
      final result = formatValue(value);
      expect(result, '2341');
    });

    test('value greater than 10000, locale: en_US', () {
      final value = 23414.1;
      final result = formatValue(value, decimalPlaces: 2, locale: 'en_US');
      expect(result, '23.41K');
    });

    test('value greater than 10000, locale: en_IN', () {
      final value = 23414.1;
      final result = formatValue(value, decimalPlaces: 2, locale: 'en_IN');
      expect(result, '23.41K');
    });

    test('value greater than 100000, locale: en_IN', () {
      final value = 234124.1;
      final result = formatValue(value, decimalPlaces: 2, locale: 'en_IN');
      expect(result, '2.34L');
    });

    test('value greater than 100000, locale: en_US, decimalPlaces: 2', () {
      final value = 234124.1;
      final result = formatValue(value, decimalPlaces: 2, locale: 'en_US');
      expect(result, '234.12K');
    });

    test('value greater than 100000, locale: en_US, decimaPlace: 1', () {
      final value = 234124.1;
      final result = formatValue(value, decimalPlaces: 1, locale: 'en_US');
      expect(result, '234.1K');
    });

    test('value greater than 1,00,00,000,  locale: en_IN, decimalPlace: 2', () {
      final value = 23421240.1;
      final result = formatValue(value, decimalPlaces: 2, locale: 'en_IN');
      expect(result, '2.34Cr');
    });

    test('value greater than 1,00,00,000,', () {
      final value = 23421240.1;
      final result = formatValue(value);
      expect(result, '2Cr');
    });

    test('value greater than 1,00,00,000, locale: en_US', () {
      final value = 23421240.1;
      final result = formatValue(value, decimalPlaces: 2, locale: 'en_US');
      expect(result, '23.42M');
    });
  });

  group('getCurrencySymbol', () {
    test('for locale: en_US', () {
      final result = getCurrencySymbol('en_US');
      expect(result, '\$');
    });
    test('for locale: en_IN', () {
      final result = getCurrencySymbol('en_IN');
      expect(result, '₹');
    });
  });

  group('getCurrencyName', () {
    test('for locale: en_US', () {
      final result = getCurrencyName('en_US');
      expect(result, 'USD');
    });
    test('for locale: en_IN', () {
      final result = getCurrencyName('en_IN');
      expect(result, 'INR');
    });
  });
}
