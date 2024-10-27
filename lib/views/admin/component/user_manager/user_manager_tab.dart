import 'package:flutter/material.dart';

import '../../../../global/global_data.dart';
import 'user_item.dart';

class UserManagerTab extends StatefulWidget {
  const UserManagerTab({super.key});

  @override
  State<UserManagerTab> createState() => _UserManagerTabState();
}

class _UserManagerTabState extends State<UserManagerTab> {
  @override
  void initState() {
    super.initState();

    if (users.isEmpty) {
      userPresenter.getAllUser().then((onValue) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ListView(
          children: [
            for (int i = 0; i < users.length; i++)
              UserItem(
                user: users[i],
                reload: () {
                  setState(() {});
                },
              )
          ],
        ),
      ),
    );
  }
}
