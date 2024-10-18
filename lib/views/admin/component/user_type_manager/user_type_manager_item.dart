import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTypeAdminItem extends StatefulWidget {
  const UserTypeAdminItem({
    super.key,
    // required this.item,
    // required this.presenter,
  });

  @override
  State<UserTypeAdminItem> createState() => _UserTypeAdminItemState();
}

class _UserTypeAdminItemState extends State<UserTypeAdminItem> {
  // final UserTypeModel item;
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'VNĐ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 250,
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
                  // item.price > 0
                  //     ? Text(
                  //         currencyFormat.format(item.price),
                  //         style: const TextStyle(
                  //           fontSize: 32,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       )
                  //     : const Text(
                  //         "Miễn phí",
                  //         style: TextStyle(
                  //           fontSize: 32,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  // const SizedBox(height: 8),
                  // Text(
                  //   item.type,
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // const SizedBox(height: 4),
                  // Text(
                  //   item.description,
                  //   style: const TextStyle(fontSize: 16),
                  // ),
                  // const SizedBox(height: 4),
                  // if (item.maxConfigs > 0)
                  //   Text(
                  //     '${item.maxConfigs} cấu hình tối đa',
                  //     style: const TextStyle(fontSize: 16),
                  //   ),
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
                      'Chỉnh sửa',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // if (item.price > 0) 
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Xác nhận xóa'),
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
