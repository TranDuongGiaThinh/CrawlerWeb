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
                  item.website,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.deepPurpleAccent),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: item.itemDetails.map((detail) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "${detail.name}: ${detail.value}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
