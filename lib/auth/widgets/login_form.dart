import 'package:flutter/material.dart';
import 'package:lyw_lessors/auth/domain/models/LoginFormData.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';
import 'package:lyw_lessors/shared/widgets/lyw_rounded_input_field.dart';

class LoginForm extends StatefulWidget {
  final void Function(LoginFormData) onSubmit;

  const LoginForm({super.key, required this.onSubmit});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    return email.contains("@") && email.contains(".");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LywRoundedInputField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          hintText: "Example@mail.com",
          icon: const Icon(Icons.person),
          controller: emailController,
        ),
        RoundedInputFieldObscure(
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          hintText: "Password",
          icon: const Icon(Icons.lock),
          controller: passwordController,
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () {
            final email = emailController.text;
            final password = passwordController.text;

            if (email.isEmpty || password.isEmpty) {
              sendNotifyMessage(context, "Please fill all the fields.");
              return;
            }

            if (!isValidEmail(email)) {
              sendNotifyMessage(context, "Please enter a valid email address.");
              return;
            }

            widget.onSubmit(LoginFormData(email: email, password: password));
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 252, 150, 82),
            foregroundColor: Colors.white,
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: const Text("Login"),
        ),
      ],
    );
  }
}
