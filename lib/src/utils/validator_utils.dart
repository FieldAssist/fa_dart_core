class ValidatorUtils {
  static const phoneRegxPattern = '[0-9]{10}';
  static const emailRegxPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const gstRegxPattern =
      r'^([0-9]){2}[a-zA-Z]{4}([a-zA-Z]|[0-9]){1}([0-9]){4}([a-zA-Z]){1}([a-zA-Z]|[0-9]){3}?$';

  static const panRegexPattern = r'^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$';

  static String? phoneNumberValidator(String input,
      {String errorMessage = "Enter valid phone number."}) {
    final regex = RegExp(phoneRegxPattern);
    final match = regex.firstMatch(input);
    if (!regex.hasMatch(input)) {
      return errorMessage;
    } else if (match!.end - match.start == 10) {
      return null;
    }
    return null;
  }

  static String? emailValidator(String input,
      {String errorMessage = "Enter valid email id."}) {
    final regex = RegExp(emailRegxPattern);
    if (!regex.hasMatch(input)) {
      return errorMessage;
    } else {
      return null;
    }
  }

  static String? gstValidator(String input,
      {String errorMessage = "Enter valid GST number."}) {
    final regex = RegExp(gstRegxPattern);
    if (!regex.hasMatch(input)) {
      return errorMessage;
    } else {
      return null;
    }
  }

  static String? panValidator(String input,
      {String errorMessage = "Enter valid PAN."}) {
    final regex = RegExp(panRegexPattern);
    if (!regex.hasMatch(input)) {
      return errorMessage;
    } else {
      return null;
    }
  }
}
