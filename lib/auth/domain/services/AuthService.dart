import 'package:lyw_lessors/auth/domain/models/LoginResponse.dart';

abstract class AuthService {
  Future<LoginResponse?> login(String email, String password);
}