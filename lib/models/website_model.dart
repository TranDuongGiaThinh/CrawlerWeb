class WebsiteModel {
  int id;
  String name;
  String url;
  int userId;

  WebsiteModel({
    required this.id,
    required this.name,
    required this.url,
    required this.userId,
  });

  factory WebsiteModel.fromJson(Map<String, dynamic> json) {
    return WebsiteModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      userId: json['user_id'],
    );
  }
}