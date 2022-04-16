mixin ValidationMixin {
  String? validateEmail (String? value) {
    if(!value!.trim().contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword (String? value) {
    if (value!.trim().length < 4) {
      return 'Password must be at least 4 characters long';
    }
    return null;
  }
}