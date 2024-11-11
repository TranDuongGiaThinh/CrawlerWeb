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
      if (isLoading) return;
      isLoading = true;
      userPresenter.getAllUser().then((onValue) {
        setState(() {});
        isLoading = false;
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
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                onChanged: (value) {
                  userPresenter.search(value).then((newUsers) {
                    setState(() {
                      users = newUsers;
                    });
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm người dùng...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Danh sách người dùng
            Expanded(
              child: users.isEmpty
                  ? const Center(
                      child: Text(
                        'Không tìm thấy người dùng nào phù hợp với từ khóa.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return UserItem(
                          user: users[index],
                          reload: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
