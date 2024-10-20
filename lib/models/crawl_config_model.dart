// Tạm thời chỉ dùng để tạo menu lọc dữ liệu nên không cần quản lý các thuộc tính khác

class CrawlConfigModel {
  int id;
  String name;
  String description;

  CrawlConfigModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CrawlConfigModel.fromJson(Map<String, dynamic> json) {
    return CrawlConfigModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}