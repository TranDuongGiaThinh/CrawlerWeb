import 'dart:convert';
import 'package:crawler_web/models/package_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../global/global_data.dart';

class PackageUserPresenter {
  PackageUserPresenter();

  Future<List<PackageUserModel>> getAllPackageUserOfUser(int userId) async {
    try {
      final response =
          await http.get(Uri.parse("$getAllPackageUserOfUserAPI$userId"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['package_users'];
        packageUsers =
            data.map((json) => PackageUserModel.fromJson(json)).toList();

        if (packageUsers.isNotEmpty) {
          packageUserIsUsing = getPackageUserIsUsing();
        }

        return packageUsers;
      } else {
        if (kDebugMode) {
          print('Lỗi tải packageUsers: ${response.statusCode}');
        }
        return [];
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return [];
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
      PackageUserModel packageUser) async {
    try {
      final url = Uri.parse(creatPackageUserAPI);

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "user_id": packageUser.userId,
          "user_type": packageUser.userType,
          "renewal_package": packageUser.renewalPackage,
          "days": packageUser.days,
          "total_price": packageUser.totalPrice,
          "max_auto_config": packageUser.maxAutoConfig,
          "max_config": packageUser.maxConfig,
          "max_export": packageUser.maxExport
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
