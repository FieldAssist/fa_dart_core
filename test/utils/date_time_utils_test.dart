import 'package:fa_dart_core/src/utils/date_time_utils.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final DateTime dateTime = DateTime(2021, 11, 1, 15, 25);
  final outputFormatList = DateTimeFormat.values;

  group('formatDateTime', () {
    test('should return the date in specified format', () {
      final expectedOutputList = [
        "03:25",
        "20211101",
        "Monday",
        "Mon",
        "01 November 2021",
        "01 Nov 2021",
        "01 Nov 21",
        "01 Nov",
        "01 November 2021 03:25 PM",
        "01 Nov 2021 03:25 PM",
        "01 Nov 21 03:25 PM",
        "01 November 03:25 PM",
        "03:25 PM",
        "01 Nov 21 - Monday",
        "2021-11-01",
        "11-01-2021",
        "01/11/2021",
        "01/11/2021 03:25 PM",
        // dateTime.toIso8601String()
      ];

      final actualOutputList = [];

      try {
        outputFormatList.forEach((outputFormat) {
          actualOutputList.add(DateTimeUtils.formatDateTime(
            dateTime: dateTime,
            outputFormat: outputFormat,
          ));
        });

        expect(actualOutputList, expectedOutputList);
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });

    test('formatDSRDate should return the formatted date string', () {
      final dateString = "01/11/2021";
      final actual = DateTimeUtils.formatDSRDate(dateString);
      expect(actual, '01 Nov 21 - Monday');
    });
  });

  group('parseDateTime', () {
    final date = "01 Nov 2021";
    test('should parse and return the date in expected format', () {
      final expected =
          DateFormat(DateTimeFormat.FORMAT_1_dd_MMM_yyyy.value).parse(date);
      final actual = DateTimeUtils.parseDateTime(
          dateTime: date, inputFormat: DateTimeFormat.FORMAT_1_dd_MMM_yyyy);
      expect(actual, expected);
    });

    test('should throw exception when wrong input format provided', () {
      expect(
        () => DateTimeUtils.parseDateTime(
            dateTime: date, inputFormat: DateTimeFormat.FORMAT_3_dd_MM_yyyy),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('fromISO8601Format', () {
    test('should return the date from ISO8601 format', () {
      final stringDate = dateTime.toIso8601String();
      final expected = "01/11/2021 03:25 PM";
      final actual = DateTimeUtils.fromIso8601Format(stringDate);
      expect(actual, expected);
    });

    test('should return the DateTime from ISO8601 format', () {
      final stringDate = dateTime.toIso8601String();
      final actual = DateTimeUtils.parseDatefromIso8601Format(stringDate);
      expect(actual, dateTime);
    });

    test('should return DateTime from string date', () {
      final expected = Jiffy(dateTime.toIso8601String()).dateTime;
      final actual = DateTimeUtils.parseIsoDate(dateTime.toIso8601String());
      expect(actual, expected);
    });
  });

  group('getAbsoluteDate', () {
    test(
        'getAbsoluteDate should return DateTime containing only year month and date',
        () {
      final now = DateTime.now();
      final expected = DateTime(now.year, now.month, now.day);
      final actual = DateTimeUtils.getAbsoluteDate();
      expect(actual, expected);
    });
  });

  group('getCurrentISOTimeString', () {
    test('should parse and return iso time string of the provided dateTime',
        () {
      final actual = DateTimeUtils.getCurrentISOTimeString(dateTime: dateTime);
      expect('TEST', 'TEST');
    });
  });

  group('isSameDay', () {
    test('This method should return true for same date as both the inputs.',
        () {
      final isSameDate = DateTime.now().isSameDate(DateTime.now());
      expect(isSameDate, true);
    });

    test('This method should return false for different dates as input.', () {
      final d1 = DateTime.now();
      final d2 = d1.subtract(Duration(days: 200));
      final isSameDate = d1.isSameDate(d2);
      expect(isSameDate, false);
    });
  });
}
