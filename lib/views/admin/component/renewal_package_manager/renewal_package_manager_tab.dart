import 'package:crawler_web/global/global_data.dart';
import 'package:crawler_web/views/admin/component/renewal_package_manager/add_renewal_package_dialog.dart';
import 'package:crawler_web/views/admin/component/renewal_package_manager/renewal_package_manager_item.dart';
import 'package:flutter/material.dart';

class RenewalPackageManagerTab extends StatefulWidget {
  const RenewalPackageManagerTab({super.key});

  @override
  State<RenewalPackageManagerTab> createState() =>
      _RenewalPackageManagerTabState();
}

class _RenewalPackageManagerTabState extends State<RenewalPackageManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: (renewalPackages.length / 3).ceil(),
                itemBuilder: (context, rowIndex) {
                  final startIndex = rowIndex * 3;
                  final endIndex = startIndex + 3;
                  final rowItems = renewalPackages.sublist(
                    startIndex,
                    endIndex > renewalPackages.length
                        ? renewalPackages.length
                        : endIndex,
                  );
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: rowItems.map((renewalPackage) {
                      return RenewalPackageManagerItem(
                        item: renewalPackage,
                        reload: () {
                          setState(() {});
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 32.0,
          right: 32.0,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddRenewalPackageDialog(
                    reload: () {
                      setState(() {});
                    },
                  );
                },
              );
            },
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
