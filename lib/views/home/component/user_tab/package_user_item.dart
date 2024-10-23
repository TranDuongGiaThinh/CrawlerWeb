import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/package_user_model.dart';

class PackageUserItem extends StatefulWidget {
  const PackageUserItem({
    super.key,
    required this.packageUser,
  });

  final PackageUserModel packageUser;

  @override
  State<PackageUserItem> createState() => _PackageUserItemState();
}

class _PackageUserItemState extends State<PackageUserItem> {
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: ' VNĐ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.packageUser.userType,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                if (widget.packageUser.isActive)
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.deepPurpleAccent,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Đang sử dụng',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Số lượng cấu hình tối đa mỗi tháng: ${widget.packageUser.maxConfig}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Số lần xuất dữ liệu tối đa mỗi tháng: ${widget.packageUser.maxConfig}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Số cấu hình thu thập tự động tối đa: ${widget.packageUser.maxAutoConfig}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Thời gian gói: ${widget.packageUser.days} ngày',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Tổng giá: ${currencyFormat.format(widget.packageUser.totalPrice)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Ngày đăng ký: ${formatDate(widget.packageUser.createAt)}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
