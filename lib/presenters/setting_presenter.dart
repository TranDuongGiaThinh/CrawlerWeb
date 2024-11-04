import 'package:crawler_web/config/config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SettingPresenter {
  static loadIntroduction() async {
    try {} catch (e) {
      if (kDebugMode) {
        print('Tải trang giới thiệu thất bại!');
      }
    }
  }

  static Future<bool> updateIntroduction() async {
    try {
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Cập nhật trang giới thiệu thất bại!');
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
