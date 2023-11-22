import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lyw_lessors/configuration/constants/environment.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/bicycles/domain/service/bicycle_service.dart';

class BicycleServiceImpl extends BicycleService {
  final Dio dio;

  BicycleServiceImpl({required String accessToken})
      : dio = Dio(
          BaseOptions(
            baseUrl: Environment.apiUrl,
          ),
        );

  @override
  Future<List<Bicycle>?> getBicycles(int id) async {
    try {
      final response =
          await dio.get('api/cyclescape/v1/users/${id.toString()}');
      final List<dynamic> bicycleList = response.data['bicycles'];

      final bicycles = bicycleList
          .map((bicycleJson) => Bicycle.fromJson(bicycleJson))
          .toList();

      return bicycles;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String> addBicycle(int userId, Bicycle bicycle) async {
    try {
      final response = await dio
          .post('api/cyclescape/v1/bicycles/${userId.toString()}', data: {
        'bicycleName': bicycle.bicycleName,
        'bicycleDescription': bicycle.bicycleDescription,
        'bicyclePrice': bicycle.bicyclePrice,
        'bicycleSize': bicycle.bicycleSize,
        'bicycleModel': bicycle.bicycleModel,
        'imageData': bicycle.imageData,
        'latitudeData': bicycle.latitude,
        'longitudeData': bicycle.longitude,
      });
      if (response.statusCode == 201) {
        return 'Bike created successfully';
      } else {
        return 'An error has occured';
      }
    } catch (e) {
      log(e.toString());
    }
    return 'An error has occured';
  }
}
