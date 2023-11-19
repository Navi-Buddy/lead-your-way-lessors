import 'package:dio/dio.dart';
import 'package:lyw_lessors/configuration/constants/environment.dart';
import 'package:lyw_lessors/profile/domain/model/user_model.dart';
import 'package:lyw_lessors/profile/domain/service/user_service.dart';

class UserServiceImpl extends UserService {
  final Dio dio;

  UserServiceImpl({required String accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<User?> getUserById(int id) async {
    try {
      final response =
          await dio.get('api/cyclescape/v1/users/${id.toString()}');
      final dynamic user = User.fromJson(response.data);
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future putUserById(int id, User user) {
    try {
      final response = dio.put('api/cyclescape/v1/users/${id.toString()}',
          data: {
            'userFirstName': user.userFirstName,
            'userLastName': user.userLastName,
            'userEmail': user.userEmail,
            'userPhone': user.userPhone,
            'imageData': user.imageData,
          });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
