import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';

import 'add_user_type_dialog.dart';
import 'user_type_manager_item.dart';

class UserTypeManagerTab extends StatefulWidget {
  const UserTypeManagerTab({super.key});

  @override
  State<UserTypeManagerTab> createState() => _UserTypeManagerTabState();
}

class _UserTypeManagerTabState extends State<UserTypeManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: (userTypes.length / 3).ceil(),
                      itemBuilder: (context, rowIndex) {
                        final startIndex = rowIndex * 3;
                        final endIndex = startIndex + 3;
                        final rowItems = userTypes.sublist(
                          startIndex,
                          endIndex > userTypes.length
                              ? userTypes.length
                              : endIndex,
                        );
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: rowItems.map((userType) {
                            return UserTypeManagerItem(item: userType);
                          }).toList(),
                        );
                      },
                    ),
            ),
          ],
        ),
        Positioned(
          bottom: 32.0,
          right: 32.0,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddUserTypeDialog(
                    reload: () {
                      setState(() {});
                    },
                  );
                },
              );
            },
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
