import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';

import '../../../../models/user_type_model.dart';

class AddUserTypeDialog extends StatefulWidget {
  const AddUserTypeDialog({
    super.key,
    required this.reload,
  });

  final Function reload;

  @override
  AddUserTypeDialogState createState() => AddUserTypeDialogState();
}

class AddUserTypeDialogState extends State<AddUserTypeDialog> {
  late TextEditingController typeController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController maxConfigController;
  late TextEditingController maxExportController;
  late TextEditingController maxAutoConfigController;

  @override
  void initState() {
    super.initState();
    typeController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    maxConfigController = TextEditingController();
    maxExportController = TextEditingController();
    maxAutoConfigController = TextEditingController();
  }

  @override
  void dispose() {
    typeController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    maxConfigController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (typeController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        maxConfigController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dữ liệu rỗng'),
            content: const Text('Hãy điền đầy đủ thông tin'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    int? price = int.tryParse(priceController.text);
    int? maxConfig = int.tryParse(maxConfigController.text);
    int? maxExport = int.tryParse(maxExportController.text);
    int? maxAutoConfig = int.tryParse(maxAutoConfigController.text);

    if (price == null ||
        maxConfig == null ||
        price < 0 ||
        maxConfig < 0 ||
        maxExport == null ||
        maxAutoConfig == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Giá trị không phải số hợp lệ'),
            content: const Text('Hãy kiểm tra lại các thuộc tính kiểu số'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      return;
    } else if (price <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Giá trị không phải số hợp lệ'),
            content: const Text('Hãy nhập giá lớn hơn 0!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    UserTypeModel newUserType = UserTypeModel(
      id: -1,
      type: typeController.text,
      description: descriptionController.text,
      price: price,
      maxConfig: maxConfig,
      maxExport: maxExport,
      maxAutoConfig: maxAutoConfig,
    );
    userTypePresenter.addUserType(newUserType);
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thành Công!'),
          content: const Text('Thêm mới gói thành viên thành công!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.reload();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: SizedBox(
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Thêm Mới Gói Thành Viên',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: typeController,
                decoration: const InputDecoration(labelText: 'Tên gói'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Mô tả'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Giá gói'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: maxConfigController,
                decoration: const InputDecoration(
                    labelText: 'Số lượng cấu hình có thể tạo tối đa'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: maxExportController,
                decoration: const InputDecoration(
                    labelText: 'Số lần xuất dữ liệu thu thập tối đa'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: maxAutoConfigController,
                decoration: const InputDecoration(
                    labelText: 'Số lượng cấu hình thu thập tự động tối đa'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Hủy'),
                  ),
                  ElevatedButton(
                    onPressed: _handleSave,
                    child: const Text('Thêm'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
