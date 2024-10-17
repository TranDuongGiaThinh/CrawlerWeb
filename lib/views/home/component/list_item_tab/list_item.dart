import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key, 
    // required this.items
  });
  // final List<ItemModel> items;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    // if (widget.items.isEmpty) {
      return const Expanded(
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
            Text("Không tìm thấy dữ liệu thu thập của bạn trong hệ thống!"),
          ],
        ),
      );
    // }
    // return Expanded(
    //   child: ListView.builder(
    //     itemCount: widget.items.length,
    //     itemBuilder: (context, index) {
    //       return ItemCard(item: widget.items[index]);
    //     },
    //   ),
    // );
  }
}
