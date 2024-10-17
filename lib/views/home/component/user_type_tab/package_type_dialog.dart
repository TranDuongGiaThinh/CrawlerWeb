import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageTypeDialog extends StatefulWidget {
  // final UserTypeModel userType;
  // final PackageTypePresenter packageTypePresenter;
  // final Function(PackageTypeModel, int, double) onConfirm;

  const PackageTypeDialog({
    super.key,
    // required this.userType,
    // required this.packageTypePresenter,
    // required this.onConfirm,
  });

  @override
  PackageTypeDialogState createState() => PackageTypeDialogState();
}

class PackageTypeDialogState extends State<PackageTypeDialog> {
  // late PackageTypeModel selectedPackageType;
  bool isPackageActiveAndNotExpired = false;

  @override
  void initState() {
    super.initState();
    // selectedPackageType = PackageTypePresenter.packageTypes.first;
    checkActivePackageStatus();
  }

  Future<void> checkActivePackageStatus() async {
    // if (PackageUserPresenter.packageUserActive != null) {
    //   bool isExpired = await PackageUserPresenter.checkOutdate(
    //       PackageUserPresenter.packageUserActive!);
    //   setState(() {
    //     isPackageActiveAndNotExpired = !isExpired;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    return AlertDialog(
      title: const Text('Chọn gói đăng ký'),
      content: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (PackageUserPresenter.packageUserActive != null)
              if (isPackageActiveAndNotExpired)
                const Text(
                  'Lưu ý: gói thành viên hiện tại sẽ bị thay thế khi bạn đăng ký gói mới!',
                  style: TextStyle(color: Colors.red),
                ),
            // DropdownButton<PackageTypeModel>(
            //   value: selectedPackageType,
            //   onChanged: (PackageTypeModel? newValue) {
            //     setState(() {
            //       selectedPackageType = newValue!;
            //     });
            //   },
            //   items:
            //       PackageTypePresenter.packageTypes.map((packageType) {
            //     return DropdownMenuItem<PackageTypeModel>(
            //       value: packageType,
            //       child: Text(packageType.type),
            //     );
            //   }).toList(),
            // ),
            // const SizedBox(height: 8),
            // Text("Khuyến mãi: giảm ${selectedPackageType.promotion}%"),
            // const SizedBox(height: 8),
            // Text(
            //   'Giá: ${currencyFormat.format((widget.userType.price * (selectedPackageType.days / 30)) * (1 - selectedPackageType.promotion / 100.0))}',
            //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
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
        // ElevatedButton(
        //   onPressed: () {
        //     widget
        //         .onConfirm(
        //       selectedPackageType,
        //       widget.userType.id,
        //       (widget.userType.price * (selectedPackageType.days / 30)) *
        //           (1 - selectedPackageType.promotion / 100.0),
        //     )
        //         .then((result) {
        //       if (result) {
        //         // Hiển thị thông báo thành công
        //         showDialog(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return AlertDialog(
        //               title: const Text('Thành công!'),
        //               content: const Text(
        //                   'Đăng ký gói thành viên thành công. Hãy cài đặt TechMo trên máy tính của bạn để sử dụng'),
        //               actions: <Widget>[
        //                 TextButton(
        //                   child: const Text('Đóng'),
        //                   onPressed: () {
        //                     Navigator.of(context).pop();
        //                   },
        //                 ),
        //               ],
        //             );
        //           },
        //         );
        //       } else {
        //         // Hiển thị thông báo thất bại
        //         showDialog(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return AlertDialog(
        //               title: const Text('Thất bại!'),
        //               content: const Text('Đăng ký gói thành viên thất bại'),
        //               actions: <Widget>[
        //                 TextButton(
        //                   child: const Text('Đóng'),
        //                   onPressed: () {
        //                     Navigator.of(context).pop();
        //                   },
        //                 ),
        //               ],
        //             );
        //           },
        //         );
        //       }
        //     });
        //     Navigator.of(context).pop();
        //   },
        //   child: const Text('Xác nhận'),
        // ),
      ],
    );
  }
}
