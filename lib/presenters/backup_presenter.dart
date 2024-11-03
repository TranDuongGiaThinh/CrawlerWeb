import 'dart:convert';

import 'package:crawler_web/config/config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class BackupPresenter {
  BackupPresenter();

  static createBackup(BuildContext context) async {
    try {
      js.context.callMethod('open', [createBackupAPI]);
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi tạo file backup: $e');
      }
    }
  }

  static Future<void> restore(BuildContext context, PlatformFile file) async {
    try {
      // Chuẩn bị dữ liệu multipart cho request
      var uri = Uri.parse(restoreAPI);
      var request = http.MultipartRequest('POST', uri)
        ..files.add(http.MultipartFile.fromBytes(
          'file',
          file.bytes!,
          filename: file.name,
        ));

      // Gửi request
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      // Kiểm tra kết quả response
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(json.decode(responseBody.body)['message'])),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${json.decode(responseBody.body)['message']}',
            ),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi khôi phục dữ liệu: $e');
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lỗi khi khôi phục dữ liệu!')),
      );
    }
  }
}
