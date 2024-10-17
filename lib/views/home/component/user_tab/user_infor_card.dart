import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInforCard extends StatelessWidget {
  const UserInforCard({
    super.key, 
    // required this.presenter
  });
  // final UserTabPresenter presenter;

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   presenter.user.fullname,
                //   style: const TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.deepPurple,
                //   ),
                // ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Xác nhận đăng xuất'),
                            content: const Text(
                                'Bạn có chắc chắn muốn đăng xuất không?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Hủy'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Đăng xuất'),
                                onPressed: () {
                                  // userLogin = null;
                                  // PackageUserPresenter.packageUserActive = null;
                                  // PackageUserPresenter.packageUsers = [];
                                  // ListItemTabPresenter.items = null;
                                  // Future.delayed(Duration.zero, () {
                                  //   Navigator.pushReplacementNamed(
                                  //       context, '/');
                                  // });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.grey,
                    )),
              ],
            ),
            const SizedBox(height: 8),
            // Text(
            //   'Email: ${presenter.user.email.substring(0, 2)}***${presenter.user.email.substring(presenter.user.email.length - 2)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   'Số điện thoại: ${presenter.user.phone.substring(0, 2)}***${presenter.user.phone.substring(presenter.user.phone.length - 2)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   'Gói thành viên: ${presenter.userType?.type}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   'Số lượng cấu hình đã tạo trong tháng: ${presenter.packageUserActive != null ? presenter.packageUserActive!.configCount : 0}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // if (presenter.userType != null) const SizedBox(height: 8),
            // if (presenter.userType != null)
            //   Text(
            //     'Số lượng cấu hình tối đa trong tháng: ${presenter.userType!.maxConfigs}',
            //     style: const TextStyle(fontSize: 16),
            //   ),
            // if (presenter.outDate != null) const SizedBox(height: 8),
            // if (presenter.outDate != null)
            //   Text(
            //     'Ngày hết hạn của gói: ${formatDate(presenter.outDate!)}',
            //     style: const TextStyle(fontSize: 16),
            //   ),
          ],
        ),
      ),
    );
  }
}
