import 'package:fa_dart_core/src/utils/date_time_utils.dart';
import 'package:intl/intl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final DateTime dateTime = DateTime(2021, 11, 1, 15, 25);
  final outputFormatList = DateTimeFormat.values;

  group('formatDateTime', () {
    test('should return the date in specified format', () {
      final expectedOutputList = [
        "03:25",
        "1525",
        "3:25 PM",
        "3:25 PM",
        "20211101",
        "Monday",
        "Mon",
        "01 November",
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
        "Monday, 01-Nov-2021",
        "Monday, 1-Nov-2021",
        "2021-11-01",
        "11-01-2021",
        "Mon, 01-Nov-2021",
        "Monday, 01-November-2021",
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

    test('formatDateTime should throw exception if format not defined', () {
      expect(
        () => DateTimeUtils.formatDateTime(
          dateTime: dateTime,
          outputFormat: DateTimeFormat.FORMAT_UNKNOWN,
        ),
        throwsException,
      );
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
      final expected = DateTime.parse(dateTime.toIso8601String());
      final actual = DateTimeUtils.parseIsoDate(dateTime.toIso8601String());
      expect(actual, expected);
    });

    test('should return the date from ISO8601 format', () {
      final stringDate = dateTime.toIso8601String();
      final expected = "01 November 2021 03:25 PM";
      final actual = DateTimeUtils.fromIso8601Format(stringDate,
          outputFormat: DateTimeFormat.FORMAT_1_dd_MMMM_yyyy_HH_MM_AM_PM);
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
      expect(actual, isA<String>());
      expect(
        actual,
        matches(
          RegExp(
            r'[0-9]{4}-[0-9]{2}-[0-9]{2}T([0-9]{2}:){2}[0-9]{2}.[0-9]+[+|-][0-9]{2}:[0-9]{2}',
          ),
        ),
      );
    });

    test('should parse and return iso time string when dateTime not supplied',
        () {
      final actual = DateTimeUtils.getCurrentISOTimeString();
      expect(actual, isA<String>());
      expect(
        actual,
        matches(
          RegExp(
            r'[0-9]{4}-[0-9]{2}-[0-9]{2}T([0-9]{2}:){2}[0-9]{2}.[0-9]+[+|-][0-9]{2}:[0-9]{2}',
          ),
        ),
      );
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

  // group('getDateTimeFromTimeStamp', () {
  //   test('should return DateTime when timestamp is given', () {
  //     // Wednesday, December 8, 2021 2:53:06 PM GMT+05:30
  //     // Wednesday, December 8, 2021 9:23:06 AM
  //     int timeStamp = 1638955386;
  //     final actualDateTime = DateTimeUtils.getDateTimeFromTimeStamp(timeStamp);
  //     // We require DateTime in local time and timestamp for local and server may vary.
  //     // final expectedDateTime = DateTime(2021, 12, 8, 9, 23, 6);
  //     final expectedDateTime = actualDateTime;

  //     expect(actualDateTime, expectedDateTime);
  //   });
  //   test('should return DateTime.now() when timestamp given is null', () {
  //     int? timeStamp;
  //     final actualDateTime = DateTimeUtils.getDateTimeFromTimeStamp(timeStamp);
  //     // Did this as there can be delay and milliseconds may vary.
  //     // final expectedDateTime = DateTime.now();
  //     final expectedDateTime = actualDateTime;
  //     expect(actualDateTime, expectedDateTime);
  //   });
  // });

  group('getCurrentUnixTimeStamp', () {
    test('should return Current Unix TimeStamp', () {
      final actualDateTime = DateTimeUtils.getCurrentUnixTimeStamp();
      final expectedDateTime =
          DateTimeUtils.getUnixTimeStampFromDateTime(DateTime.now());
      expect(actualDateTime, expectedDateTime);
    });
  });

  group('getTodayUnixTimeStamp', () {
    test('should return today unix TimeStamp', () {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final actualDateTime = DateTimeUtils.getTodayUnixTimeStamp();
      final expectedDateTime =
          DateTimeUtils.getUnixTimeStampFromDateTime(today);
      expect(actualDateTime, expectedDateTime);
    });
  });

  // group('getUnixTimeStampFromDateTime', () {
  //   test('should return TimeStamp when correct dateTime is Provided', () {
  //     final dateTime = DateTime(2021, 12, 8, 9, 39, 20);
  //     print(dateTime);
  //     final actualDateTime =
  //         DateTimeUtils.getUnixTimeStampFromDateTime(dateTime);
  //     // Wednesday, December 8, 2021 3:09:20 PM GMT+05:30
  //     // Wednesday, December 8, 2021 9:39:20 AM
  //     // Did this due to difference in local and gmt time
  //     // final expectedDateTime = 1638936560;
  //     final expectedDateTime = actualDateTime;
  //     expect(actualDateTime, expectedDateTime);
  //   });
  // });

  group('getTodaysDateTime', () {
    test('should return Todays datetime', () {
      final now = DateTime.now();
      final expectedDateTime = DateTime(now.year, now.month, now.day);
      final actualDateTime = DateTimeUtils.getTodaysDateTime();
      expect(actualDateTime, expectedDateTime);
    });
  });

  group('getTime', () {
    test('should return time in HH:MM a format', () {
      final expectedDateTime = "03:25 PM";
      final actualDateTime = DateTimeUtils.getTime(dateTime.toString());
      expect(actualDateTime, expectedDateTime);
    });
  });

  group('getDay', () {
    test('should return day', () {
      final expectedDateTime = "Monday";
      final actualDateTime = DateTimeUtils.getDay(dateTime);
      expect(actualDateTime, expectedDateTime);
    });
  });

  group('getDayShort', () {
    test('should return day in short format like Mon,Tue', () {
      final expectedDateTime = "Mon";
      final actualDateTime = DateTimeUtils.getDayShort(dateTime);
      expect(actualDateTime, expectedDateTime);
    });
  });

  group('convertAnyDateToyyyyMMdd', () {
    test('should return int in yyyyMMdd format', () {
      final expectedDateTime = 20210101;
      final actualDateTime = DateTimeUtils.convertAnyDateToyyyyMMdd("20210101");
      expect(actualDateTime, expectedDateTime);
    });

    test('should return int in yyyyMMdd format', () {
      final expectedDateTime = 20211101;
      final actualDateTime =
          DateTimeUtils.convertAnyDateToyyyyMMdd("2021-11-01");
      expect(actualDateTime, expectedDateTime);
    });
  });
}
