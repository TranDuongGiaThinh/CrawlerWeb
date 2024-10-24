import 'package:crawler_web/models/user_type_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTypeManagerItem extends StatefulWidget {
  const UserTypeManagerItem({
    super.key,
    required this.item,
  });

  final UserTypeModel item;

  @override
  State<UserTypeManagerItem> createState() => _UserTypeManagerItemState();
}

class _UserTypeManagerItemState extends State<UserTypeManagerItem> {
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'VNĐ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 300,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.item.price > 0
                      ? Text(
                          currencyFormat.format(widget.item.price),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          "Miễn phí",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.type,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  if (widget.item.maxConfig > 0)
                    Text(
                      '${widget.item.maxConfig} lượt tạo cấu hình',
                      style: const TextStyle(fontSize: 16),
                    ),
                  if (widget.item.maxAutoConfig > 0)
                    Text(
                      '${widget.item.maxAutoConfig} cấu hình thu thập tự động',
                      style: const TextStyle(fontSize: 16),
                    ),
                  if (widget.item.maxExport > 0)
                    Text(
                      '${widget.item.maxExport} lượt xuất dữ liệu thu thập',
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return UpdateUserTypeDialog(
                      //         presenter: presenter, item: item);
                      //   },
                      // );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.deepPurpleAccent),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    child: const Text(
                      'Chỉnh Sửa',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (widget.item.price > 0)
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Xác Nhận Xóa'),
                              content: const Text(
                                  'Bạn có chắc chắn muốn xóa mục này không?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Hủy'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // presenter.deleteUserType(item.id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Xóa',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.red),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      child: const Text(
                        'Xóa',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
