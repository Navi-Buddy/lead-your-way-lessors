import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lyw_lessors/auth/screens/login_screen.dart';
import 'package:lyw_lessors/onboarding/widgets/find_bikes_boarding_message.dart';
import 'package:lyw_lessors/onboarding/widgets/start_adventure_boarding_message.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lyw_lessors/onboarding/widgets/welcome_boarding_message.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool onLastPage = false;
  final PageController _controller = PageController();
  final image = Lottie.network(
    'https://lottie.host/73c3a565-e326-46b3-b216-143682ae84bf/doCOzH8NHo.json'
  );

  final List<Widget> subScreens = const [
    WelcomeBoardingMessage(),
    FindBikesBoardingMessage(),
    StartAdventureBoardingMessage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: subScreens,
            onPageChanged: (index) {
              setState(() => onLastPage = (index + 1 == subScreens.length));
            },
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(subScreens.length - 1);
                  },
                  child: const Text("Skip")),
                SmoothPageIndicator(controller: _controller, count: subScreens.length),

                onLastPage
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen())
                      );
                    },
                    child: const Text("Done")
                  ) : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                      },
                    child: const Text("Next")
                  )
              ]
            )
          )
        ],
      )
    );
  }
}
