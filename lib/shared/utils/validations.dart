class Validations {
  
  bool isValidEmail(String email) {
    return email.contains("@") && email.contains(".");
  }

  bool isValidName(String name) {
    if (name.length > 25) {
      return false;
    }
    return true;
  }

  bool isValidImage(String image) {
    return image.contains("http") && image.contains(".jpg");
  }

  bool isValidNumber(String number) {
    return number.length == 9;
  }
}
