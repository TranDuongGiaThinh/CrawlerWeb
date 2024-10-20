import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/item_detail_model.dart';
import 'package:crawler_web/models/item_type_model.dart';
import 'package:crawler_web/models/website_model.dart';

class ItemModel {
  int id;
  int confiId;
  int itemTypeId;
  int websiteId;
  String updateAt;
  String itemType;
  String website;
  List<ItemDetailModel> itemDetails;

  ItemModel({
    required this.id,
    required this.confiId,
    required this.itemTypeId,
    required this.websiteId,
    required this.itemType,
    required this.website,
    required this.updateAt,
    required this.itemDetails,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    var itemDetailList = json['item_details'] as List;

    List<ItemDetailModel> itemDetails = itemDetailList
        .map((itemDetail) => ItemDetailModel.fromJson(itemDetail))
        .toList();

    ItemTypeModel itemType = itemTypes.firstWhere(
      (website) => website.id == json['item']['item_type_id'],
      orElse: () => ItemTypeModel(
        id: 0,
        type: 'Không tìm thấy chủ đề',
        description: '',
        userId: -1,
      ),
    );

    WebsiteModel website = websites.firstWhere(
      (website) => website.id == json['item']['website_id'],
      orElse: () => WebsiteModel(
        id: 0,
        name: 'Không tìm thấy website',
        url: '',
        userId: -1,
      ),
    );

    return ItemModel(
      id: json['item']['id'],
      confiId: json['item']['crawl_config_id'],
      itemTypeId: json['item']['item_type_id'],
      websiteId: json['item']['website_id'],
      itemType: itemType.type,
      website: website.name,
      updateAt: json['item']['update_at'],
      itemDetails: itemDetails,
    );
  }
}
