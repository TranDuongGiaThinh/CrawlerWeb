import 'package:flutter/material.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  //late UserTabPresenter presenter;

  @override
  void initState() {
    super.initState();

    reload();
  }

  reload() {
    // presenter = UserTabPresenter(
    //   user: userLogin!,
    //   reload: () {
    //     setState(() {});
    //   },
    // );

    // presenter.loadPackageUserOfUser().then((onValue) {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    // if (presenter.userType == null) return Container();
    // if (presenter.user.id != userLogin!.id) reload();
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 500,
        height: 600,
        child: ListView(
          children: [
            // UserInforCard(presenter: presenter),
            // ExpansionTile(
            //   title: const Text(
            //     'Hạng thành viên',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.deepPurple,
            //     ),
            //   ),
            //   children: [
            //     if (presenter.packageUsers.isNotEmpty)
            //       PackageUserItem(
            //         packageUser: presenter.packageUsers[0],
            //         userType: UserTypePresenter.getUserType(
            //             presenter.packageUsers[0].userTypeId),
            //         packageTypeName: PackageTypePresenter.getPackageTypeName(
            //                 presenter.packageUsers[0].packageTypeId) ??
            //             "",
            //       )
            //     else
            //       const Padding(
            //         padding: EdgeInsets.all(16.0),
            //         child: Text(
            //           'Không có gói thành viên nào đang sử dụng.',
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ),
            //   ],
            // ),
            // ExpansionTile(
            //   title: const Text(
            //     'Lịch sử gói',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.deepPurple,
            //     ),
            //   ),
            //   children: [
            //     if (presenter.packageUsers.isNotEmpty)
            //       for (int i = 0; i < presenter.packageUsers.length; i++)
            //         PackageUserItem(
            //           packageUser: presenter.packageUsers[i],
            //           userType: UserTypePresenter.getUserType(
            //               presenter.packageUsers[i].userTypeId),
            //           packageTypeName: PackageTypePresenter.getPackageTypeName(
            //                   presenter.packageUsers[i].packageTypeId) ??
            //               "",
            //         )
            //     else
            //       const Padding(
            //         padding: EdgeInsets.all(16.0),
            //         child: Text(
            //           'Không có lịch sử gói thành viên.',
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
