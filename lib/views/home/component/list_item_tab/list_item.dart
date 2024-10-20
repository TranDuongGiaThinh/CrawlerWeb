import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  void initState() {
    super.initState();

    isLoading = true;

    if (items.isEmpty) {
      itemPresenter.getAllItemOfUser(() {
      setState(() {
        isLoading = false;
      });
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return isLoading
          ? const CircularProgressIndicator()
          : const Expanded(
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
                  Text(
                      "Không tìm thấy dữ liệu thu thập của bạn trong hệ thống!"),
                ],
              ),
            );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}
