import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lyw_lessors/navigation/domain/models/enumeration/app_route.dart';

class EnhancedBottomNavigationBar extends StatelessWidget {
  final void Function(AppRoute) navigateTo;

  const EnhancedBottomNavigationBar({super.key, required this.navigateTo});

  void handleTabChange(int index) {
    AppRoute destination = AppRoute.notFound;

    switch (index) {
      case 0:
        destination = AppRoute.home;
      case 1:
        destination = AppRoute.myRentedBikes;
      case 2:
        destination = AppRoute.addBike;
      case 3:
        destination = AppRoute.profile;
      default:
        destination = AppRoute.notFound;
    }

    navigateTo(destination);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.orangeAccent,
            tabBackgroundColor: Colors.black12,
            activeColor: Colors.white,
            color: Colors.brown,
            onTabChange: ((value) {
              handleTabChange(value);
            }),
            tabs: const [
              GButton(
                icon: Icons.directions_bike_outlined,
                text: "My bikes",
              ),
              GButton(
                icon: Icons.monetization_on,
                text: "My rented bikes",
              ),
              GButton(
                icon: Icons.add,
                text: "Add a bike",
              ),
              GButton(
                icon: Icons.account_circle,
                text: "Profile",
              )
            ],
          )),
    );
  }
}
