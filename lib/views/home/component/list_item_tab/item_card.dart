import 'package:flutter/material.dart';

import '../../../../models/item_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.itemType,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Text(
                  'Nguồn: ${item.website}',
                  style: const TextStyle(
                      fontSize: 16, color: Colors.deepPurpleAccent),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              for (int i = 0; i<item.itemDetails.length; i++)
               Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "${item.itemDetails[i].name}: ${item.itemDetails[i].value}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              Text(
                    "Cập nhật lúc: ${item.updateAt.toString()}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),),
            ]),
          ],
        ),
      ),
    );
  }
}
