class ItemDetailModel {
  int id;
  int itemId;
  String name;
  String value;
  bool isPrimaryKey;
  bool isDetailUrl;
  bool isContainKeywords;

  ItemDetailModel({
    required this.id,
    required this.itemId,
    required this.name,
    required this.value,
    required this.isPrimaryKey,
    required this.isDetailUrl,
    required this.isContainKeywords,
  });

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) {
    return ItemDetailModel(
      id: json['id'],
      itemId: json['item_id'],
      name: json['name'],
      value: json['value'],
      isPrimaryKey: json['is_primary_key'],
      isDetailUrl: json['is_detail_url'],
      isContainKeywords: json['is_contain_keywords'],
    );
  }
}
