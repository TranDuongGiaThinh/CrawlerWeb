import 'dart:convert';
import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/package_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../models/user_type_model.dart';
import '../views/home/component/show_login_dialog.dart/show_login_dialog.dart';
import '../views/home/component/user_type_tab/renewal_package_dialog.dart';

class UserTypePresenter {
  static List<UserTypeModel> userTypes = [];
  String message = '';

  UserTypePresenter();

  Future<List<UserTypeModel>> getAllUserTypes() async {
    try {
      final response = await http.get(Uri.parse(getAllUserTypeAPI));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['user_types'];
        userTypes = data.map((json) => UserTypeModel.fromJson(json)).toList();
        message = 'Dữ liệu đã được tải thành công';

        return userTypes;
      } else {
        message = 'Lỗi tải dữ liệu: ${response.statusCode}';
        return [];
      }
    } catch (error) {
      message = 'Lỗi tải dữ liệu: $error';
      return [];
    }
  }

  void onClickItem(
    BuildContext context,
    UserTypeModel userType,
    Function reload,
  ) {
    // Kiểm tra người dùng đã đăng ký gói nào miễn phí trước đó chưa
    if (userType.price == 0) {
      if (userLogin == null) {
        showLoginDialog(context);
      } else {
        for (var packageUser in packageUsers) {
          if (packageUser.totalPrice == 0) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Không thể đăng ký!'),
                  content: const Text(
                      'Mỗi người dùng chỉ được dùng gói miễn phí một lần.'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Xác nhận'),
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return RenewalPackageDialog(
            userType: userType,
            onConfirm: (PackageUserModel packageUser) async {
              PackageUserModel? newPackageUser =
                  await packageUserPresenter.createPackageUser(packageUser);
              if (newPackageUser != null) {
                await packageUserPresenter
                    .getAllPackageUserOfUser(userLogin!.id);
                reload();

                return true;
              }
              return false;
            },
          );
        },
      );
    }
  }

  UserTypeModel? getUserType(int userTypeId) {
    try {
      final userType = userTypes.firstWhere((type) => type.id == userTypeId);
      return userType;
    } catch (error) {
      return null;
    }
  }
}
