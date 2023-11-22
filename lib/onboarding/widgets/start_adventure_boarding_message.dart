import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartAdventureBoardingMessage extends StatefulWidget {
  const StartAdventureBoardingMessage({ Key? key }) : super(key: key);

  @override
  State<StartAdventureBoardingMessage> createState() => _StartAdventureBoardingMessageState();
}

class _StartAdventureBoardingMessageState extends State<StartAdventureBoardingMessage> {
  final image = Lottie.asset('assets/start-adventure.json');

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start earning some",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32
            ),
          ),
          const Text(
            "money",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.orange
            ),
          ),
          image,
        ],
      ),
    );
  }
}