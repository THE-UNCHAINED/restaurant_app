import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final RestaurantModel restaurants;
  const RestaurantDetailScreen({super.key, required this.restaurants});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurants.name)),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Text(restaurants.address),
            Text(restaurants.cuisines),
            Text(restaurants.rating.toString()),
            Text(restaurants.costForTwo.toString()),
          ],
        ),
      ),
    );
  }
}
