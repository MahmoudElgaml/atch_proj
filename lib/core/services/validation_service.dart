class ValidationService {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ("You must enter your email");
    }

    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'You must enter your password';
    }

    var regex = RegExp(
      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
    );

    if (!regex.hasMatch(value)) {
      return 'Must contains A-Z, a-z, @-#-&.. , 1-9';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'You must enter your phone';
    }

    var regex = RegExp(
      r"^(?:\+20|0)?1[0125]\d{8}$",
    );

    if (!regex.hasMatch(value)) {
      return """Must be 11 digits starts with (+20) or 0
Prefix is 10, 11, 12 or 15 only""";
    }

    return null;
  }

  static String? validateLocationLink(String? value, String? location) {
    if (location == null || location.trim().isEmpty) {
      return "You must enter location";
    } else {
      if (value == null || value.trim().isEmpty) {
        return 'Add Link for Location';
      }
      return null;
    }
  }

  static String? validateLocationLink2(String? location) {
    if (location == null || location.trim().isNotEmpty) {
      return "Add Link for location";
    } else {
      return null;
    }
  }

  static String? validateEmpty(String? value, String? title) {
    if (value == null || value.trim().isEmpty) {
      return 'You must enter your $title';
    }
    return null;
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
