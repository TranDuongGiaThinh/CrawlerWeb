import 'package:crawler_web/presenters/backup_presenter.dart';
import 'package:flutter/material.dart';

class BackupManagerTap extends StatefulWidget {
  const BackupManagerTap({super.key});

  @override
  State<BackupManagerTap> createState() => _BackupManagerTapState();
}

class _BackupManagerTapState extends State<BackupManagerTap> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          BackupPresenter.createBachup(context);
        },
        child: const Text('tạo file backup'),
      ),
    );
  }
}
