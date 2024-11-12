import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/presenters/setting_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class IntroductionTab extends StatefulWidget {
  const IntroductionTab({super.key});

  @override
  State<IntroductionTab> createState() => _IntroductionTabState();
}

class _IntroductionTabState extends State<IntroductionTab> {
  @override
  void initState() {
    super.initState();

    SettingPresenter.loadIntroduction().then((value) {
      setState(() {});
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return introduction == null
        ? const Center(
            child: Center(
              child: Text("Trang giới thiệu đang được cập nhật!"),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlWidget(
                introduction!,
              ),
            ),
          );
  }
}
