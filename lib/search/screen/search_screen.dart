import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/search/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/search/domain/service/bicycle_service.dart';
import 'package:lyw_lessors/search/service/bicycle_service_impl.dart';
import 'package:lyw_lessors/search/widgets/bicycle_list.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    if (accessToken != null) {
      bicycleService = BicycleServiceImpl(accessToken: accessToken);
      final bicycles = await bicycleService.getBicycles();
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
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              ),
      ),
    );
  }
}
