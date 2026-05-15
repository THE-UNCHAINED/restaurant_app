import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant_app/services/location_service.dart';

class NearbyScreen extends StatefulWidget {
  NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  final locationService = LocationService();
  Future<Position?>? _locationFuture;

  @override
  void initState() {
    _locationFuture = locationService.getUserLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THIS IS NEARBY Restaurants")),

      body: FutureBuilder(
        future: _locationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data == null) {
            return Center(child: Text('Could not get location'));
          }
          if (snapshot.hasData) {
            final data = snapshot.data;
            return SingleChildScrollView(
              child: Column(children: [Text(data.toString())]),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
