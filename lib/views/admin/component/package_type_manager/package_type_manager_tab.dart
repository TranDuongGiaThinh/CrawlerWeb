import 'package:flutter/material.dart';

class PackageTypeAdminTab extends StatefulWidget {
  const PackageTypeAdminTab({
    super.key, 
    // required this.presenter
  });
  // final AdminPresenter presenter;

  @override
  State<PackageTypeAdminTab> createState() => _PackageTypeAdminTabState();
}

class _PackageTypeAdminTabState extends State<PackageTypeAdminTab> {
  @override
  void initState() {
    super.initState();

    // widget.presenter.loadPackageTypes();
  }

  @override
  Widget build(BuildContext context) {
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
