class UserTypeModel {
  final int id;
  final String type;
  final String description;
  final int price;
  final int maxConfig;
  final int maxExport;
  final int maxAutoConfig;

  UserTypeModel({
    required this.id,
    required this.type,
    required this.description,
    required this.price,
    required this.maxConfig,
    required this.maxExport,
    required this.maxAutoConfig
  });

  factory UserTypeModel.fromJson(Map<String, dynamic> json) {
    return UserTypeModel(
      id: json['id'],
      type: json['type'],
      description: json['description'],
      price: json['price'],
      maxConfig: json['max_config'],
      maxExport: json['max_export'],
      maxAutoConfig: json['max_auto_config'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'price': price,
      'max_config': maxConfig,
      'max_export': maxExport,
      'max_auto_config': maxAutoConfig,
    };
  }
}
