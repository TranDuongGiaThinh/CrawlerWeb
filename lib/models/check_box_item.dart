class CheckBoxItem {
  int? id;
  String name;

  CheckBoxItem({
    required this.id,
    required this.name,
  });

  factory CheckBoxItem.fromJson(Map<String, dynamic> json) {
    return CheckBoxItem(
      id: json['id'],
      name: json['name'] ?? json['type'],
    );
  }
}
