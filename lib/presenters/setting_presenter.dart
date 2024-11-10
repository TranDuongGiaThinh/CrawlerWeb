import 'dart:convert';

import 'package:crawler_web/config/config.dart';
import 'package:crawler_web/global/global_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SettingPresenter {
  static Future<String> loadIntroduction() async {
    try {
      final response = await http.get(Uri.parse(getIntroductionAPI));

      if (response.statusCode == 200) {
        introduction = jsonDecode(response.body)['introduction'];
        return introduction!;
      }
      return '';
    } catch (e) {
      if (kDebugMode) {
        print('lỗi khi tải nội dung trang giới thiệu $e');
      }
      return '';
    }
  }

  static Future<bool> updateIntroduction(String htmlData) async {
    try {
      final url = Uri.parse(updateIntroductionAPI);

      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"introduction": htmlData}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Cập nhật trang giới thiệu thất bại! $e');
      }
      return false;
    }
  }

  static Future<bool> uploadApp(PlatformFile file) async {
    try {
      var uri = Uri.parse(uploadAppAPI);
      var request = http.MultipartRequest('PATCH', uri)
        ..files.add(http.MultipartFile.fromBytes(
          'file',
          file.bytes!,
          filename: file.name,
        ));

      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      if (responseBody.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi upload file ứng dụng: $e');
      }
      return false;
    }
  }

  static Future<bool> uploadInstruction(PlatformFile file) async {
    try {
      var uri = Uri.parse(uploadInstructionAPI);
      var request = http.MultipartRequest('PATCH', uri)
        ..files.add(http.MultipartFile.fromBytes(
          'file',
          file.bytes!,
          filename: file.name,
        ));

      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      if (responseBody.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi upload file hướng dẫn: $e');
      }
      return false;
    }
  }
}
