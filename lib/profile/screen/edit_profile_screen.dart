import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/navigation/widgets/app_navigator.dart';
import 'package:lyw_lessors/profile/domain/model/user_model.dart';
import 'package:lyw_lessors/profile/domain/service/user_service.dart';
import 'package:lyw_lessors/profile/services/user_service_impl.dart';
import 'package:lyw_lessors/profile/widgets/profile_form.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';

class EditProfileScreen extends StatefulWidget {
  final User? user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late UserService userService;

  void navigateToProfile() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AppNavigator()),
    );
  }

  void onSubmit(User user) async {
    sendNotifyMessage(context, 'Updating profile...');
    String? accessToken = await LocalStorageServiceImpl()
        .retrieve<String>(ValidateTokenMiddleware.tokenKeyName);
    int? userId = await LocalStorageServiceImpl()
        .retrieve<int>(ValidateTokenMiddleware.userIdKeyName);
    if (accessToken != null && userId != null) {
      userService = UserServiceImpl(accessToken: accessToken);
      await userService.putUserById(userId, user);
      navigateToProfile();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: false,
                pinned: true,
                backgroundColor: Colors.orange,
              )
            ];
          },
          body: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 50),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Edit your profile',
                        style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 32),
                    ProfileForm(onSubmit: onSubmit, user: widget.user)
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
