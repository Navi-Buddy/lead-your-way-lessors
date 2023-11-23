import 'package:dio/dio.dart';
import 'package:lyw_lessors/auth/domain/models/LoginResponse.dart';
import 'package:lyw_lessors/auth/domain/services/AuthService.dart';
import 'package:lyw_lessors/configuration/constants/environment.dart';

class AuthServiceImpl extends AuthService {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );

  @override
  Future<LoginResponse?> login(String email, String password) async {
    try {
      final response = await dio.post('api/cyclescape/v1/auth/login',
          data: {'userEmail': email, 'userPassword': password});
      final userResponse = LoginResponse.fromJson(response.data);
      return userResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<LoginResponse?> signUp(String email, String password) async {
    final signUpData = {
      'userEmail': email,
      'userPassword': password,
      'userFirstName': 'John',
      'userLastName': 'Doe',
      'userBirthDate': '1990-01-01',
    };

    try {
      final response =
          await dio.post('api/cyclescape/v1/auth/register', data: signUpData);
      final userResponse = LoginResponse.fromJson(response.data);
      return userResponse;
    } catch (e) {
      return null;
    }
  }
}
