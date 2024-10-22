// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class DownloadTab extends StatefulWidget {
  const DownloadTab({super.key});

  @override
  State<DownloadTab> createState() => _DownloadTabState();
}

class _DownloadTabState extends State<DownloadTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 500,
        height: 600,
        child: Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Text(
                    'Tải xuống ứng dụng trên Desktop của bạn để bắt đầu thực hiện thu thập dữ liệu',
                  ),
                ),
                Image.asset(
                  'assets/cshap.png',
                  width: 300,
                  height: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    js.context.callMethod('open', [downloadAppAPI]);
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.deepPurpleAccent),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Tải xuống',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
