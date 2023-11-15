import 'package:flutter/material.dart';
import 'package:lyw_lessors/search/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/search/widgets/hero_image.dart';

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
              padding: const EdgeInsets.all(16),
              child: HeroImage(bike: bike),
            ),
            Text(
              bike.bicycleName,
              style: const TextStyle(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
