import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class RecentSales extends StatelessWidget {
  final String titleRecent;
  RecentSales({Key? key, required this.titleRecent}) : super(key: key);

  List<String> rsales = [
    'rahim',
    'karim',
    'Fattah',
    'Rakib',
    'Rabbil',
    'Hasan',
    'Rakib',
    'Rabbil',
    'Hasan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleRecent),
        centerTitle: true,
      ),
      drawer: KDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: rsales.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0)),
                    child: ListTile(
                      leading: Text(
                        rsales[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
