import 'package:flutter/material.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';

class BicycleDetail extends StatelessWidget {
  const BicycleDetail({super.key, required this.bicycle});
  final Bicycle bicycle;

  @override
  Widget build(BuildContext context) {
  final image = Image.network(bicycle.imageData, fit: BoxFit.fitWidth);
  final dailyPrice = bicycle.bicyclePrice / 30;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.orange,
              flexibleSpace: FlexibleSpaceBar(
                background: image,
                title: Text(
                  bicycle.bicycleName,
                  style: const TextStyle(shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '\$${dailyPrice.toStringAsFixed(2)} a day',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              bicycle.bicycleDescription,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 40),
            const Text('Availability',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Spacer(),
            const Row(
              children: [
                Spacer(),
                SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        //TODO: Add navigation
                        onPressed: null,
                        child: Text('Rent now')))
              ],
            )
          ]),
        ),
      ),
    );
  }
}