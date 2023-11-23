import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/domain/models/LoginFormData.dart';
import 'package:lyw_lessors/auth/domain/models/LoginResponse.dart';
import 'package:lyw_lessors/auth/domain/services/AuthService.dart';
import 'package:lyw_lessors/auth/middlewares/validate_token_middleware.dart';
import 'package:lyw_lessors/auth/screens/login_screen.dart';
import 'package:lyw_lessors/auth/services/AuthServiceImpl.dart';
import 'package:lyw_lessors/navigation/widgets/app_navigator.dart';
import 'package:lyw_lessors/shared/domain/services/local_storage_service.dart';
import 'package:lyw_lessors/shared/services/local_storage_service_impl.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';
import 'package:lyw_lessors/shared/services/smooth_transition_service.dart';
import 'package:lyw_lessors/shared/widgets/lyw_rounded_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService authService = AuthServiceImpl();
  final LocalStorageService localStorageService = LocalStorageServiceImpl();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  void onSignUp(LoginFormData data) async {
    sendNotifyMessage(context, 'Creating account');
    LoginResponse? response =
        await authService.signUp(data.email, data.password);

    if (!context.mounted) return;

    if (response == null) {
      sendNotifyMessage(context, "Something went wrong. Please try again.");
      return;
    }

    localStorageService.persist(
        ValidateTokenMiddleware.tokenKeyName, response.token);
    localStorageService.persist(
        ValidateTokenMiddleware.userIdKeyName, response.id);

    smoothTransition(
      context,
      widget,
      const AppNavigator(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
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
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            LywRoundedInputField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: "Your email",
              icon: const Icon(Icons.person),
              controller: emailController,
            ),
            RoundedInputFieldObscure(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              hintText: "Your password",
              icon: const Icon(Icons.lock),
              controller: passwordController,
            ),
            RoundedInputFieldObscure(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              hintText: "Confirm Password",
              icon: const Icon(Icons.lock),
              controller: passwordConfirmationController,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                final passwordConfirmation =
                    passwordConfirmationController.text;
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email);

                if (email.isEmpty ||
                    password.isEmpty ||
                    passwordConfirmation.isEmpty) {
                  sendNotifyMessage(context, "Please fill all fields");
                  return;
                }

                if (!emailValid) {
                  sendNotifyMessage(
                      context, "Please enter a valid email address");
                  return;
                }

                if (password != passwordConfirmation) {
                  sendNotifyMessage(context, "Your password does not match");
                  return;
                }

                onSignUp(LoginFormData(email: email, password: password));
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 252, 150, 82),
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    smoothTransition(
                      context,
                      widget,
                      const LoginScreen(),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Color.fromARGB(0, 138, 132, 132),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
