import 'dart:convert';
import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/renewal_package.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class RenewalPackagePresenter {
  RenewalPackagePresenter();

  Future<List<RenewalPackageModel>> getAllRenewalPackage() async {
    String message = "";
    try {
      final response = await http.get(Uri.parse(getAllRenewalPackageAPI));

      if (response.statusCode == 200) {
        final List<dynamic> data =
            jsonDecode(response.body)['renewal_packages'];
        renewalPackages =
            data.map((json) => RenewalPackageModel.fromJson(json)).toList();
        message = 'RenewalPackages đã được tải thành công';
        return renewalPackages;
      } else {
        message = 'Không thể tải RenewalPackages';
        if (kDebugMode) {
          print(message);
        }
        return [];
      }
    } catch (e) {
      message = 'Đã xảy ra lỗi: $e';
      if (kDebugMode) {
        print('lỗi khi tải RenewalPackages $e');
      }
      return [];
    }
  }

  add(RenewalPackageModel item) async {
    try {
      final url = Uri.parse(createRenewalPackageAPI);

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "type": item.type,
          "description": item.description,
          "promotion": item.promotion,
          "days": item.days,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> body = json.decode(response.body);
        final RenewalPackageModel newItem =
            RenewalPackageModel.fromJson(body['renewal_package']);
        renewalPackages.add(newItem);
      } else {
        final Map<String, dynamic> body = json.decode(response.body);
        if (kDebugMode) {
          print(body['error']);
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi tạo mới gói gia hạn: $error");
      }
    }
  }

  Future<bool?> checkRenewalPackageNameExistsOnAdd(String name) async {
    try {
      final response = await http
          .get(Uri.parse('${checkRenewalPackageNameExixstAPI}name=$name'));

      if (response.statusCode == 200) {
        bool checkResult = json.decode(response.body)['check_result'];

        return checkResult;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Lỗi khi kiểm tra tên gói thành viên: $e");
      }

      return null;
    }
  }

  Future<bool?> checkRenewalPackageNameExistsOnUpdate(
      int id, String name) async {
    try {
      final response = await http.get(
          Uri.parse('${checkRenewalPackageNameExixstAPI}name=$name&id=$id'));

      if (response.statusCode == 200) {
        bool checkResult = json.decode(response.body)['check_result'];

        return checkResult;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Lỗi khi kiểm tra tên gói thành viên: $e");
      }

      return null;
    }
  }

  update(RenewalPackageModel item) async {
    try {
      final url = Uri.parse(updateRenewalPackageAPI);

      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "id": item.id,
          "type": item.type,
          "description": item.description,
          "promotion": item.promotion,
          "days": item.days,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final RenewalPackageModel renewalPackage =
            RenewalPackageModel.fromJson(body['renewal_package']);
        return renewalPackage;
      } else {
        final Map<String, dynamic> body = json.decode(response.body);
        if (kDebugMode) {
          print(body['error']);
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi cập nhật gói gia hạn: $error");
      }
    }
  }

  Future<bool> delete(RenewalPackageModel item) async {
    try {
      final url = Uri.parse('$deleteRenewalPackageAPI${item.id}');

      final response = await http.patch(url);

      if (response.statusCode == 200) {
        return true;
      } else {
        final Map<String, dynamic> body = json.decode(response.body);
        if (kDebugMode) {
          print(body['error']);
        }
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi xóa gói gia hạn: $error");
      }
      return false;
    }
  }
}
