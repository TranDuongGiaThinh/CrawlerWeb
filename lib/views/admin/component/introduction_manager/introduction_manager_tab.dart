import 'package:crawler_web/presenters/setting_presenter.dart';
import 'package:flutter/material.dart';

class IntroductionManagerTab extends StatefulWidget {
  const IntroductionManagerTab({super.key});

  @override
  State<IntroductionManagerTab> createState() => _IntroductionManagerTabState();
}

class _IntroductionManagerTabState extends State<IntroductionManagerTab> {
  TextEditingController textController = TextEditingController();

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
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: const Text('Cập nhật trang giới thiệu'),
          ),
        )
      ],
    );
  }
}
