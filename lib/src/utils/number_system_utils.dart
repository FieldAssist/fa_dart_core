import 'package:decimal/decimal.dart';
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

  /// Dart doesn't support operator overloading for now.

  num decimalPlus(num first, num second) => num.parse(
      (Decimal.parse(first.toString()) + Decimal.parse(second.toString()))
          .toString());

  num decimalSubtract(num first, num second) => num.parse(
      (Decimal.parse(first.toString()) - Decimal.parse(second.toString()))
          .toString());

  num decimalMultiply(num first, num second) => num.parse(
      (Decimal.parse(first.toString()) * Decimal.parse(second.toString()))
          .toString());

  num decimalDivide(num first, num second) {
    if (second == 0 || second == 1) {
      return first;
    }
    return num.parse(
        (Decimal.parse(first.toString()) / Decimal.parse(second.toString()))
            .toString());
  }
}
