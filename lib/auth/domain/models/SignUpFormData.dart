class RegisterRequest {
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String userPassword;
  final String userBirthDate;

  RegisterRequest({
    required this.userEmail,
    required this.userPassword,
    this.userFirstName = 'John',
    this.userLastName = 'Doe',
    this.userBirthDate = '1990-01-01',
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      userEmail: json['userEmail'],
      userPassword: json['userPassword'],
      userFirstName: json['userFirstName'] ?? 'John',
      userLastName: json['userLastName'] ?? 'Doe',
      userBirthDate: json['userBirthDate'] ?? '1990-01-01',
    );
  }
}
