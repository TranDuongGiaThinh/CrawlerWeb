import 'package:crawler_web/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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

  static Future<bool> uploadApp(String filename, Uint8List fileBytes) async {
    try {
      // Tạo MultipartFile từ file bytes
      final MultipartFile multipartFile = MultipartFile.fromBytes(
        fileBytes,
        filename: filename,
      );

      // Tạo FormData với file
      final formData = FormData.fromMap({"file": multipartFile});

      // Khởi tạo Dio và gọi API
      Dio dio = Dio();
      final response = await dio.patch(uploadAppAPI, data: formData);

      if (response.statusCode == 200) {
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

  static Future<bool> uploadInstruction(
      String filename, Uint8List fileBytes) async {
    try {
      // Tạo MultipartFile từ file bytes
      final MultipartFile multipartFile = MultipartFile.fromBytes(
        fileBytes,
        filename: filename,
      );

      // Tạo FormData với file
      final formData = FormData.fromMap({"file": multipartFile});

      // Khởi tạo Dio và gọi API
      Dio dio = Dio();
      final response = await dio.patch(uploadInstructionAPI, data: formData);

      if (response.statusCode == 200) {
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
