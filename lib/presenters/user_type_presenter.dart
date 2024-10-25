import 'dart:convert';
import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/package_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../models/user_type_model.dart';
import '../views/home/component/show_login_dialog.dart/show_login_dialog.dart';
import '../views/home/component/user_type_tab/renewal_package_dialog.dart';

class UserTypePresenter {
  String message = '';

  UserTypePresenter();

  Future<List<UserTypeModel>> getAllUserTypes() async {
    try {
      final response = await http.get(Uri.parse(getAllUserTypeAPI));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['user_types'];
        userTypes = data.map((json) => UserTypeModel.fromJson(json)).toList();
        message = 'UserTypes đã được tải thành công';

        return userTypes;
      } else {
        message = 'Lỗi tải UserTypes: ${response.statusCode}';
        return [];
      }
    } catch (error) {
      message = 'Lỗi tải UserTypes: $error';
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

  addUserType(UserTypeModel userType) async {
    try {
      final url = Uri.parse(createUserTypeAPI);

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "type": userType.type,
          "description": userType.description,
          "max_auto_config": userType.maxAutoConfig,
          "max_config": userType.maxConfig,
          "max_export": userType.maxExport,
          "price": userType.price,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> body = json.decode(response.body);
        final UserTypeModel newUserType =
            UserTypeModel.fromJson(body['user_type']);
        userTypes.add(newUserType);
      } else {
        final Map<String, dynamic> body = json.decode(response.body);
        if (kDebugMode) {
          print(body['error']);
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi tạo mới gói thành viên: $error");
      }
    }
  }

  Future<bool?> checkUserTypeNameExistsOnAdd(String name) async {
    try {
      final response =
          await http.get(Uri.parse('${checkUserTypeNameExistsAPI}name=$name'));

      if (response.statusCode == 200) {
        bool checkResult = json.decode(response.body)['check_result'];

        return checkResult;
      } else {
        message = 'Lỗi khi kiểm tra tên gói thành viên: ${response.statusCode}';
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Lỗi khi kiểm tra tên gói thành viên: $e");
      }

      return null;
    }
  }

  // Future<bool?> checkUserTypeNameExistsOnAdd(String name) async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse('${checkUserTypeNameExistsAPI}name=$name'));

  //     if (response.statusCode == 200) {
  //       bool checkResult = json.decode(response.body)['check_result'];

  //       return checkResult;
  //     } else {
  //       message = 'Lỗi khi kiểm tra tên gói thành viên: ${response.statusCode}';
  //       return null;
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Lỗi khi kiểm tra tên gói thành viên: $e");
  //     }

  //     return null;
  //   }
  // }

  updateUserType(UserTypeModel userType) async {
    try {
      final url = Uri.parse(updateUserTypeAPI);

      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "id": userType.id,
          "type": userType.type,
          "description": userType.description,
          "max_auto_config": userType.maxAutoConfig,
          "max_config": userType.maxConfig,
          "max_export": userType.maxExport,
          "price": userType.price,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final UserTypeModel updatedUserType =
            UserTypeModel.fromJson(body['user_type']);
        return updatedUserType;
      } else {
        final Map<String, dynamic> body = json.decode(response.body);
        if (kDebugMode) {
          print(body['error']);
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi tạo mới gói thành viên: $error");
      }
    }
  }

  Future<bool> deleteUserType(UserTypeModel userType) async {
    try {
      final url = Uri.parse('$deleteUserTypeAPI${userType.id}');

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
        print("Lỗi khi tạo mới gói thành viên: $error");
      }
      return false;
    }
  }
}
