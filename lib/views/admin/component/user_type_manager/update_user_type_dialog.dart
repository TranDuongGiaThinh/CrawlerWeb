import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';

import '../../../../models/user_type_model.dart';

class UpdateUserTypeDialog extends StatefulWidget {
  final UserTypeModel item;
  final Function reload;

  const UpdateUserTypeDialog(
      {super.key, required this.item, required this.reload});

  @override
  UpdateUserTypeDialogState createState() => UpdateUserTypeDialogState();
}

class UpdateUserTypeDialogState extends State<UpdateUserTypeDialog> {
  late TextEditingController _typeController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _maxConfigController;
  late TextEditingController _maxExportController;
  late TextEditingController _maxAutoConfigController;

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController(text: widget.item.type);
    _descriptionController =
        TextEditingController(text: widget.item.description);
    _priceController =
        TextEditingController(text: widget.item.price.toString());
    _maxConfigController =
        TextEditingController(text: widget.item.maxConfig.toString());
    _maxExportController =
        TextEditingController(text: widget.item.maxExport.toString());
    _maxAutoConfigController =
        TextEditingController(text: widget.item.maxAutoConfig.toString());
  }

  @override
  void dispose() {
    _typeController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _maxConfigController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_typeController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _maxConfigController.text.isEmpty) {
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
    int? maxConfig = int.tryParse(_maxConfigController.text);
    int? maxExport = int.tryParse(_maxExportController.text);
    int? maxAutoConfig = int.tryParse(_maxAutoConfigController.text);
    if (price == null ||
        maxConfig == null ||
        maxExport == null ||
        maxAutoConfig == null ||
        price < 0 ||
        maxConfig < 0) {
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

    UserTypeModel newUserType = UserTypeModel(
      id: widget.item.id,
      type: _typeController.text,
      description: _descriptionController.text,
      price: price,
      maxConfig: maxConfig,
      maxExport: maxExport,
      maxAutoConfig: maxAutoConfig,
    );
    userTypePresenter
        .checkUserTypeNameExistsOnUpdate(widget.item.id, _typeController.text)
        .then((value) {
      value != true
          ? userTypePresenter.updateUserType(newUserType).then((value) {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thành Công!'),
                    content: const Text('Cập nhật gói thành viên thành công!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          userTypePresenter.getAllUserTypes().then((value) {
                            Navigator.of(context).pop();
                            widget.reload();
                          });
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            })
          : showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Tên gói thành viên đã tồn tại!'),
                  content: const Text(
                      'Tên gói thành viên đã tồn tại trong hệ thống!'),
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
    });
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
            controller: _maxConfigController,
            decoration: const InputDecoration(
                labelText: 'Số lượng cấu hình có thể tạo tối đa'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _maxExportController,
            decoration: const InputDecoration(
                labelText: 'Số lần xuất dữ liệu thu thập tối đa'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _maxAutoConfigController,
            decoration: const InputDecoration(
                labelText: 'Số lượng cấu hình thu thập tự động tối đa'),
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
