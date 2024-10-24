import 'package:flutter/material.dart';

class PackageTypeManagerTab extends StatefulWidget {
  const PackageTypeManagerTab({super.key});

  @override
  State<PackageTypeManagerTab> createState() => _PackageTypeManagerTabState();
}

class _PackageTypeManagerTabState extends State<PackageTypeManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('gói gia hạn'),
    );
    return Stack(
      children: [
        Column(
          children: [
            // Expanded(
            //   child: widget.presenter.isHandling
            //       ? const Center(child: CircularProgressIndicator())
            //       : ListView.builder(
            //           padding: const EdgeInsets.all(8.0),
            //           itemCount: (widget.presenter.packageTypes.length / 3).ceil(),
            //           itemBuilder: (context, rowIndex) {
            //             final startIndex = rowIndex * 3;
            //             final endIndex = startIndex + 3;
            //             final rowItems = widget.presenter.packageTypes.sublist(
            //               startIndex,
            //               endIndex > widget.presenter.packageTypes.length
            //                   ? widget.presenter.packageTypes.length
            //                   : endIndex,
            //             );
            //             return Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: rowItems.map((packageType) {
            //                 return PackageTypeAdminItem(
            //                   presenter: widget.presenter,
            //                   item: packageType,
            //                 );
            //               }).toList(),
            //             );
            //           },
            //         ),
            // ),
          ],
        ),
        Positioned(
          bottom: 32.0,
          right: 32.0,
          child: GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return AddPackageTypeDialog(presenter: widget.presenter);
              //   },
              // );
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
