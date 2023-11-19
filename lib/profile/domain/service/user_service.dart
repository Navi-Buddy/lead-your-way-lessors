import 'package:lyw_lessors/profile/domain/model/user_model.dart';

abstract class UserService {
  Future<User?> getUserById(int id);

  Future<dynamic> putUserById(int id, User user);
}