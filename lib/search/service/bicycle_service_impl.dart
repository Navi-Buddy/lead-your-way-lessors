import 'package:dio/dio.dart';
import 'package:lyw_lessors/configuration/constants/environment.dart';
import 'package:lyw_lessors/search/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/search/domain/service/bicycle_service.dart';

class BicycleServiceImpl extends BicycleService {
  final Dio dio;

  BicycleServiceImpl({required String accessToken})
      : dio = Dio(
          BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        );

  @override
  Future<List<Bicycle>?> getBicycles(int id) async {
    final response = await dio.get('api/cyclescape/v1/users/${id.toString()}');
    final List<dynamic> bicycleList = response.data['bicycles'];

    final bicycles = bicycleList
        .map((bicycleJson) => Bicycle.fromJson(bicycleJson))
        .toList();
    try {
      return bicycles;
    } catch (e) {
      return null;
    }
  }
}
