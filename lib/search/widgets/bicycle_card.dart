import 'package:flutter/material.dart';
import 'package:lyw_lessors/search/domain/model/bicycle_model.dart';

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Hero(
                tag: bike.id,
                child: FadeInImage(
                  image: NetworkImage(bike.imageData!),
                  placeholder: const AssetImage('assets/loading_image.gif'),
                ),
              ),
            ),
            Text(
              bike.bicycleName!,
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
