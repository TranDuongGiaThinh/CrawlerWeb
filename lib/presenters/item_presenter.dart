import 'dart:convert';
import 'package:crawler_web/models/item_type_model.dart';
import 'package:crawler_web/models/website_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../global/global_data.dart';
import '../models/check_box_item.dart';
import '../models/item_model.dart';

class ItemPresenter {
  CheckBoxItem? selectedConfig;
  CheckBoxItem? selectedItemType;
  CheckBoxItem? selectedWebsite;

  List<String> searchSuggestions = [];

  ItemPresenter();

  getAllItemOfUser(Function reload) async {
    try {
      await getCheckBoxData(reload);
      final response =
          await http.get(Uri.parse("$getAllItemOfUserAPI${userLogin!.id}"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['items'];
        items = data.map((json) => ItemModel.fromJson(json)).toList();
        reload();
      } else {
        items = [];
        if (kDebugMode) {
          print('Lỗi tải dữ liệu: ${json.decode(response.body)['error']}');
        }
      }
    } catch (error) {
      items = [];
      if (kDebugMode) {
        print(error);
      }
    }
  }

  getCheckBoxData(Function reload) async {
    try {
      await fetchCheckBoxDataFromAPI(
        "$getAllConfigOfUserAPI${userLogin!.id}",
        'configs',
        (data) {
          configItems.addAll(data.map((json) => CheckBoxItem.fromJson(json)));
        },
        reload,
      );

      await fetchCheckBoxDataFromAPI(
        "$getAllItemTypeOfUserAPI${userLogin!.id}",
        'item_types',
        (data) {
          itemTypes = data.map((json) => ItemTypeModel.fromJson(json)).toList();
          itemTypeItems.addAll(data.map((json) => CheckBoxItem.fromJson(json)));
        },
        reload,
      );

      await fetchCheckBoxDataFromAPI(
        "$getAllWebsiteOfUserAPI${userLogin!.id}",
        'websites',
        (data) {
          websites = data.map((json) => WebsiteModel.fromJson(json)).toList();
          websiteItems.addAll(data.map((json) => CheckBoxItem.fromJson(json)));
        },
        reload,
      );
    } catch (error) {
      configItems = [];
      itemTypes = [];
      websites = [];
      if (kDebugMode) {
        print(error);
      }
    }
  }

  fetchCheckBoxDataFromAPI(
    String strAPI,
    String key,
    Function(List<dynamic>) onData,
    Function reload,
  ) async {
    final response = await http.get(Uri.parse(strAPI));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)[key];
      onData(data);
    } else {
      if (kDebugMode) {
        print('Lỗi tải dữ liệu $key: ${response.statusCode}');
      }
    }
  }

  void setSelectedConfig(
    CheckBoxItem? config,
    Function reload,
  ) {
    if (isLoading) return;
    selectedConfig = config;
    isLoading = true;
    reload();
    filterItems().then((value) {
      isLoading = false;
      reload();
    });
  }

  void setSelectedItemType(
    CheckBoxItem? itemType,
    Function reload,
  ) {
    if (isLoading) return;
    selectedItemType = itemType;
    isLoading = true;
    reload();
    filterItems().then((value) {
      isLoading = false;
      reload();
    });
  }

  void setSelectedWebsite(
    CheckBoxItem? website,
    Function reload,
  ) {
    if (isLoading) return;
    selectedWebsite = website;
    isLoading = true;
    reload();
    filterItems().then((value) {
      isLoading = false;
      reload();
    });
  }

  filterItems() async {
    try {
      final queryParams = {
        "type_id": selectedItemType?.id.toString() ?? "null",
        "website_id": selectedWebsite?.id.toString() ?? "null",
        "config_id": selectedConfig?.id.toString() ?? "null",
      };

      final uri = Uri.parse('$filterItemApi${userLogin!.id}?')
          .replace(queryParameters: queryParams);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['items'];
        items = data.map((json) => ItemModel.fromJson(json)).toList();
      } else {
        if (kDebugMode) {
          print('Lỗi tải dữ liệu: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<bool> checkExportPremission() async {
    try {
      // final queryParams = {
      //   "type_id": selectedItemType?.id.toString() ?? "null",
      //   "website_id": selectedWebsite?.id.toString() ?? "null",
      //   "config_id": selectedConfig?.id.toString() ?? "null",
      // };

      // final uri = Uri.parse('$exportFileJsonAPI${userLogin!.id}?')
      //     .replace(queryParameters: queryParams);
      const a= 0;
      return true;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return false;
    }
  }

  String getExportFileJsonAPI() {
    try {
      final queryParams = {
        "type_id": selectedItemType?.id.toString() ?? "null",
        "website_id": selectedWebsite?.id.toString() ?? "null",
        "config_id": selectedConfig?.id.toString() ?? "null",
      };

      final uri = Uri.parse('$exportFileJsonAPI${userLogin!.id}?')
          .replace(queryParameters: queryParams);
      return uri.toString();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return "";
    }
  }

  getSearchSuggestion(
    String key,
    Function reload,
  ) async {
    final queryParams = {"keyword": key};
    final response = await http.get(
        Uri.parse('$getSearchSuggestionsAPI/${userLogin!.id}?')
            .replace(queryParameters: queryParams));

    if (response.statusCode == 200) {
      final List<dynamic> data =
          json.decode(response.body)['search_suggestions'];
      searchSuggestions = data.map((e) => e.toString()).toList();
    } else {
      if (kDebugMode) {
        print('Lỗi tải dữ liệu $key: ${response.statusCode}');
      }
    }
  }
}
