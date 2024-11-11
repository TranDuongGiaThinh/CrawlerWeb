import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/models/package_user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/user_model.dart';
import '../../../home/component/user_tab/package_user_item.dart';

class UserItem extends StatefulWidget {
  const UserItem({
    super.key,
    required this.user,
    required this.reload,
  });

  final UserModel user;
  final Function reload;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  List<PackageUserModel> packageUserOfUser = [];

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  @override
  void initState() {
    super.initState();

    if (isLoading) return;
    isLoading = true;
    packageUserPresenter.getAllPackageUserOfUser(widget.user.id).then((value) {
      packageUserOfUser = value.reversed.toList();
      setState(() {});
      isLoading = false;
    });
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
                Text(
                  widget.user.fullname,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(widget.user.locked
                                ? 'Mở khóa người dùng'
                                : 'Khóa người dùng'),
                            content: Text(
                              widget.user.locked
                                  ? 'Bạn có chắc chắn muốn mở khóa người dùng này không?'
                                  : 'Bạn có chắc chắn muốn khóa người dùng này không?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Đóng hộp thoại nếu chọn hủy
                                },
                                child: const Text('Hủy'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Đóng hộp thoại trước khi thực hiện hành động
                                  if (widget.user.locked) {
                                    userPresenter
                                        .unlockUser(widget.user.id)
                                        .then((value) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thông báo'),
                                            content: Text(
                                              value
                                                  ? 'Mở khóa người dùng thành công.'
                                                  : 'Mở khóa người dùng thất bại.',
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  userPresenter
                                                      .getAllUser()
                                                      .then((value) {
                                                    users = value;
                                                    widget.reload();
                                                  });
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    });
                                  } else {
                                    userPresenter
                                        .lockUser(widget.user.id)
                                        .then((value) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thông báo'),
                                            content: Text(
                                              value
                                                  ? 'Khóa người dùng thành công.'
                                                  : 'Khóa người dùng thất bại.',
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  userPresenter
                                                      .getAllUser()
                                                      .then((value) {
                                                    users = value;
                                                    widget.reload();
                                                  });
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    });
                                  }
                                },
                                child: const Text('Xác nhận'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      widget.user.locked ? Icons.lock_outline : Icons.lock_open,
                      color: widget.user.locked ? Colors.red : Colors.grey,
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Username: ${widget.user.username}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${widget.user.email}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Số điện thoại: ${widget.user.phone}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Trạng thái: ${widget.user.locked ? "Bị khóa" : "Hoạt động"}',
              style: const TextStyle(fontSize: 16),
            ),
            ExpansionTile(
              title: const Text(
                'Gói đang sử dụng',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              children: [
                if (packageUserOfUser.isNotEmpty)
                  PackageUserItem(packageUser: packageUserOfUser[0])
                else
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Không có gói thành viên nào đang sử dụng.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Lịch sử gói',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              children: [
                if (packageUserOfUser.isNotEmpty)
                  for (int i = 0; i < packageUserOfUser.length; i++)
                    PackageUserItem(packageUser: packageUserOfUser[i])
                else
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Không có lịch sử đăng ký gói thành viên.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
