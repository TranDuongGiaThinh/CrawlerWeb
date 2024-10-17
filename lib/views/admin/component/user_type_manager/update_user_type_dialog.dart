import 'package:flutter/material.dart';

class UpdateUserTypeDialog extends StatefulWidget {
  // final AdminPresenter presenter;
  // final UserTypeModel item;

  const UpdateUserTypeDialog({
        super.key, 
        // required this.presenter, 
        // required this.item
      });

  @override
  UpdateUserTypeDialogState createState() => UpdateUserTypeDialogState();
}

class UpdateUserTypeDialogState extends State<UpdateUserTypeDialog> {
  late TextEditingController _typeController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _maxConfigsController;

  @override
  void initState() {
    super.initState();
    // _typeController = TextEditingController(text: widget.item.type);
    // _descriptionController =
    //     TextEditingController(text: widget.item.description);
    // _priceController =
    //     TextEditingController(text: widget.item.price.toString());
    // _maxConfigsController =
    //     TextEditingController(text: widget.item.maxConfigs.toString());
  }

  @override
  void dispose() {
    _typeController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _maxConfigsController.dispose();
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
    //   id: widget.item.id,
    //   type: _typeController.text,
    //   description: _descriptionController.text,
    //   price: price,
    //   maxConfigs: maxConfigs,
    // );
    // widget.presenter.updateUserType(newUserType);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Chỉnh sửa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _typeController,
            decoration: const InputDecoration(labelText: 'Tên gói'),
            enabled: _priceController.text != '0',
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Mô tả'),
          ),
          TextField(
            controller: _priceController,
            decoration: const InputDecoration(labelText: 'Giá gói'),
            keyboardType: TextInputType.number,
            enabled: _priceController.text != '0',
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
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
