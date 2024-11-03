import 'package:crawler_web/views/admin/component/app_manager/app_manager_tab.dart';
import 'package:crawler_web/views/admin/component/backup_manager/backup_manager_tab.dart';
import 'package:crawler_web/views/admin/component/instruction_manager/instruction_manager_tab.dart';
import 'package:crawler_web/views/admin/component/introduction_manager/introduction_manager_tab.dart';
import 'package:crawler_web/views/admin/component/renewal_package_manager/renewal_package_manager_tab.dart';
import 'package:crawler_web/views/admin/component/user_manager/user_manager_tab.dart';
import 'package:crawler_web/views/admin/component/user_type_manager/user_type_manager_tab.dart';
import 'package:flutter/material.dart';

import '../../global/global_data.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (userLogin == null || userLogin?.isAdmin == false) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/');
      });
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TechMo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Row(
              children: [
                const Text(
                  'Chế độ người quản trị',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(width: 8.0),
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
                                userLogin = null;
                                Navigator.of(context).pop();
                                Future.delayed(Duration.zero, () {
                                  Navigator.pushReplacementNamed(context, '/');
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.logout_outlined,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            )
          ],
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Text(
                'Giới Thiệu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Gói Thành Viên',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Gói Gia Hạn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Người Dùng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Ứng Dụng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Hướng Dẫn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Backup',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          IntroductionManagerTab(),
          UserTypeManagerTab(),
          RenewalPackageManagerTab(),
          UserManagerTab(),
          AppManagerTab(),
          InstructionManagerTab(),
          BackupManagerTab(),
        ],
      ),
    );
  }
}
