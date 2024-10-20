class ItemTypeModel {
  int id;
  String type;
  String description;
  int userId;

  ItemTypeModel({
    required this.id,
    required this.type,
    required this.description,
    required this.userId,
  });

  factory ItemTypeModel.fromJson(Map<String, dynamic> json) {
    return ItemTypeModel(
      id: json['id'],
      type: json['type'],
      description: json['description'],
      userId: json['user_id'],
    );
  }
}