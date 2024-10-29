import 'package:flutter/material.dart';

class AppManagerTab extends StatefulWidget {
  const AppManagerTab({super.key});

  @override
  State<AppManagerTab> createState() => _AppManagerTabState();
}

class _AppManagerTabState extends State<AppManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: const Text('up load file ứng dụng'),
      ),
    );
  }
}
