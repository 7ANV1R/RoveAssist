class AuthUserModel {
  final int id;
  final String username;
  final String email;
  final String? companyName;
  final bool isAgent;
  final String? profileImage;

  AuthUserModel({
    required this.profileImage,
    required this.id,
    required this.username,
    required this.email,
    required this.companyName,
    required this.isAgent,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    String companyName = "Not Found";
    //if (json['company_name'] != null) companyName = json['company_name'] as String;
    return AuthUserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      companyName: json['company_name'] as String?,
      isAgent: (json['is_agent'] as bool?) ?? false,
      profileImage: json['profile_image'] as String?,
    );
  }
}
