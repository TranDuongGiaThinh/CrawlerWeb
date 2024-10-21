import 'package:flutter/material.dart';

import '../../../../global/global_data.dart';
import 'filter_panel.dart';
import 'list_item.dart';
import 'searchbar.dart';

class ListItemTab extends StatefulWidget {
  const ListItemTab({super.key});

  @override
  ListItemTabState createState() => ListItemTabState();
}

class ListItemTabState extends State<ListItemTab> {
  @override
  void initState() {
    super.initState();

    isLoading = true;

    if (items.isEmpty && userLogin != null) {
      itemPresenter.getAllItemOfUser(() {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userLogin == null) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 500,
          height: 600,
          child: const Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.deepPurpleAccent,
                    size: 100,
                  ),
                  SizedBox(height: 8),
                  Text("Bạn cần đăng nhập để sử dụng tính năng này!"),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBarWidget(reload: () {
                setState(() {});
              }),
              FilterPanel(
                reload: () {
                  setState(() {});
                },
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : items.isEmpty
                      ? const Center(
                          child: Text(
                            "Không tìm thấy dữ liệu thu thập!",
                          ),
                        )
                      : const ListItem(),
            ],
          ),
        ),
      );
    }
  }
}
