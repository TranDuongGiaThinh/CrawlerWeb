class UserModel {
  int id;
  String username;
  String fullname;
  String email;
  String phone;
  bool locked;
  bool isAdmin;
  int configCount;
  int exportCount;
  int autoConfigCount;

  UserModel({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.isAdmin,
    required this.locked,
    required this.configCount,
    required this.exportCount,
    required this.autoConfigCount,
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
      configCount: json['config_count'],
      exportCount: json['export_count'],
      autoConfigCount: json['auto_config_count'],
    );
  }
}
