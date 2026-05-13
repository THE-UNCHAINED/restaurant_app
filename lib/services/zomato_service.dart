import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/restaurant_model.dart';

class ZomatoService {
  final String apiKey = '';
  final String baseUrl = "https://api.zomato.com/api/v2.1";

  Future<List<RestaurantModel>> searchRestaurants(String query) async {
    try {
      final url = Uri.parse(
        '$baseUrl/restaurants/search?q=$query&apikey=$apiKey',
      );
      //uri.parse converts string to url..idiot
      // basic structure http.get(url, headers)

      final response = await http.get(
        url,
        headers: {'apiKey': apiKey, 'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // List<RestaurantModel> restaurants = (jsonData['restaurants'] as List)
        //     .map((rest) => RestaurantModel.fromJson(rest))
        //     .toList();

        List restaurantsList = jsonData['restaurants'] as List;
        List<RestaurantModel> restaurants = [];

        for (var rest in restaurantsList) {
          RestaurantModel model = RestaurantModel.fromJson(rest);
          restaurants.add(model);
        }

        return restaurants;
      }

      return [];
    } catch (e) {
      print('Error searching: $e');
      return [];
    }
  }

  Future<List<RestaurantModel>> gpsRestaurantNearby(
    double latitude,
    double longitude,
  ) async {
    try {
      final url = Uri.parse(
        '$baseUrl/search?lat=$latitude&lon=$longitude&apikey=$apiKey',
      );

      final response = await http.get(
        url,
        headers: {'apikey': apiKey, 'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        List restaurantsList = jsonData['restaurants'] as List;

        List<RestaurantModel> restaurants = [];
        for (var rest in restaurantsList) {
          RestaurantModel model = RestaurantModel.fromJson(rest);
          restaurants.add(model);
        }
        return restaurants;
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error getting nearby: $e');
      return [];
    }
  }
}
