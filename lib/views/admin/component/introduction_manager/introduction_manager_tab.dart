import 'dart:ui_web';

import 'package:crawler_web/presenters/setting_presenter.dart';
import 'package:flutter/material.dart';
import 'dart:html';

class IntroductionManagerTab extends StatefulWidget {
  const IntroductionManagerTab({super.key});

  @override
  State<IntroductionManagerTab> createState() => _IntroductionManagerTabState();
}

class _IntroductionManagerTabState extends State<IntroductionManagerTab> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Đăng ký viewFactory với tên 'ckeditor-view'
    platformViewRegistry.registerViewFactory(
      'ckeditor-view',
      (int viewId) => IFrameElement()
        ..src = 'assets/web/ckeditor.html'
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Nhập nội dung giới thiệu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                SettingPresenter.updateIntroduction(textController.text)
                    .then((value) {
                  value
                      ? showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thành Công!'),
                              content: const Text(
                                  'Cập nhật nội dung trang giới thiệu thành công!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        )
                      : showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thất Bại!'),
                              content: const Text(
                                  'Cập nhật nội dung trang giới thiệu thất bại!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                });
              },
              child: const Text('Cập nhật'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Expanded(
          child: HtmlElementView(viewType: 'ckeditor-view'),
        ),
      ],
    );
  }
}
