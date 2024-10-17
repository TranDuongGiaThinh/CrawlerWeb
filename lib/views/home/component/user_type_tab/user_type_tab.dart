import 'package:flutter/material.dart';

class UserTypeTab extends StatefulWidget {
  const UserTypeTab({super.key});

  @override
  State<UserTypeTab> createState() => _UserTypeTabState();
}

class _UserTypeTabState extends State<UserTypeTab> {
  // late UserTypePresenter presenter;
  // PackageTypePresenter packageTypePresenter = PackageTypePresenter();

  @override
  void initState() {
    super.initState();

    // presenter = UserTypePresenter(reload: () {
    //   setState(() {});
    // });

    // packageTypePresenter.fetchPackageTypes().then((value) {
    //   presenter.fetchUserTypes().then((value) {
    //     setState(() {});
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // PackageUserModel? packageUser = PackageUserPresenter.packageUserActive;

    // return UserTypePresenter.userTypes.isEmpty
    //     ? Center(child: Text(presenter.message))
    //     : ListView.builder(
    //         padding: const EdgeInsets.all(8.0),
    //         itemCount: (UserTypePresenter.userTypes.length / 3).ceil(),
    //         itemBuilder: (context, rowIndex) {
    //           final startIndex = rowIndex * 3;
    //           final endIndex = startIndex + 3;
    //           final rowItems = UserTypePresenter.userTypes.sublist(
    //             startIndex,
    //             endIndex > UserTypePresenter.userTypes.length
    //                 ? UserTypePresenter.userTypes.length
    //                 : endIndex,
    //           );

    //           return Row(
    //                mainAxisAlignment: MainAxisAlignment.center,
    //             children: rowItems.map((userType) {
    //               // return UserTypeItem(
    //               //     item: userType,
    //               //     packageUserActive: packageUser,
    //               //     onClick: () {
    //               //       presenter.onClickItem(
    //               //           context, userType, packageTypePresenter);
    //               //     });
    //             }).toList(),
    //           );
    //         },
    //       );
    return Container();
  }
}
