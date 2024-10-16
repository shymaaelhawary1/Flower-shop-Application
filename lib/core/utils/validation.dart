class MyValidation {
  String? mailValidate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please it is required to enter an email';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(input)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? passwordValidate(String? input) {
       
       if (input == null || input.isEmpty) {
      return 'Please it is required to enter a password';
    }
    final passwordRegex = RegExp(r'^[A-Za-z0-9]{8,}$');
    if (!passwordRegex.hasMatch(input)) {
      return 'Please enter a valid password';
    }



  }

}
