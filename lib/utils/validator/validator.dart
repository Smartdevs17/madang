class Validator {
  ///Validate Email
  static isValidEmail(String email) {
    if (email.isEmpty) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  ///Validate Password
  static bool isValidPassword(String password) {
    if (password.isEmpty) return false;
    if (password.contains(" ")) return false;
    return password.length >= 5 ? true : false;
  }

  ///Validate Name
  static String? nameValidator(String? val) {
    if (val == null) {
      return "Enter a valid name";
    }
    if (val.length < 5) {
      return "Name must be atleast 5 characters long";
    }
    return null;
  }

  //Validate Email field and ensure its unique
  static String? emailValidator(String? val) {
    if (val == null) return "Email cannot be empty";
    if (!isValidEmail(val)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  //Validate Email field and ensure its unique
  static String? emailValidatorSignUp(String? val, {required bool isUnique}) {
    if (val == null) return "Email cannot be empty";
    if (isUnique == false) return "Enter a unique email";
    if (!isValidEmail(val)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  //Validator password fields to be password
  static String? passwordValidator(String? val) {
    if (val == null) {
      return "Enter a valid password";
    }
    if (val.length < 5) {
      return "Password must be atleast 5 characters long";
    }
    if (!isValidPassword(val)) {
      return "Invalid password";
    } else {
      return null;
    }
  }

  //Validator for creating document
  static String? documentValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }
}
