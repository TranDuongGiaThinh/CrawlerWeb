import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/renewal_package.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/user_type_model.dart';

class RenewalPackageDialog extends StatefulWidget {
  final UserTypeModel userType;
  final Function(RenewalPackageModel, int, double) onConfirm;

  const RenewalPackageDialog({
    super.key,
    required this.userType,
    required this.onConfirm,
  });

  @override
  RenewalPackageDialogState createState() => RenewalPackageDialogState();
}

class RenewalPackageDialogState extends State<RenewalPackageDialog> {
  late RenewalPackageModel selectedRenewalPackage;
  bool isPackageActiveAndNotExpired = false;

  @override
  void initState() {
    super.initState();

    renewalPackagePresenter.getAllRenewalPackage().then((value) {
      renewalPackages = value;

      selectedRenewalPackage = renewalPackages.first;

      checkActivePackageStatus().then((value) {
        setState(() {});
      });
    });
  }

  Future<void> checkActivePackageStatus() async {
    if (packageUserIsUsing != null) {
      bool isExpired =
          await packageUserPresenter.checkOutdate(packageUserIsUsing!);
      setState(() {
        isPackageActiveAndNotExpired = !isExpired;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    if (renewalPackages.isEmpty) return Container();

    return AlertDialog(
      title: const Text('Chọn gói đăng ký'),
      content: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (packageUserIsUsing != null)
              if (isPackageActiveAndNotExpired)
                const Text(
                  'Lưu ý: gói thành viên hiện tại sẽ bị thay thế khi bạn đăng ký gói mới!',
                  style: TextStyle(color: Colors.red),
                ),
            DropdownButton<RenewalPackageModel>(
              value: selectedRenewalPackage,
              onChanged: (RenewalPackageModel? newValue) {
                setState(() {
                  selectedRenewalPackage = newValue!;
                });
              },
              items: renewalPackages.map((packageType) {
                return DropdownMenuItem<RenewalPackageModel>(
                  value: packageType,
                  child: Text(packageType.type),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text("Khuyến mãi: giảm ${selectedRenewalPackage.promotion}%"),
            const SizedBox(height: 8),
            Text(
              'Giá: ${currencyFormat.format((widget.userType.price * (selectedRenewalPackage.days / 30)) * (1 - selectedRenewalPackage.promotion / 100.0))}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: () {
            if (userLogin == null) {
              // Yêu cầu đăng nhập
              //
              //
              ///
            }
            widget
                .onConfirm(
                    selectedRenewalPackage,
                    widget.userType.id,
                    (widget.userType.price *
                            (selectedRenewalPackage.days / 30)) *
                        (1 - selectedRenewalPackage.promotion / 100.0))
                .then((result) {
              if (result) {
                // Hiển thị thông báo thành công
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thành công!'),
                      content: const Text(
                          'Đăng ký gói thành viên thành công. Hãy cài đặt TechMo trên máy tính của bạn để sử dụng'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Đóng'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Hiển thị thông báo thất bại
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thất bại!'),
                      content: const Text('Đăng ký gói thành viên thất bại'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Đóng'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            });
            Navigator.of(context).pop();
          },
          child: const Text('Xác nhận'),
        ),
      ],
    );
  }
}
