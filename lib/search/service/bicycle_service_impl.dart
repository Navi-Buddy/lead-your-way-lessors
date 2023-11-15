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
  Future<List<Bicycle>?> getBicycles() async {
    try {
      final response = await dio.get('api/cyclescape/v1/bicycles');
      final bicycles = (response.data as List)
          .map((bicycle) => Bicycle.fromJson(bicycle))
          .toList();
      return bicycles;
    } catch (e) {
      return null;
    }
  }
}
