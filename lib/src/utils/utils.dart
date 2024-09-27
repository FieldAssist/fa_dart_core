import 'package:intl/intl.dart';

bool checkIfNotEmpty(String? value) {
  return value != null && value.isNotEmpty && value != "null";
}

bool checkIfListIsNotEmpty(List? list) {
  return list != null && list.isNotEmpty;
}

bool ifContainsKeyAndNotEmpty<T>(Map<String, T> map, String key) {
  return map.containsKey(key) &&
      map[key] != null &&
      map[key].toString().isNotEmpty;
}

bool isStringEmpty(String? value) => !checkIfNotEmpty(value);

bool isListEmpty(List? value) => !checkIfListIsNotEmpty(value);

/// Converts passed double in K, L and Cr notion, significantly shrinking the length of given number.
/// For example:
///   Any double less than 10000 will be returned as it is depending on bool isReturnTypeDouble
///   34394941.23 is not easily readable, now it will returns this value as 3.44Cr
///   32421.32 will be returned as 32.42K
///   324936.21 will be returned as 3.25L
String formatValue(double value,
    {int decimalPlaces = 0, String locale = 'en_IN', bool isCompact = true}) {
  String _getHashForDecimalPlaces(int decimalPlaces) {
    var hash = "";
    for (var x = 0; x < decimalPlaces - 1; x++) {
      hash = hash + "#";
    }
    return hash;
  }

  if (locale == 'en_IN') {
    if (!isCompact) {
      if (decimalPlaces > 0) {
        final formatter = NumberFormat(
            "##,##,###.0${_getHashForDecimalPlaces(decimalPlaces)}");
        return formatter.format(value);
      } else {
        final formatter = NumberFormat("##,##,###");
        return formatter.format(value);
      }
    }
    if (value > 10000000) {
      final calculated = value / 10000000;
      return '${calculated.toStringAsFixed(decimalPlaces)}Cr';
    } else if (value > 100000) {
      final calculated = value / 100000;
      return '${calculated.toStringAsFixed(decimalPlaces)}L';
    } else if (value > 10000) {
      final calculated = value / 1000;
      return '${calculated.toStringAsFixed(decimalPlaces)}K';
    } else {
      return value.toStringAsFixed(decimalPlaces);
    }
  } else {
    if (!isCompact) {
      if (decimalPlaces > 0) {
        final formatter =
            NumberFormat("###,###.0${_getHashForDecimalPlaces(decimalPlaces)}");
        return formatter.format(value);
      } else {
        final formatter = NumberFormat("###,###");
        return formatter.format(value);
      }
    }
    if (value > 1000000000) {
      final calculated = value / 1000000000;
      return '${calculated.toStringAsFixed(decimalPlaces)} B';
    } else if (value > 1000000) {
      final calculated = value / 1000000;
      return '${calculated.toStringAsFixed(decimalPlaces)} M';
    } else {
      return value.toStringAsFixed(decimalPlaces);
    }
  }
}

String getCurrencySymbol(String locale) {
  try {
    final format = NumberFormat.simpleCurrency(locale: locale);
    return format.currencySymbol;
  } catch (e) {
    return '';
  }
}

String getCurrencyName(String locale) {
  try {
    final format = NumberFormat.simpleCurrency(locale: locale);
    return format.currencyName ?? '';
  } catch (e) {
    return '';
  }
}
