import 'package:flutter/material.dart';

class ListItemTab extends StatefulWidget {
  const ListItemTab({super.key});

  @override
  ListItemTabState createState() => ListItemTabState();
}

class ListItemTabState extends State<ListItemTab> {
  // late ListItemTabPresenter presenter;

  @override
  void initState() {
    super.initState();

    // presenter = ListItemTabPresenter(reload: (isLoading) {
    //   setState(() {
    //     presenter.isLoading = isLoading;
    //   });
    // });

    // if (ListItemTabPresenter.items == null) {
    //   presenter.load();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Container()//ListItemTabPresenter.items == null
            // ? const CircularProgressIndicator()
            // : Column(
            //     children: [
            //       //SearchBarWidget(presenter: presenter),
            //       FilterPanel(presenter: presenter),
            //       presenter.isLoading
            //           ? const CircularProgressIndicator()
            //           : ListItem(items: ListItemTabPresenter.items!),
            //     ],
            //   ),
      ),
    );
  }
}
