import 'package:flutter/material.dart';

void smoothTransition(
  BuildContext context,
  Widget currentPage,
  Widget nextPage,
  {
    double beginOffsetX = 0.0,
    double beginOffsetY = -1.0,
    double endOffsetX = 0.0,
    double endOffsetY = 1.0
  }
) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: Offset(beginOffsetX, beginOffsetY),
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: currentPage,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(endOffsetX, endOffsetY),
                end: const Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: nextPage,
            ),
          ],
        );
      },
      transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
          ) {
        return child;
      },
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 800),
    ),
  );
}