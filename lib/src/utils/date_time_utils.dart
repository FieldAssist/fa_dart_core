import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

/// format 1 -> ' ' (space)
/// format 2 -> -
/// format 3 -> /

/// Note: In case of adding any new format in [DateTimeFormat] class always add it's matching string in [DateTimeFormatExtension]

enum DateTimeFormat {
  FORMAT_HH_MM,
  FORMAT_KM,
  FORMAT_JM,
  FORMAT_H_MM_AM_PM,
  FORMAT_yyyyMMdd,
  FORMAT_day,
  FORMAT_day_short,
  FORMAT_1_dd_MMMM,
  FORMAT_1_dd_MMMM_yyyy,
  FORMAT_1_dd_MMM_yyyy,
  FORMAT_1_dd_MMM_yy,
  FORMAT_1_dd_MMM,
  FORMAT_1_dd_MMMM_yyyy_HH_MM_AM_PM,
  FORMAT_1_dd_MMM_yyyy_HH_MM_AM_PM,
  FORMAT_1_dd_MMM_yy_HH_MM_AM_PM,
  FORMAT_1_dd_MMMM_HH_MM_AM_PM,
  FORMAT_1_HH_MM_AM_PM,
  FORMAT_1_dd_MMM_yy_EEEE,
  FORMAT_2_EEEE_dd_MMM_yyyy,
  FORMAT_2_EEEE_d_MMM_yyyy,
  FORMAT_2_yyyy_MM_dd,
  FORMAT_2_MM_dd_yyyy,
  FORMAT_2_EEE_dd_MMM_yyyy,
  FORMAT_2_EEEE_dd_MMMM_yyyy,
  FORMAT_3_dd_MM_yyyy,
  FORMAT_3_dd_MM_yyyy_HH_MM_AM_PM,
  FORMAT_UNKNOWN,
}

extension DateTimeFormatExtension on DateTimeFormat {
  String get value {
    switch (this) {
      case DateTimeFormat.FORMAT_HH_MM:
        return "hh:mm";
      case DateTimeFormat.FORMAT_KM:
        return "km";
      case DateTimeFormat.FORMAT_JM:
        return "jm";
      case DateTimeFormat.FORMAT_H_MM_AM_PM:
        return "h:mm a";
      case DateTimeFormat.FORMAT_yyyyMMdd:
        return "yyyyMMdd";
      case DateTimeFormat.FORMAT_day:
        return "EEEE";
      case DateTimeFormat.FORMAT_day_short:
        return "EEE";
      case DateTimeFormat.FORMAT_1_dd_MMMM_yyyy:
        return "dd MMMM yyyy";
      case DateTimeFormat.FORMAT_1_dd_MMM_yyyy:
        return "dd MMM yyyy";
      case DateTimeFormat.FORMAT_1_dd_MMM_yy:
        return "dd MMM yy";
      case DateTimeFormat.FORMAT_1_dd_MMM:
        return "dd MMM";
      case DateTimeFormat.FORMAT_1_dd_MMMM:
        return "dd MMMM";
      case DateTimeFormat.FORMAT_1_dd_MMMM_yyyy_HH_MM_AM_PM:
        return "dd MMMM yyyy hh:mm a";
      case DateTimeFormat.FORMAT_1_dd_MMM_yyyy_HH_MM_AM_PM:
        return "dd MMM yyyy hh:mm a";
      case DateTimeFormat.FORMAT_1_dd_MMM_yy_HH_MM_AM_PM:
        return "dd MMM yy hh:mm a";
      case DateTimeFormat.FORMAT_1_dd_MMMM_HH_MM_AM_PM:
        return "dd MMMM hh:mm a";
      case DateTimeFormat.FORMAT_1_HH_MM_AM_PM:
        return "hh:mm a";
      case DateTimeFormat.FORMAT_1_dd_MMM_yy_EEEE:
        return "dd MMM yy - EEEE";
      case DateTimeFormat.FORMAT_2_EEEE_dd_MMM_yyyy:
        return "EEEE, dd-MMM-yyyy";
      case DateTimeFormat.FORMAT_2_EEEE_d_MMM_yyyy:
        return "EEEE, d-MMM-yyyy";
      case DateTimeFormat.FORMAT_2_yyyy_MM_dd:
        return "yyyy-MM-dd";
      case DateTimeFormat.FORMAT_2_MM_dd_yyyy:
        return "MM-dd-yyyy";
      case DateTimeFormat.FORMAT_2_EEE_dd_MMM_yyyy:
        return "EEE, dd-MMM-yyyy";
      case DateTimeFormat.FORMAT_2_EEEE_dd_MMMM_yyyy:
        return "EEEE, dd-MMMM-yyyy";
      case DateTimeFormat.FORMAT_3_dd_MM_yyyy:
        return "dd/MM/yyyy";
      case DateTimeFormat.FORMAT_3_dd_MM_yyyy_HH_MM_AM_PM:
        return "dd/MM/yyyy hh:mm a";
      default:
        throw Exception(
          'Unimplemented $this in extension DateTimeFormatExtension',
        );
    }
  }
}

class DateTimeUtils {
  DateTimeUtils._(); // coverage:ignore-line

  static String formatDateTime({
    required DateTime dateTime,
    required DateTimeFormat outputFormat,
  }) {
    return DateFormat(outputFormat.value).format(dateTime);
  }

  static DateTime parseDateTime({
    required String dateTime,
    required DateTimeFormat inputFormat,
  }) {
    return DateFormat(inputFormat.value).parse(dateTime);
  }

  static final format_Iso8601 = DateFormat("yyyy-MM-ddThh:mmZ");

  static String fromIso8601Format(String date, {DateTimeFormat? outputFormat}) {
    if (outputFormat != null) {
      return DateFormat(outputFormat.value)
          .format(parseDatefromIso8601Format(date));
    }

    return DateFormat(DateTimeFormat.FORMAT_3_dd_MM_yyyy_HH_MM_AM_PM.value)
        .format(parseDatefromIso8601Format(date));
  }

  static DateTime parseDatefromIso8601Format(String date) =>
      (format_Iso8601.parse(date));

  static String formatDSRDate(String date) {
    return DateFormat(DateTimeFormat.FORMAT_1_dd_MMM_yy_EEEE.value).format(
        DateFormat(DateTimeFormat.FORMAT_3_dd_MM_yyyy.value).parse(date));
  }

  static String getCurrentISOTimeString({DateTime? dateTime}) {
    var date = dateTime ?? DateTime.now();
    //Time zone may be null in dateTime hence get timezone by  datetime
    var duration = DateTime.now().timeZoneOffset;

    //TODO: convert duration to abs value instead of below params
    return (date.toIso8601String() +
        "${duration.isNegative ? '-' : '+'}${duration.inHours.abs().toString().padLeft(2, '0')}:${(duration.inMinutes.abs() - (duration.inHours.abs() * 60)).toString().padLeft(2, '0')}");
  }

  static DateTime parseIsoDate(String startTime) {
    return Jiffy(startTime).dateTime;
  }

  static DateTime getAbsoluteDate() {
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
    );
  }

  static DateTime getDateTimeFromTimeStamp(int? timestamp) {
    if (timestamp == null) {
      return DateTime.now();
    }
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static int getCurrentUnixTimeStamp() =>
      getUnixTimeStampFromDateTime(DateTime.now());

  static int getTodayUnixTimeStamp() {
    return getUnixTimeStampFromDateTime(getTodaysDateTime());
  }

  static int getUnixTimeStampFromDateTime(DateTime dateTime) {
    return dateTime.toUtc().millisecondsSinceEpoch ~/ 1000;
  }

  static DateTime getTodaysDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String getTime(String date) {
    var datetime = DateTime.parse(date).toLocal();
    return DateFormat(DateTimeFormat.FORMAT_1_HH_MM_AM_PM.value)
        .format(datetime);
  }

  static String getDay(DateTime date) {
    return formatDateTime(
      dateTime: date,
      outputFormat: DateTimeFormat.FORMAT_day,
    );
  }

  static String getDayShort(DateTime date) {
    return formatDateTime(
      dateTime: date,
      outputFormat: DateTimeFormat.FORMAT_day_short,
    );
  }

  static int? convertAnyDateToyyyyMMdd(String date) {
    try {
      return int.tryParse(
        formatDateTime(
          dateTime: parseDateTime(
            dateTime: date,
            inputFormat: DateTimeFormat.FORMAT_3_dd_MM_yyyy,
          ),
          outputFormat: DateTimeFormat.FORMAT_yyyyMMdd,
        ),
      );
    } catch (e, s) {
      return int.tryParse(
        formatDateTime(
          dateTime: parseIsoDate(date),
          outputFormat: DateTimeFormat.FORMAT_yyyyMMdd,
        ),
      );
    }
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
