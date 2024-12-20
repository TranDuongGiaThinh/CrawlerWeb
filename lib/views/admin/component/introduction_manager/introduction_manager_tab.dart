import 'dart:ui_web';
import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/presenters/setting_presenter.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class IntroductionManagerTab extends StatefulWidget {
  const IntroductionManagerTab({super.key});

  @override
  State<IntroductionManagerTab> createState() => _IntroductionManagerTabState();
}

class _IntroductionManagerTabState extends State<IntroductionManagerTab> {
  TextEditingController textController = TextEditingController();
  bool isShowMessage = false;
  bool onTextfield = false;
  static IFrameElement? ckeditorIframe;

  @override
  void initState() {
    super.initState();

    ckeditorIframe = IFrameElement()
      ..src = 'assets/web/ckeditor.html'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..tabIndex = 0
      ..onLoad.listen((event) {
        if (isLoading) return;
        isLoading = true;
        SettingPresenter.loadIntroduction().then((value) {
          if (!mounted) return;
          setState(() {
            textController.text = value;
          });
          isLoading = false;
          ckeditorIframe?.contentWindow?.postMessage(value, '*');
        });
      });

    platformViewRegistry.registerViewFactory(
      'ckeditor-view',
      (int viewId) {
        return ckeditorIframe!;
      },
    );

    window.onMessage.listen((event) {
      if (event.data == null) return;
      if (!mounted) return;
      setState(() {
        textController.text =
            event.data.replaceAll(RegExp(r'>\s+<'), '><') ?? '';
      });
    });

    if (introduction != null) {
      if (!mounted) return;
      setState(() {
        textController.text = introduction!;
      });
      ckeditorIframe?.contentWindow?.postMessage(introduction, '*');
    }
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
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onTextfield = true;
                    });
                  },
                  child: TextField(
                    controller: textController,
                    enabled: onTextfield,
                    decoration: InputDecoration(
                      labelText: 'Nhập nội dung giới thiệu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ckeditorIframe!.contentWindow!
                    .postMessage(textController.text, '*');
                setState(() {
                  onTextfield = false;
                });
              },
              child: const Icon(
                Icons.refresh,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {
                SettingPresenter.updateIntroduction(textController.text)
                    .then((value) {
                  isShowMessage = true;
                  setState(() {});
                  value
                      ? showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: AlertDialog(
                                title: const Text('Thành Công!'),
                                content: const Text(
                                    'Cập nhật nội dung trang giới thiệu thành công!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      isShowMessage = false;
                                      ckeditorIframe?.contentWindow
                                          ?.postMessage(
                                              textController.text, '*');
                                      setState(() {});
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: AlertDialog(
                                title: const Text('Thất Bại!'),
                                content: const Text(
                                    'Cập nhật nội dung trang giới thiệu thất bại!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      isShowMessage = false;
                                      setState(() {});
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
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
        if (!isShowMessage)
          const Expanded(
            child: HtmlElementView(viewType: 'ckeditor-view'),
          ),
      ],
    );
  }
}
