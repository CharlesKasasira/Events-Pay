class Validator {
  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    );

    if (email.isEmpty) {
      return "Email is required";
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email';
    }

    return null;
  }

  static String? validatePhoneNumber({required String? phoneNumber}) {
    if (phoneNumber == null) {
      return null;
    }

    final RegExp phoneRegExp = RegExp(
      r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{3}$",
    );

    if (phoneNumber.isEmpty) {
      return "Phone Number is required";
    } else if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Invalid phone Number';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return "Password is required";
    } else if (password.length < 8) {
      return 'Enter a password with length at least 8';
    }

    return null;
  }

  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return "Name is required";
    } else if (name.length < 3) {
      return 'Enter a name with length at least 3';
    }

    return null;
  }

  static String? validateNumber({required String? phoneNumber}) {
    if (phoneNumber == null) {
      return null;
    }

    if (phoneNumber.isEmpty) {
      return "Phone Number is required";
    } else if (phoneNumber.length < 9) {
      return 'Invalid number';
    }

    return null;
  }
}