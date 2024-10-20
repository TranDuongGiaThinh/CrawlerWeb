import 'package:crawler_web/global/global_data.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../../../../models/check_box_item.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({
    super.key,
  });

  @override
  FilterPanelState createState() => FilterPanelState();
}

class FilterPanelState extends State<FilterPanel> {
  CheckBoxItem selectedItemType = itemTypeItems.first;
  CheckBoxItem selectedWebsite = websiteItems.first;
  CheckBoxItem selectedConfig = configItems.first;

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
              // _buildDropDown(
              //   itemTypeItems,
              //   (CheckBoxItem? value) {
              //     setSelectedItemType(value);
              //   },
              //   selectedItemType ??
              //       widget.presenter.itemTypes.first,
              // ),
              // const SizedBox(width: 4),
              // _buildDropDown(
              //   websiteItems,
              //   (CheckBoxItem? value) {
              //     setSelectedWebsite(value);
              //   },
              //   widget.presenter.selectedWebsite ??
              //       websiteItems.first,
              // ),
              // const SizedBox(width: 4),
              // _buildDropDown(
              //   widget.presenter.configs,
              //   (CheckBoxItem? value) {
              //     widget.presenter.setSelectedConfig(value);
              //   },
              //   widget.presenter.selectedConfig ??
              //       widget.presenter.configs.first,
              // ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // js.context.callMethod(
              //     'open', [widget.presenter.getExportFileJsonAPI()]);
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
