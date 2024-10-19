import 'dart:convert';
import 'package:crawler_web/models/package_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../global/global_data.dart';

class PackageUserPresenter {
  PackageUserPresenter();

  Future<void> fetchPackageUserOfUser(int userId) async {
    try {
      final response =
          await http.get(Uri.parse("$getAllPackageUserOfUser$userId"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['package_users'];
        packageUsers =
            data.map((json) => PackageUserModel.fromJson(json)).toList();

        if (packageUsers.isNotEmpty) {
          packageUserIsUsing = getPackageUserIsUsing();
        }
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

  PackageUserModel? getPackageUserIsUsing() {
    try {
      return packageUsers.firstWhere((user) => user.isActive);
    } catch (error) {
      return null;
    }
  }

  Future<DateTime?> getOutdate(PackageUserModel packageUser) async {
    try {
      int days = packageUser.days;
      DateTime startDate = packageUser.createAt;
      DateTime outdate = startDate.add(Duration(days: days));
      return outdate;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<bool> checkOutdate(PackageUserModel packageUser) async {
    try {
      DateTime? outdate = await getOutdate(packageUser);

      if (outdate == null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<PackageUserModel?> createPackageUser(
      int packageTypeId, int userTypeId, int totalPrice) async {
    try {
      final url = Uri.parse(creatPackageUserAPI);

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "user_id": userLogin!.id,
          "package_type_id": packageTypeId,
          "user_type_id": userTypeId,
          "total_price": totalPrice,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> body = json.decode(response.body);
        return PackageUserModel.fromJson(body['package_user']);
      } else {
        final Map<String, dynamic> body = json.decode(response.body);
        if (kDebugMode) {
          print(body['error']);
        }
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi đăng ký gói tài khoản: $error");
      }
      return null;
    }
  }
}
