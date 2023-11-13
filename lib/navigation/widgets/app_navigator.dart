import 'package:flutter/material.dart';
import 'package:lyw_lessors/navigation/domain/models/enumeration/app_route.dart';
import 'package:lyw_lessors/navigation/widgets/enhanced_bottom_navigation_bar.dart';
import 'package:lyw_lessors/public/screens/route_not_found_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  Widget view = const RouteNotFoundScreen();

  void navigateTo(AppRoute route) {
    setState(() {
      // TODO: MISSING IMPLEMENTATION
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view,
      bottomNavigationBar: EnhancedBottomNavigationBar(navigateTo: navigateTo),
    );
  }
}