import 'package:flutter/material.dart';

class IntroductionManagerTab extends StatefulWidget {
  const IntroductionManagerTab({super.key});

  @override
  State<IntroductionManagerTab> createState() => _IntroductionManagerTabState();
}

class _IntroductionManagerTabState extends State<IntroductionManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: const Text('Cập nhật trang giới thiệu'),
      ),
    );
  }
}
