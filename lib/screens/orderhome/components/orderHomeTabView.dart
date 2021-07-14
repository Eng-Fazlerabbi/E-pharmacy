import 'package:flutter/material.dart';

class OrderHomeTabBarView extends StatelessWidget {
  const OrderHomeTabBarView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: [TabBarViewItem(), TabBarViewItem(), TabBarViewItem()],
      ),
    );
  }
}

class TabBarViewItem extends StatefulWidget {
  @override
  _TabBarViewItemState createState() => _TabBarViewItemState();
}

class _TabBarViewItemState extends State<TabBarViewItem> {
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
    return ListView.builder(
      itemCount: name.length,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          elevation: 1.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
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
    );
  }
}
