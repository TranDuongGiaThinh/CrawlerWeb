import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/presenters/item_presenter.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../../../../models/check_box_item.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({
    super.key,
    required this.reload,
  });

  final Function reload;

  @override
  FilterPanelState createState() => FilterPanelState();
}

class FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildDropDown(
                itemTypeItems,
                (CheckBoxItem? value) {
                  itemPresenter.setSelectedItemType(value, () {
                    widget.reload();
                  });
                },
                itemPresenter.selectedItemType ?? itemTypeItems.first,
              ),
              const SizedBox(width: 4),
              _buildDropDown(
                websiteItems,
                (CheckBoxItem? value) {
                  itemPresenter.setSelectedWebsite(value, () {
                    widget.reload();
                  });
                },
                itemPresenter.selectedWebsite ?? websiteItems.first,
              ),
              const SizedBox(width: 4),
              _buildDropDown(
                configItems,
                (CheckBoxItem? value) {
                  itemPresenter.setSelectedConfig(value, () {
                    widget.reload();
                  });
                },
                itemPresenter.selectedConfig ?? configItems.first,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              itemPresenter.checkExportPremission().then((checkResult) {
                if (checkResult) {
                  js.context.callMethod(
                      'open', [itemPresenter.getExportFileJsonAPI()]);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Xuất file thất bại'),
                        content: const Text(
                            'Bạn không có quyền xuất dữ liệu này.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Xác nhận'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              'Xuất file json',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropDown(List<CheckBoxItem> items,
      Function(CheckBoxItem?) onChanged, CheckBoxItem defaultValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<CheckBoxItem>(
          value: defaultValue,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<CheckBoxItem>(
              value: item,
              child: Text(item.name),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
