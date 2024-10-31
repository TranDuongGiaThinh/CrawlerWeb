import 'package:crawler_web/config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class BackupPresenter {
  BackupPresenter();

  static createBachup(BuildContext context) async {
    try {
      js.context.callMethod('open', [createBackupAPI]);
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi tạo file backup: $e');
      }
    }
  }

  static restore(BuildContext context) async {
    try {
      js.context.callMethod('open', [restoreAPI]);
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi khôi phục dữ liệu: $e');
      }
    }
  }
}
