class GoogleUserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;

  GoogleUserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
  });
}
