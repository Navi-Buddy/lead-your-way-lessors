import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/bicycles/domain/service/bicycle_service.dart';
import 'package:lyw_lessors/bicycles/service/bicycle_service_impl.dart';
import 'package:lyw_lessors/bicycles/widgets/bicycle_form.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';

class AddBicycleScreen extends StatefulWidget {
  const AddBicycleScreen({super.key});

  @override
  State<AddBicycleScreen> createState() => _AddBicycleScreenState();
}

class _AddBicycleScreenState extends State<AddBicycleScreen> {
  late BicycleService bicycleService;

  void onSubmit(Bicycle bicycle) async {
    sendNotifyMessage(context, 'Adding bike...');
    String? accessToken = await LocalStorageServiceImpl()
        .retrieve<String>(ValidateTokenMiddleware.tokenKeyName);
    int? userId = await LocalStorageServiceImpl()
        .retrieve<int>(ValidateTokenMiddleware.userIdKeyName);
    if (accessToken != null && userId != null) {
      bicycleService = BicycleServiceImpl(accessToken: accessToken);
      await bicycleService.addBicycle(userId, bicycle);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 50),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Create your bike',
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 32),
                  BicycleForm(onSubmit: onSubmit)
                ],
              ),
            ],
          ),
        ));
  }
}
