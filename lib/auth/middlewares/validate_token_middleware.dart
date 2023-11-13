import 'package:lyw_lessors/shared/domain/services/local_storage_service.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';

class ValidateTokenMiddleware {
  static String tokenKeyName = "lyw-jwt-key-name";
  late final LocalStorageService localStorageService;

  ValidateTokenMiddleware() {
    localStorageService = LocalStorageServiceImpl();
  }

  storageHasValidToken() async {
     return (await localStorageService.retrieve<String>(tokenKeyName)) != null;
  }
}