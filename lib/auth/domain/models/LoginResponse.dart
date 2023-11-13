
class LoginResponse {
  final int id;
  final String token;
  final String refreshToken;

  LoginResponse({
    required this.id,
    required this.token,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['user_id'],
      token: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}