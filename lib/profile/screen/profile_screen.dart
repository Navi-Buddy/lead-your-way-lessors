import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/onboarding/screens/on_boarding_screen.dart';
import 'package:lyw_lessors/profile/domain/model/user_model.dart';
import 'package:lyw_lessors/profile/domain/service/user_service.dart';
import 'package:lyw_lessors/profile/services/user_service_impl.dart';
import 'package:lyw_lessors/profile/widgets/logout_alert.dart';
import 'package:lyw_lessors/profile/widgets/profile_picture.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';
import 'package:lyw_lessors/shared/services/smooth_transition_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserService userService;
  User? _user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    String? accessToken = await LocalStorageServiceImpl()
        .retrieve<String>(ValidateTokenMiddleware.tokenKeyName);
    int? userId = await LocalStorageServiceImpl()
        .retrieve<int>(ValidateTokenMiddleware.userIdKeyName);
    if (accessToken != null && userId != null) {
      userService = UserServiceImpl(accessToken: accessToken);
      final user = await userService.getUserById(userId);
      setState(() {
        _user = user;
      });
    } else {}
  }

  Future<void> _confirmLogout() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutDialog(
          onConfirm: _logout,
        );
      },
    );
  }

  void _logout() async {
    await LocalStorageServiceImpl().remove(ValidateTokenMiddleware.tokenKeyName);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      smoothTransition(
        context,
        widget,
        const OnBoardingScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Padding(padding: EdgeInsets.all(15.0)),
                ProfilePicture(
                  imagePath:
                      _user?.imageData != null
                      ? _user!.imageData 
                      : "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                  onClick: () async {},
                ),
                const SizedBox(height: 24),
                buildName(),
                const SizedBox(height: 32),
                buildAbout(),
                const SizedBox(height: 32),
                buildBicycles(),
                const SizedBox(height: 32),
              ],
            ),
          ),
          buildLogoutButton(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            _user != null
                ? "${_user!.userFirstName} ${_user!.userLastName}"
                : "Loading...",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            _user != null 
            ? "${_user!.userEmail} | ${_user?.userPhone != null ? _user!.userPhone : "No phone number"}"
            : "Loading...",
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text("This is my description...")
          ],
        ),
      );

  Widget buildBicycles() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reserved bicycles",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Text(
              "Favorite bicycles",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget buildLogoutButton() => Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: FilledButton(
          onPressed: _confirmLogout,
          style: FilledButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            fixedSize: const Size(250, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: const Text("Logout"),
        ),
      );
}
