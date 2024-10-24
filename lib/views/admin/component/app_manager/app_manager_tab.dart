import 'package:flutter/material.dart';

class AppManagerTab extends StatefulWidget {
  const AppManagerTab({super.key});

  @override
  State<AppManagerTab> createState() => _AppManagerTabState();
}

class _AppManagerTabState extends State<AppManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ứng dụng'),
    );
  }
}
