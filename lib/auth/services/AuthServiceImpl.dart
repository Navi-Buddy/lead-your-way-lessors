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
}
