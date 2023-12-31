import 'package:flutter/material.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    required this.bike,
  });

  final Bicycle bike;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          image: NetworkImage(bike.imageData),
          placeholder: const AssetImage('assets/loading_image.gif'),
          imageErrorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }
}
