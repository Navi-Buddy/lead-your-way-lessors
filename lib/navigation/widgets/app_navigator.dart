import 'package:flutter/material.dart';
import 'package:lyw_lessors/navigation/domain/models/enumeration/app_route.dart';
import 'package:lyw_lessors/navigation/widgets/enhanced_bottom_navigation_bar.dart';
import 'package:lyw_lessors/profile/screen/profile_screen.dart';
import 'package:lyw_lessors/public/screens/route_not_found_screen.dart';
import 'package:lyw_lessors/bicycles/screen/bicycle_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  Widget view = const RouteNotFoundScreen();

  void navigateTo(AppRoute route) {
    setState(() {
      switch (route) {
        case AppRoute.home:
          view = const BicyclesScreen();
          break;
        case AppRoute.characterSearch:
          view = const RouteNotFoundScreen();
          break;
        case AppRoute.profile:
          view = const ProfileScreen();
          break;
        default:
          view = const RouteNotFoundScreen();
      }
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
