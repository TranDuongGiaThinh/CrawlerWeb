import 'package:flutter/material.dart';

class IntroductionTab extends StatefulWidget {
  const IntroductionTab({super.key});

  @override
  State<IntroductionTab> createState() => _IntroductionTabState();
}

class _IntroductionTabState extends State<IntroductionTab> {
  @override
  Widget build(BuildContext context) {
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
              children: [
                Text("Trang Giới Thiệu")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
