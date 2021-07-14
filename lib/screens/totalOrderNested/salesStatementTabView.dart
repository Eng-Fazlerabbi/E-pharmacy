import 'package:flutter/material.dart';

class SaleStatmentTabView extends StatelessWidget {
  const SaleStatmentTabView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: [
          TabBarViewItem(),
          TabBarViewItem(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TabBarViewItem extends StatelessWidget {
  List<String> name = [
    'rahim',
    'karim',
    'Fattah',
    'Rakib',
    'Rabbil',
    'Hasan',
    'Shamim',
    'Shadhin',
    'Hasbi',
    'Hsaib',
    'Hilam',
    'Halik',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            child: ListTile(
              title: Text(name[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
