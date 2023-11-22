import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeBoardingMessage extends StatefulWidget {
  const WelcomeBoardingMessage({ Key? key }) : super(key: key);

  @override
  State<WelcomeBoardingMessage> createState() => _WelcomeBoardingMessageState();
}

class _WelcomeBoardingMessageState extends State<WelcomeBoardingMessage> {
  final image = Lottie.asset('assets/welcome.json');

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
          const Text(
            "Lead Your Way Lessors",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.orange
            ),
          ),
          image,
          const Text(
            "Your application to manage your rental bicycles",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}