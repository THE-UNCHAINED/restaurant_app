import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final RestaurantModel restaurants;
  RestaurantDetailScreen(
    RestaurantModel data, {
    super.key,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
