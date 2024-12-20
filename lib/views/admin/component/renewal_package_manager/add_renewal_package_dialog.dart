import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/renewal_package.dart';
import 'package:flutter/material.dart';

class AddRenewalPackageDialog extends StatefulWidget {
  const AddRenewalPackageDialog({
    super.key,
    required this.reload,
  });

  final Function reload;

  @override
  AddRenewalPackageDialogState createState() => AddRenewalPackageDialogState();
}

class AddRenewalPackageDialogState extends State<AddRenewalPackageDialog> {
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

    RenewalPackageModel newPackageType = RenewalPackageModel(
      id: -1,
      type: _typeController.text,
      description: _descriptionController.text,
      days: days,
      promotion: promotion,
    );
    renewalPackagePresenter
        .checkRenewalPackageNameExistsOnAdd(_typeController.text)
        .then((value) {
      value != true
          ? renewalPackagePresenter.add(newPackageType).then((value) {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thành Công!'),
                    content: const Text('Thêm mới gói gia hạn thành công!'),
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
            })
          : showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Tên gói gia hạn đã tồn tại!'),
                  content:
                      const Text('Tên gói gia hạn đã tồn tại trong hệ thống!'),
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
