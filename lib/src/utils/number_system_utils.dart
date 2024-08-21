import 'package:fa_dart_core/fa_dart_core.dart';

class NumberSystemUtils {
  String parse(
    bool usesInternationalNumberSystem,
    num? val, {
    int decimalPlaces = 2,
    bool isCompact = true,
    int decimalPlacesForInternational = 1,
  }) =>
      usesInternationalNumberSystem
          ? _parseAsInternational(val ?? 0,
              decimalPlaces: decimalPlacesForInternational,
              isCompact: isCompact)
          : _parseAsIndian(
              val ?? 0,
              decimalPlaces: decimalPlaces,
              isCompact: isCompact,
            );

  String _parseAsInternational(num val,
      {int decimalPlaces = 0, bool isCompact = true}) {
    return formatValue(
      val.toDouble(),
      locale: 'en_US',
      decimalPlaces: decimalPlaces,
      isCompact: isCompact,
    );
  }

  String _parseAsIndian(num val,
      {int decimalPlaces = 0, bool isCompact = true}) {
    return formatValue(
      val.toDouble(),
      locale: 'en_IN',
      decimalPlaces: decimalPlaces,
      isCompact: isCompact,
    );
  }
}
