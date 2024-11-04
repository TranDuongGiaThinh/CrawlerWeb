import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../presenters/setting_presenter.dart';

class InstructionManagerTab extends StatefulWidget {
  const InstructionManagerTab({super.key});

  @override
  State<InstructionManagerTab> createState() => _InstructionManagerTabState();
}

class _InstructionManagerTabState extends State<InstructionManagerTab> {
  PlatformFile? selectedFile;

  selectFileAndUpload() async {
    // Hiển thị bộ chọn tệp
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFile = result.files.first;
      });

      // Tải lên nội dung file
      final uploadSuccess =
          await SettingPresenter.uploadInstruction(selectedFile!);

      // Hiển thị thông báo kết quả
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(uploadSuccess
                ? 'Tải lên file thành công!'
                : 'Tải lên file thất bại!')),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không có tệp nào được chọn.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Tải Lên File Hướng Dẫn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: selectFileAndUpload,
              icon: const Icon(Icons.upload_file),
              label: const Text('Chọn file và tải lên'),
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Tệp đã chọn: ${selectedFile!.name}',
                    style: const TextStyle(fontSize: 16)),
              ),
          ],
        ),
      ),
    );
  }
}
