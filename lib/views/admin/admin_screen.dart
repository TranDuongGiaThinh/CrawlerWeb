import 'package:crawler_web/views/admin/component/package_type_manager/package_type_manager_tab.dart';
import 'package:crawler_web/views/admin/component/user_type_manager/user_type_manager_item.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  //late AdminPresenter presenter;
  late TabController t;

  @override
  void initState() {
    super.initState();

    // presenter = AdminPresenter(reload: () {
    //   setState(() {});
    // });
    // presenter.tabController = TabController(length: 5, vsync: this);
    // presenter.tabController.addListener(() {
    //   presenter.message = "";
    // });
    t = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    //presenter.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (userLogin == null) {
    //   Future.delayed(Duration.zero, () {
    //     Navigator.pushReplacementNamed(context, '/');
    //   });
    //   return Container();
    // }

    // if (userLogin!.isAdmin == false) {
    //   Future.delayed(Duration.zero, () {
    //     Navigator.pushReplacementNamed(context, '/home');
    //   });
    //   return Container();
    // }

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
                    color: Colors.grey,
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
                                //userLogin = null;
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
                    color: Colors.black54,
                  ),
                ),
              ],
            )
          ],
        ),
        bottom: TabBar(
          controller: t,
          tabs: const [
            Tab(
              child: Text(
                'Gói thành viên',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Gói thời hạn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Ứng dụng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Hướng dẫn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Người dùng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: t,
        children: [
          UserTypeAdminItem(),
          PackageTypeAdminTab(),
          // DownloadAppAdminTab(presenter: presenter),
          // DownloadInstructionAdminTab(presenter: presenter),
          // ListUserAdminTab(presenter: presenter),
        ],
      ),
    );
  }
}
