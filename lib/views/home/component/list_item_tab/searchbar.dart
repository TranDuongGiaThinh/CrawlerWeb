import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  // final ListItemTabPresenter presenter;

  const SearchBarWidget({
    super.key,
    // required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Nhập từ khóa...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  //presenter.search(value);
                },
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // presenter.performSearch();
              },
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.deepPurpleAccent),
                minimumSize: WidgetStateProperty.all<Size>(const Size(120, 60)),
              ),
              child: const Text(
                'Tìm kiếm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
