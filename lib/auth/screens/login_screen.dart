import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lyw_lessors/auth/domain/models/LoginFormData.dart';
import 'package:lyw_lessors/auth/domain/models/LoginResponse.dart';
import 'package:lyw_lessors/auth/domain/services/AuthService.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/auth/screens/sign_up_screen.dart';
import 'package:lyw_lessors/auth/services/AuthServiceImpl.dart';
import 'package:lyw_lessors/auth/widgets/login_form.dart';
import 'package:lyw_lessors/configuration/constants/environment.dart';
import 'package:lyw_lessors/navigation/widgets/app_navigator.dart';
import 'package:lyw_lessors/shared/domain/services/local_storage_service.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';
import 'package:lyw_lessors/shared/services/smooth_transition_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthServiceImpl();
  final LocalStorageService localStorageService = LocalStorageServiceImpl();

  void onSubmit(LoginFormData data) async {
    LoginResponse? response = await authService.login(data.email, data.password);

    if (!context.mounted) return;

    if (response == null) {
      sendNotifyMessage(context, "Wrong credential. Please try again.");
      return;
    }

    localStorageService.persist(ValidateTokenMiddleware.tokenKeyName, response.token);

    smoothTransition(
      context,
      widget,
      const AppNavigator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo-lyw.png',
              width: 125,
              height: 125,
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Text("HomePage"),
                  ),
                );
              },
              child: const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 24, color: Color(0xff424242)),
              ),
            ),
            const SizedBox(height: 32),
            LoginForm(onSubmit: onSubmit),
            const SizedBox(height: 96),
            SignUpLink(view: widget),
          ],
        ),
      ),
    );
  }
}

class SignUpLink extends StatelessWidget {
  final Widget view;

  const SignUpLink({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            smoothTransition(
              context,
              view,
              const SignUpScreen(),
            );
          },
          child: const Text(
            "Sign up",
            style: TextStyle(
              color: Color.fromARGB(255, 238, 163, 113),
              backgroundColor: Color.fromARGB(0, 138, 132, 132),
            ),
          ),
        ),
      ],
    );
  }
}
