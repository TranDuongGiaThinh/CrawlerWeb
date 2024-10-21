import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.reload,
  });

  final Function reload;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
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
                  // itemPresenter.getSuggestions();
                },
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // itemPresenter.search();
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
