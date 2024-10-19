import 'package:crawler_web/models/user_type_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTypeItem extends StatelessWidget {
  const UserTypeItem({
    super.key,
    required this.item,
    required this.checked,
    required this.onClick,
  });

  final UserTypeModel item;
  final bool checked;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'VNĐ',
      decimalDigits: 0,
    );

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
                  item.price > 0
                      ? Text(
                          currencyFormat.format(item.price),
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
                    item.type,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  if (item.maxConfig > 0)
                    Text(
                      '${item.maxConfig} lượt tạo cấu hình',
                      style: const TextStyle(fontSize: 16),
                    ),
                  if (item.maxAutoConfig > 0)
                    Text(
                      '${item.maxAutoConfig} cấu hình thu thập tự động',
                      style: const TextStyle(fontSize: 16),
                    ),
                  if (item.maxExport > 0)
                    Text(
                      '${item.maxExport} lượt xuất dữ liệu thu thập',
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  checked
                      ? Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.deepPurpleAccent,
                              width: 3.0,
                            ),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 40,
                            color: Colors.deepPurpleAccent,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            onClick();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.deepPurpleAccent),
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          child: const Text(
                            'Đăng ký ngay',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
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
