class HotelModel {
  final int id;
  final int host;
  final String title;
  final String? coverImage;
  final String? location;

  HotelModel(
      {required this.coverImage,
      required this.id,
      required this.host,
      required this.title,
      required this.location});

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] as int,
      host: json['host'] as int,
      title: json['title'] as String,
      coverImage: json['cover_image'] as String?,
      location: json['location'] as String?,
    );
  }
}
