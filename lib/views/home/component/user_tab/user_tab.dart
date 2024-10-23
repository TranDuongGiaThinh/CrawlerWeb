import 'package:flutter/material.dart';
import '../../../../global/global_data.dart';
import 'package_user_item.dart';
import 'user_infor_card.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    if (userLogin == null) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 500,
          height: 600,
          child: const Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.deepPurpleAccent,
                    size: 100,
                  ),
                  SizedBox(height: 8),
                  Text("Bạn cần đăng nhập để sử dụng tính năng này!"),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 500,
          height: 600,
          child: ListView(
            children: [
              const UserInforCard(),
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
                  if (packageUserIsUsing != null)
                    PackageUserItem(packageUser: packageUserIsUsing!)
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
                  if (packageUsers.isNotEmpty)
                    for (int i = 0; i < packageUsers.length; i++)
                      PackageUserItem(packageUser: packageUsers[i])
                  else
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Không có lịch sử gói thành viên.',
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
}
