class PackageUserModel {
  int id;
  int userId;
  String userType;
  String renewalPackage;
  int days;
  int totalPrice;
  int maxConfig;
  int maxExport;
  int maxAutoConfig;
  bool isActive;
  DateTime createAt;

  PackageUserModel({
    required this.id,
    required this.userId,
    required this.userType,
    required this.renewalPackage,
    required this.days,
    required this.totalPrice,
    required this.maxConfig,
    required this.maxExport,
    required this.maxAutoConfig,
    required this.isActive,
    required this.createAt,
  });

  factory PackageUserModel.fromJson(Map<String, dynamic> json) {
    return PackageUserModel(
      id: json['id'],
      userId: json['user_id'],
      userType: json['user_type'],
      renewalPackage: json['renewal_package'],
      days: json['days'],
      totalPrice: json['total_price'],
      maxConfig: json['max_config'],
      maxExport: json['max_export'],
      maxAutoConfig: json['max_auto_config'],
      isActive: json['is_active'],
      createAt: DateTime.parse(json['create_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_type': userType,
      'renewal_package': renewalPackage,
      'days': days,
      'total_price': totalPrice,
      'max_config': maxConfig,
      'max_export': maxExport,
      'max_auto_config': maxAutoConfig,
      'is_active': isActive,
      'create_at': createAt.toIso8601String(),
    };
  }
}
