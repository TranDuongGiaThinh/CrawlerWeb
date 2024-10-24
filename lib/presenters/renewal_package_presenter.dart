import 'dart:convert';
import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/renewal_package.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class RenewalPackagePresenter {
  RenewalPackagePresenter();

  Future<List<RenewalPackageModel>> getAllRenewalPackage() async {
    String message = "";
    try {
      final response = await http.get(Uri.parse(getAllRenewalPackageAPI));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['renewal_packages'];
        renewalPackages = data.map((json) => RenewalPackageModel.fromJson(json)).toList();
        message = 'RenewalPackages đã được tải thành công';
        return renewalPackages;
      } else {
        message = 'Không thể tải RenewalPackages';
        if (kDebugMode) {
          print(message);
        }
        return [];
      }
    } catch (e) {
      message = 'Đã xảy ra lỗi: $e';
      if (kDebugMode) {
        print('lỗi khi tải RenewalPackages $e');
      }
      return [];
    }
  }
}
