class UserInfoValidation {
  String? phoneValidation(String phone) {
    if (phone.isEmpty) {
      return 'Phone can\'t be empty';
    }

    return null;
  }

  String? emailValidation(String email) {
    if (email.isEmpty) {
      return 'Enter email please';
    }
    // if (!email.endsWith(emailSuffix)) {
    //   return 'Email must end with $emailSuffix';
    // }
    final RegExp emailRegExp =
        RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$');
    bool valid = emailRegExp.hasMatch(email);
    if (!valid) {
      return 'Not a valid email';
    }
    return null;
  }

  String? firstNameValidation(String name) {
    if (name.isEmpty) {
      return 'First name can\'t be empty';
    }
    if (name.length < 3) {
      return 'First name can\'t be shorter than 3 letters';
    }
    return null;
  }

  String? lastNameValidation(String name) {
    if (name.isEmpty) {
      return 'Last name can\'t be empty';
    }
    if (name.length < 3) {
      return 'Last name can\'t be shorter than 3 letters';
    }
    return null;
  }

  String? passwordValidation(String? v) {
    if (v == null || v.isEmpty) {
      return 'Can\'t be empty';
    }
    if (v.length < 8) {
      return 'Can\'t be less than 8 letters';
    }
    return null;
  }
}
