import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/navigation/widgets/app_navigator.dart';
import 'package:lyw_lessors/onboarding/screens/on_boarding_screen.dart';

class AuthWall extends StatelessWidget {
  const AuthWall({super.key});

  Future<bool> hasValidToken() async {
    final validateTokenMiddleware = ValidateTokenMiddleware();
    return await validateTokenMiddleware.storageHasValidToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: hasValidToken(),
        builder: (context, snapshot) {

          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }

          return snapshot.data == true
            ? const AppNavigator()
            : const OnBoardingScreen();
        },
      ),
    );
  }
}
