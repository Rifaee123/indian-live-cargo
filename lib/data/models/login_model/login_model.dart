// user_model.dart
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final int branch;
  final String role;
  final String apiToken;
  final String createdAt;
  final String updatedAt;
  final int status;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.branch,
    required this.role,
    required this.apiToken,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      branch: json['branch'],
      role: json['role'],
      apiToken: json['api_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
    );
  }
}
