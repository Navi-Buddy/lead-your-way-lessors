import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/bicycles/domain/service/bicycle_service.dart';
import 'package:lyw_lessors/bicycles/service/bicycle_service_impl.dart';
import 'package:lyw_lessors/bicycles/widgets/bicycle_list.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';

class BicyclesScreen extends StatefulWidget {
  const BicyclesScreen({super.key});

  @override
  State<BicyclesScreen> createState() => _BicyclesScreenState();
}

class _BicyclesScreenState extends State<BicyclesScreen> {
  final scrollController = ScrollController();
  late BicycleService bicycleService;
  List<Bicycle>? _bicycles;

  @override
  void initState() {
    getBicycles();
    super.initState();
  }

  void getBicycles() async {
    String? accessToken = await LocalStorageServiceImpl()
        .retrieve<String>(ValidateTokenMiddleware.tokenKeyName);
    int? userId = await LocalStorageServiceImpl()
        .retrieve<int>(ValidateTokenMiddleware.userIdKeyName);
    if (accessToken != null && userId != null) {
      bicycleService = BicycleServiceImpl(accessToken: accessToken);
      final bicycles = await bicycleService.getBicycles(userId);
      setState(() {
        _bicycles = bicycles;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _bicycles != null
            ? BicycleList(
                bicycles: _bicycles!,
                scrollController: scrollController,
              )
            :  Center(
                child: Image.asset('assets/crying_image.gif')
              ),
      ),
    );
  }
}
