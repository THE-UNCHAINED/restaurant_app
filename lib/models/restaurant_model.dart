class RestaurantModel {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String cuisines;
  final int costForTwo;
  final int reviewCount;
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
    required this.reviewCount,
    required this.rating,
    this.imageUrl,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      cuisines: json['cuisines'],
      costForTwo: int.parse(json['costForTwo']),
      reviewCount: int.parse(json['reviewsCount']),
      rating: json['rating'],
      imageUrl: json['imageUrl'],
    );
  }
}
