import 'package:fa_dart_core/fa_dart_core.dart';

class NumberSystemUtils {
  String parse(
    bool usesInternationalNumberSystem,
    num? val, {
    int decimalPlaces = 2,
    int decimalPlacesForInternational = 1,
  }) =>
      usesInternationalNumberSystem
          ? _parseAsInternational(val ?? 0,
              decimalPlaces: decimalPlacesForInternational)
          : _parseAsIndian(val ?? 0, decimalPlaces: decimalPlaces);

  String _parseAsInternational(num val, {int decimalPlaces = 0}) {
    return formatValue(
      val.toDouble(),
      locale: 'en_US',
      decimalPlaces: decimalPlaces,
    );
  }

  String _parseAsIndian(num val, {int decimalPlaces = 0}) {
    return formatValue(
      val.toDouble(),
      locale: 'en_IN',
      decimalPlaces: decimalPlaces,
    );
  }
}
