import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/views/home/component/introduction_tab/introduction_tab.dart';
import 'package:flutter/material.dart';

import 'component/download_tab/download_tab.dart';
import 'component/instruction_tab/instruction_tab.dart';
import 'component/list_item_tab/list_item_tab.dart';
import 'component/user_tab/user_tab.dart';
import 'component/user_type_tab/user_type_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // PackageUserModel? packageUser;

  updatePackageUser() {
    // PackageUserPresenter.fetchPackageUserOfUser(userLogin!.id).then((value) {
    //   packageUser = PackageUserPresenter.packageUserActive;
    //   setState(() {});
    // });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);

    if (userLogin != null) {
      updatePackageUser();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (userLogin != null) {
      if (userLogin!.isAdmin == true) {
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, '/admin');
        });
        return Container();
      }
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'TechMo',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        bottom: TabBar(
          controller: _tabController,
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
                'Hướng Dẫn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Tải Xuống',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Kết Quả Thu Thập',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Tài Khoản',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: userLogin?.fullname != null
                ? Center(
                    child: Row(
                      children: [
                        Text(
                          'Xin chào, ${userLogin!.fullname}',
                          style: const TextStyle(
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
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          IntroductionTab(),
          UserTypeTab(),
          InstructionTab(),
          DownloadTab(),
          ListItemTab(),
          UserTab(),
        ],
      ),
    );
  }
}
