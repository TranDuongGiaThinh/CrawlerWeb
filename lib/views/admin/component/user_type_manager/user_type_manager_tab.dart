import 'package:flutter/material.dart';

class AddUserTypeDialog extends StatefulWidget {
  // final AdminPresenter presenter;

  const AddUserTypeDialog({
    super.key, 
    // required this.presenter
  });

  @override
  AddUserTypeDialogState createState() => AddUserTypeDialogState();
}

class AddUserTypeDialogState extends State<AddUserTypeDialog> {
  late TextEditingController _typeController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _maxConfigsController;
  late TextEditingController _deletedController;

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _maxConfigsController = TextEditingController();
    _deletedController = TextEditingController();
  }

  @override
  void dispose() {
    _typeController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _maxConfigsController.dispose();
    _deletedController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_typeController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _maxConfigsController.text.isEmpty) {
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

    int? price = int.tryParse(_priceController.text);
    int? maxConfigs = int.tryParse(_maxConfigsController.text);
    if (price == null || maxConfigs == null || price < 0 || maxConfigs < 0) {
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

    // UserTypeModel newUserType = UserTypeModel(
    //   id: -1,
    //   type: _typeController.text,
    //   description: _descriptionController.text,
    //   price: price,
    //   maxConfigs: maxConfigs,
    // );
    // widget.presenter.createUserType(newUserType);
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
            controller: _priceController,
            decoration: const InputDecoration(labelText: 'Giá gói'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _maxConfigsController,
            decoration: const InputDecoration(
                labelText: 'Số lượng cấu hình có thể tạo tối đa'),
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
