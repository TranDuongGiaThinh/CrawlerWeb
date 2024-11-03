import 'package:crawler_web/presenters/backup_presenter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BackupManagerTab extends StatefulWidget {
  const BackupManagerTab({super.key});

  @override
  State<BackupManagerTab> createState() => _BackupManagerTabState();
}

class _BackupManagerTabState extends State<BackupManagerTab> {
  PlatformFile? selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFile = result.files.single;
      });

      // ignore: use_build_context_synchronously
      BackupPresenter.restore(context, selectedFile!);
    } else {
      setState(() {
        selectedFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: ElevatedButton.icon(
            onPressed: () {
              BackupPresenter.createBackup(context);
            },
            icon: const Icon(Icons.backup_table_rounded),
            label: const Text('Tạo file backup'),
          ),
        ),
        
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Tải Lên File Chứa Dữ Liệu Cần Khôi Phục',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Chọn file và tải lên'),
                ),
                if (selectedFile != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Tệp đã chọn: ${selectedFile!.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
