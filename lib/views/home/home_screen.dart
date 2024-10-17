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
    _tabController = TabController(length: 5, vsync: this);

    // if (userLogin != null) {
    //   updatePackageUser();
    // }
  }

  @override
  void dispose() {
    _tabController.dispose();
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

    // if (userLogin!.isAdmin == true) {
    //   Future.delayed(Duration.zero, () {
    //     Navigator.pushReplacementNamed(context, '/admin');
    //   });
    //   return Container();
    // }

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
                'Kết quả thu thập',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Gói thành viên',
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
                'Tải xuống',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Tài khoản',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ListItemTab(),
          UserTypeTab(),
          InstructionTab(),
          DownloadTab(),
          UserTab(),
        ],
      ),
    );
  }
}
