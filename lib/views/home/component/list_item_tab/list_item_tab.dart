import 'package:flutter/material.dart';

import '../../../../global/global_data.dart';
import 'filter_panel.dart';
import 'list_item.dart';

class ListItemTab extends StatefulWidget {
  const ListItemTab({super.key});

  @override
  ListItemTabState createState() => ListItemTabState();
}

class ListItemTabState extends State<ListItemTab> {
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
    }
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          children: [
            //SearchBarWidget(presenter: presenter),
            FilterPanel(),
            ListItem(),
          ],
        ),
      ),
    );
  }
}
