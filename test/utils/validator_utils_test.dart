import 'package:fa_dart_core/src/utils/validator_utils.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("phoneNumberValidator", () {
    test("should return null if phone number given in correct format", () {
      final actual = ValidatorUtils.phoneNumberValidator("9876543212");
      expect(actual, null);
    });

    test("should return error message if phone number given in wrong format",
        () {
      final expected = "Enter valid phone number.";
      final actual = ValidatorUtils.phoneNumberValidator("987654321");
      expect(actual, expected);
    });

    test(
        "should return custom error message if phone number given in wrong format",
        () {
      final expected = "Phone number is not valid";
      final actual = ValidatorUtils.phoneNumberValidator("98743212",
          errorMessage: "Phone number is not valid");
      expect(actual, expected);
    });

    test(
        "should return null if phone number given in correct format even if custom error message is provided",
        () {
      final actual = ValidatorUtils.phoneNumberValidator("9876543212",
          errorMessage: "Phone number is not valid");
      expect(actual, null);
    });
  });

  group("emailValidator", () {
    test("should return null if email given in correct format", () {
      final actual = ValidatorUtils.emailValidator("test@fieldassist.com");
      expect(actual, null);
    });

    test("should return error message if email given in wrong format", () {
      final expected = "Enter valid email id.";
      final actual = ValidatorUtils.emailValidator("testfieldassist.com");
      expect(actual, expected);
    });

    test("should return custom error message if email given in wrong format",
        () {
      final expected = "Email is not valid";
      final actual = ValidatorUtils.emailValidator("testfieldassist.com",
          errorMessage: "Email is not valid");
      expect(actual, expected);
    });

    test(
        "should return null if email given in correct format even if custom error message is provided",
        () {
      final actual = ValidatorUtils.emailValidator("test@fieldassist.com",
          errorMessage: "Email is not valid");
      expect(actual, null);
    });
  });

  group("gstValidator", () {
    test("should return null if GST given in correct format", () {
      final actual = ValidatorUtils.gstValidator("22AAAAZ1234Q12A");
      expect(actual, null);
    });

    test("should return error message if GST given in wrong format", () {
      final expected = "Enter valid GST number.";
      final actual = ValidatorUtils.gstValidator("2BAAAAZ1234Q12A");
      expect(actual, expected);
    });

    test("should return custom error message if GST given in wrong format", () {
      final expected = "GST is not valid";
      final actual = ValidatorUtils.gstValidator("2AAAAZ1234Q12A",
          errorMessage: "GST is not valid");
      expect(actual, expected);
    });

    test(
        "should return null if GST given in correct format even if custom error message is provided",
        () {
      final actual = ValidatorUtils.gstValidator("22AAAAZ1234Q12A",
          errorMessage: "GST is not valid");
      expect(actual, null);
    });
  });

  group("panValidator", () {
    test("should return null if PAN given in correct format", () {
      final actual = ValidatorUtils.panValidator("ABCDE4321T");
      expect(actual, null);
    });

    test("should return error message if PAN given in wrong format", () {
      final expected = "Enter valid PAN.";
      final actual = ValidatorUtils.panValidator("A2CDE4321T");
      expect(actual, expected);
    });

    test("should return custom error message if PAN given in wrong format", () {
      final expected = "PAN is not valid";
      final actual = ValidatorUtils.panValidator("BCDE4321T",
          errorMessage: "PAN is not valid");
      expect(actual, expected);
    });

    test(
        "should return null if PAN given in correct format even if custom error message is provided",
        () {
      final actual = ValidatorUtils.panValidator("ABCDE4321T",
          errorMessage: "PAN is not valid");
      expect(actual, null);
    });
  });
}
