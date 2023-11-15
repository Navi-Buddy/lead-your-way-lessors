import 'package:flutter/material.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/bicycles/widgets/bicycle_info.dart';
import 'package:lyw_lessors/bicycles/widgets/hero_image.dart';

class BicycleCard extends StatelessWidget {
  const BicycleCard({
    super.key,
    required this.bike,
  });

  final Bicycle bike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: HeroImage(bike: bike),
            ),
            SizedBox(
              width: double.infinity,
              child: BicycleInfo(bike: bike),
            )
          ],
        ),
      ),
    );
  }
}
