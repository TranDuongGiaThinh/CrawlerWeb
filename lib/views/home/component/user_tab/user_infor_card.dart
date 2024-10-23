import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInforCard extends StatelessWidget {
  const UserInforCard({super.key});

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userLogin!.fullname,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${userLogin!.email.substring(0, 2)}***${userLogin!.email.substring(userLogin!.email.length - 2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Số điện thoại: ${userLogin!.phone.substring(0, 2)}***${userLogin!.phone.substring(userLogin!.phone.length - 2)}',
              style: const TextStyle(fontSize: 16),
            ),
            if (packageUserIsUsing != null) const SizedBox(height: 8),
            if (packageUserIsUsing != null) Text(
              'Gói thành viên: ${packageUserIsUsing?.userType}',
              style: const TextStyle(fontSize: 16),
            ),
            if (packageUserIsUsing != null) const SizedBox(height: 8),
            if (packageUserIsUsing != null) Text(
              'Số cấu hình thu thập tự động: ${userLogin!.autoConfigCount}/${packageUserIsUsing?.maxAutoConfig}',
              style: const TextStyle(fontSize: 16),
            ),
            if (packageUserIsUsing != null) const SizedBox(height: 8),
            if (packageUserIsUsing != null) Text(
              'Số lượng cấu hình trong tháng: ${userLogin!.configCount}/${packageUserIsUsing?.maxConfig}',
              style: const TextStyle(fontSize: 16),
            ),
            if (packageUserIsUsing != null) const SizedBox(height: 8),
            if (packageUserIsUsing != null) Text(
              'Số lần xuất dữ liệu trong tháng: ${userLogin!.exportCount}/${packageUserIsUsing?.maxExport}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
