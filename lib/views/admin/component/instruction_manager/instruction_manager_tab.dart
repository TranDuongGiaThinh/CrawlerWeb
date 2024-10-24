import 'package:flutter/material.dart';

class InstructionManagerTab extends StatefulWidget {
  const InstructionManagerTab({super.key});

  @override
  State<InstructionManagerTab> createState() => _InstructionManagerTabState();
}

class _InstructionManagerTabState extends State<InstructionManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hướng dẫn'),
    );
  }
}
