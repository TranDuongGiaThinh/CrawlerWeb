import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/package_user_model.dart';
import 'package:crawler_web/models/renewal_package.dart';
import 'package:crawler_web/views/home/component/show_login_dialog.dart/show_login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/user_type_model.dart';

class RenewalPackageDialog extends StatefulWidget {
  final UserTypeModel userType;
  final Function(PackageUserModel) onConfirm;

  const RenewalPackageDialog({
    super.key,
    required this.userType,
    required this.onConfirm,
  });

  @override
  RenewalPackageDialogState createState() => RenewalPackageDialogState();
}

class RenewalPackageDialogState extends State<RenewalPackageDialog> {
  RenewalPackageModel? selectedRenewalPackage;
  bool isPackageActiveAndNotExpired = false;

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'đ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();

    loadRenewalPackages();
  }

  loadRenewalPackages() {
    if (isLoading) return;
    isLoading = true;
    renewalPackagePresenter.getAllRenewalPackage().then((value) {
      renewalPackages = value;

      selectedRenewalPackage = renewalPackages.first;

      checkActivePackageStatus().then((value) {
        setState(() {});
        isLoading = false;
      });
    });
  }

  Future<void> checkActivePackageStatus() async {
    if (userLogin != null) {
      if (isLoading) return;
      isLoading = true;
      await packageUserPresenter.getAllPackageUserOfUser(userLogin!.id);
      isLoading = false;
    }

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
    if (renewalPackages.isEmpty) return Container();
    if (selectedRenewalPackage == null) {
      loadRenewalPackages();
      return Container();
    }

    double totalPrice =
        (widget.userType.price * (selectedRenewalPackage!.days / 30)) *
            (1 - selectedRenewalPackage!.promotion / 100.0);

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
            Text("Khuyến mãi: giảm ${selectedRenewalPackage!.promotion}%"),
            const SizedBox(height: 8),
            Text(
              'Giá: $totalPrice',
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
              showLoginDialog(context);
            } else {
              widget
                  .onConfirm(
                PackageUserModel(
                    id: -1,
                    userId: userLogin!.id,
                    userType: widget.userType.type,
                    renewalPackage: selectedRenewalPackage!.type,
                    days: selectedRenewalPackage!.days,
                    totalPrice: totalPrice.ceil(),
                    maxConfig: widget.userType.maxConfig,
                    maxExport: widget.userType.maxExport,
                    maxAutoConfig: widget.userType.maxAutoConfig,
                    isActive: true,
                    createAt: DateTime.now()),
              )
                  .then((result) {
                if (result) {
                  Navigator.of(context).pop();
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
                  Navigator.of(context).pop();
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
            }
          },
          child: const Text('Xác nhận'),
        ),
      ],
    );
  }
}
