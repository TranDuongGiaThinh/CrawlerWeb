class UserModel {
  int id;
  String username;
  String fullname;
  String email;
  String phone;
  bool locked;
  bool isAdmin;

  UserModel({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.isAdmin,
    required this.locked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      fullname: json['fullname'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      locked: json['locked'],
      isAdmin: json['is_admin'] ?? false,
    );
  }
}
