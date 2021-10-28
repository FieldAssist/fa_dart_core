import 'package:fa_dart_core/fa_dart_core.dart';
import 'package:intl/intl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final dateTime = DateTime(2021, 11, 01, 15, 25, 20);

  group('formatDate', () {
    test('formatDate should return date in the form dd/MM/yyyy', () {
      final expectedFormattedDate = "01/11/2021";
      final formattedDate = DateTimeUtils.formatDate(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDate2 should return date in the form dd MMMM yyyy', () {
      final expectedFormattedDate = "01 November 2021";
      final formattedDate = DateTimeUtils.formatDate2(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDate3 should return date in the form dd MMM yyyy', () {
      final expectedFormattedDate = "01 Nov 2021";
      final formattedDate = DateTimeUtils.formatDate3(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDate4 should return date in the form dd MMM yyyy', () {
      final expectedFormattedDate = "01 Nov 21";
      final formattedDate = DateTimeUtils.formatDate4(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDateddmmm should return date in the form dd MMM', () {
      final expectedFormattedDate = "01 Nov";
      final formattedDate = DateTimeUtils.formatDateddmmm(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDateTime should return date in the form dd/MM/yyyy hh:mm a',
        () {
      final expectedFormattedDate = "01/11/2021 03:25 PM";
      final formattedDate = DateTimeUtils.formatDateTime(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDateTime1 should return date in the form dd MMMM yyyy hh:mm a',
        () {
      final expectedFormattedDate = "01 November 2021 03:25 PM";
      final formattedDate = DateTimeUtils.formatDateTime1(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDateTime2 should return date in the form dd MMM yy - EEEE', () {
      final expectedFormattedDate = "01 Nov 21 - Monday";
      final formattedDate = DateTimeUtils.formatDateTime2(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDateTime3 should return date in the form dd MMM yy hh:mm a',
        () {
      final expectedFormattedDate = "01 Nov 21 03:25 PM";
      final formattedDate = DateTimeUtils.formatDateTime3(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatDateTime4 should return date in the form dd MMM yyyy hh:mm a',
        () {
      final expectedFormattedDate = "01 Nov 2021 03:25 PM";
      final formattedDate = DateTimeUtils.formatDateTime4(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatTime should return time in the form hh:mm a', () {
      final expectedFormattedDate = "03:25 PM";
      final formattedDate = DateTimeUtils.formatTime(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatPlaningDate should return date in the form dd/MM/yyyy', () {
      final expectedFormattedDate = "01/11/2021";
      final formattedDate = DateTimeUtils.formatPlaningDate(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatNewPlaningDate should return date in the form yyyy-MM-dd', () {
      final expectedFormattedDate = "2021-11-01";
      final formattedDate = DateTimeUtils.formatNewPlaningDate(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('formatRoutePlaningDate should return date in the form yyyyMMdd', () {
      final expectedFormattedDate = "20211101";
      final formattedDate = DateTimeUtils.formatRoutePlaningDate(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('getDay should return day from the date', () {
      final expectedFormattedDate = "Monday";
      final formattedDate = DateTimeUtils.getDay(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test('getDayShort should return day in short from the date', () {
      final expectedFormattedDate = "Mon";
      final formattedDate = DateTimeUtils.getDayShort(dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test(
        'convertToMMddYY should return date in the form MM-dd-yyyy when non null value passed',
        () {
      final expectedFormattedDate = "11-01-2021";
      final formattedDate = DateTimeUtils.convertToMMddYY(dateTime: dateTime);
      expect(formattedDate, expectedFormattedDate);
    });

    test(
        'convertToMMddYY should return current date in the form MM-dd-yyyy when null value passed',
        () {
      final expectedFormattedDate =
          DateFormat('MM-dd-yyyy').format(DateTime.now());
      final formattedDate = DateTimeUtils.convertToMMddYY(dateTime: null);
      expect(formattedDate, expectedFormattedDate);
    });
  });

  group('format date from String', () {
    final dateTimeString = dateTime.toIso8601String();
    test('fromIso8601Format should return the formatted date from String', () {
      final expectedResult = "01/11/2021 03:25 PM";
      final formattedDate = DateTimeUtils.fromIso8601Format(dateTimeString);
      expect(expectedResult, formattedDate);
    });

    test('parseDatefromIso8601Format should return DateTime from String', () {
      final expectedResult = dateTime.subtract(Duration(seconds: 20));
      final actualResult =
          DateTimeUtils.parseDatefromIso8601Format(dateTimeString);
      expect(expectedResult, actualResult);
    });
  });
}
