class RestaurantModel {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String cuisines;
  final int costForTwo;
  final double rating;
  final String? imageUrl;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.cuisines,
    required this.costForTwo,
    required this.rating,
    this.imageUrl,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    final restaurant = json['restaurant'];
    final location = restaurant['location'];
    final rating = restaurant['user_rating'];

    return RestaurantModel(
      id: restaurant['id'].toString(),
      name: restaurant['name'],
      address: location['address'],
      latitude: double.parse(location['latitude']),
      longitude: double.parse(location['longitude']),
      cuisines: restaurant['cuisines'],
      costForTwo: restaurant['average_cost_for_two'] ?? 0,
      rating: double.parse(rating['aggregate_rating'] ?? '0'),
      imageUrl: restaurant['featured_image'],
    );
  }
}
