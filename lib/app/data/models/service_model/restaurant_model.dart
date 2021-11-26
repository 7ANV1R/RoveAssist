class RestaurantModel {
  final int id;
  final int host;
  final String title;
  final String description;
  final String? coverImage;
  final String? latitude;
  final String? longitude;

  RestaurantModel({
    required this.coverImage,
    required this.id,
    required this.host,
    required this.title,
    required this.description,
    this.latitude,
    this.longitude,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as int,
      host: json['user'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      coverImage: json['cover_image'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );
  }
}
