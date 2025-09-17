abstract class Validators {
  static String? nameValidator(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "This field is required";
    }
    if (name.length < 7) {
      return "Name must be at least 7 chars";
    }
    return null;
  }

  static String? emailValidator(String? email) {
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "This field is required";
    }
    if (!regExp.hasMatch(email)) {
      return "Invalid Email ";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    RegExp regExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.trim().isEmpty) {
      return "This field is required";
    }
    if (!regExp.hasMatch(password)) {
      return "Password must include at least \n one lower case \n one upper case \n numeric number \n one special character";
    }
    return null;
  }
}
