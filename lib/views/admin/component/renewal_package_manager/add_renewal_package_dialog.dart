import 'package:flutter/material.dart';

class AddPackageTypeDialog extends StatefulWidget {
  const AddPackageTypeDialog({super.key});

  @override
  AddPackageTypeDialogState createState() => AddPackageTypeDialogState();
}

class AddPackageTypeDialogState extends State<AddPackageTypeDialog> {
  late TextEditingController _typeController;
  late TextEditingController _descriptionController;
  late TextEditingController _promotionController;
  late TextEditingController _daysController;

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController();
    _descriptionController = TextEditingController();
    _promotionController = TextEditingController();
    _daysController = TextEditingController();
  }

  @override
  void dispose() {
    _typeController.dispose();
    _descriptionController.dispose();
    _promotionController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_typeController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _promotionController.text.isEmpty ||
        _daysController.text.isEmpty) {
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

    int? promotion = int.tryParse(_promotionController.text);
    int? days = int.tryParse(_daysController.text);
    if (days == null || promotion == null || days < 0 || promotion < 0) {
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
    }

    // PackageTypeModel newPackageType = PackageTypeModel(
    //   id: -1,
    //   type: _typeController.text,
    //   description: _descriptionController.text,
    //   days: days,
    //   promotion: promotion,
    // );
    // widget.presenter.createPackageType(newPackageType);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Thêm mới'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _typeController,
            decoration: const InputDecoration(labelText: 'Tên gói'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Mô tả'),
          ),
          TextField(
            controller: _promotionController,
            decoration: const InputDecoration(labelText: 'Khuyến mãi'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _daysController,
            decoration: const InputDecoration(labelText: 'Số ngày sử dụng'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: <Widget>[
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
    );
  }
}
