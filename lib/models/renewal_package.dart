class RenewalPackageModel {
  final int id;
  final String type;
  final String description;
  final int days;
  final int promotion;

  RenewalPackageModel({
    required this.id,
    required this.type,
    required this.description,
    required this.days,
    required this.promotion,
  });

  factory RenewalPackageModel.fromJson(Map<String, dynamic> json) {
    return RenewalPackageModel(
      id: json['id'],
      type: json['type'],
      description: json['description'],
      days: json['days'],
      promotion: json['promotion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'days': days,
      'promotion': promotion,
    };
  }
}
