class TravelNoteModel {
  final int id;
  final int user;
  final String title;
  final String description;
  final DateTime updatedOn;
  final DateTime createdOn;

  TravelNoteModel(
      {required this.id,
      required this.user,
      required this.title,
      required this.description,
      required this.updatedOn,
      required this.createdOn});

  factory TravelNoteModel.fromJson(Map<String, dynamic> json) {
    return TravelNoteModel(
      id: json['id'] as int,
      user: json['user'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      updatedOn: DateTime.parse(json['updated_on'].toString()),
      createdOn: DateTime.parse(json['created_on'].toString()),
    );
  }
}
