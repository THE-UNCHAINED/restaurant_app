import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/services/location_service.dart';
import 'package:restaurant_app/services/zomato_service.dart';

class NearbyScreen extends StatefulWidget {
  NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  final locationService = LocationService();
  final zomatoService = ZomatoService();
  Future<List<RestaurantModel>>? _restaurantsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _restaurantsFuture = _fetchNearbyRestaurants();
  }

  Future<List<RestaurantModel>> _fetchNearbyRestaurants() async {
    Position? position = await locationService.getUserLocation();

    if (position == null) {
      return [];
    }

    List<RestaurantModel> nearbyRestaurants = await zomatoService
        .gpsRestaurantNearby(position.latitude, position.longitude);
    return nearbyRestaurants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THIS IS NEARBY Restaurants")),

      body: FutureBuilder(
        future: _restaurantsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data == null) {
            return Center(child: Text('Could not get any Restaurants'));
          }
          if (snapshot.hasData) {
            List<RestaurantModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].name),
                  subtitle: Text(data[index].address),
                  trailing: Text(data[index].rating.toString()),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
