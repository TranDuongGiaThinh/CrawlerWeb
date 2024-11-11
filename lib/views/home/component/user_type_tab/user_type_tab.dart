import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/views/home/component/user_type_tab/user_type_item.dart';
import 'package:flutter/material.dart';

class UserTypeTab extends StatefulWidget {
  const UserTypeTab({super.key});

  @override
  State<UserTypeTab> createState() => _UserTypeTabState();
}

class _UserTypeTabState extends State<UserTypeTab> {
  @override
  void initState() {
    super.initState();

    if (isLoading) return;
    isLoading = true;
    userTypePresenter.getAllUserTypes().then((value) {
      setState(() {
        userTypes = value;
      });
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return userTypes.isEmpty
        ? Center(child: Text(userTypePresenter.message))
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: (userTypes.length / 3).ceil(),
            itemBuilder: (context, rowIndex) {
              final startIndex = rowIndex * 3;
              final endIndex = startIndex + 3;
              final rowItems = userTypes.sublist(
                startIndex,
                endIndex > userTypes.length ? userTypes.length : endIndex,
              );

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rowItems.map((userType) {
                  return UserTypeItem(
                    item: userType,
                    checked: false,
                    onClick: () {
                      userTypePresenter.onClickItem(context, userType, () {
                        setState(() {});
                      });
                    },
                  );
                }).toList(),
              );
            },
          );
  }
}
