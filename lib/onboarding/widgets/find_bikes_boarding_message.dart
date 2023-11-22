import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FindBikesBoardingMessage extends StatefulWidget {
  const FindBikesBoardingMessage({ Key? key }) : super(key: key);

  @override
  State<FindBikesBoardingMessage> createState() => _FindBikesBoardingMessageState();
}

class _FindBikesBoardingMessageState extends State<FindBikesBoardingMessage> {
  final image = Lottie.asset('assets/find-bikes.json');

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Visualize your bikes",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                ),
              ),
              Text(
                "easily",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.orange
                ),
              ),
            ],
          ),
          image,
          const Text(
            "Find all available information about your bike",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}