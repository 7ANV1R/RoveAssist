class PackageTourModel {
  final int id;
  final int host;
  final String title;
  final String description;
  final String? coverImage;

  PackageTourModel(
      {required this.coverImage,
      required this.id,
      required this.host,
      required this.title,
      required this.description});

  factory PackageTourModel.fromJson(Map<String, dynamic> json) {
    return PackageTourModel(
      id: json['id'] as int,
      host: json['host'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      coverImage: json['cover_image'] as String?,
    );
  }
}
