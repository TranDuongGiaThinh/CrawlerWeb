import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../models/user_model.dart';

class UserPresenter {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = '';

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<UserModel?> login(Function reload) async {
    checkInput(reload);

    if (message.isEmpty) {
      // Thực hiện đăng nhập khi đầu vào hợp lệ
      UserModel? user = await checkLogin(reload);

      return user;
    } else {
      return null;
    }
  }

  void checkInput(Function reload) {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty) {
      message = 'Vui lòng nhập tên đăng nhập!';
    } else if (password.isEmpty) {
      message = 'Vui lòng nhập mật khẩu!';
    } else {
      message = '';
    }
    reload();
  }

  Future<UserModel?> checkLogin(Function reload) async {
    try {
      String username = usernameController.text;
      String password = passwordController.text;

      final url = Uri.parse(checkLoginAPI);

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      final Map<String, dynamic> body = json.decode(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(body['user']);
      } else if (response.statusCode == 400) {
        message = body['message'];
        reload();
        return null;
      } else {
        message = body['error'] ?? 'Lỗi không xác định';
        reload();
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print("Lỗi khi gọi API đăng nhập: $error");
      }
      return null;
    }
  }
}
