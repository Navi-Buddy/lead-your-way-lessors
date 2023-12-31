import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';

abstract class BicycleService {
  Future<List<Bicycle>?> getBicycles(int id);
  Future<List<Bicycle>?> getBicyclesByUserId(int id);

  Future<String> addBicycle(int userId, Bicycle bicycle);
}
