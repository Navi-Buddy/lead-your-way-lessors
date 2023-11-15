import 'package:flutter/material.dart';
import 'package:lyw_lessors/search/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/search/widgets/bicycle_card.dart';

class BicycleList extends StatelessWidget {
  const BicycleList({
    super.key,
    required this.bicycles,
    required this.scrollController,
  });

  final List<Bicycle> bicycles;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.87,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 200.0,
        ),
        itemCount: bicycles.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < bicycles.length) {
            final bike = bicycles[index];
            return BicycleCard(bike: bike);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
