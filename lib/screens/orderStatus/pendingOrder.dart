import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class PendingOrder extends StatelessWidget {
  final String titlePend;
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

  PendingOrder({Key? key, required this.titlePend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePend),
        centerTitle: true,
      ),
      drawer: KDrawer(),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.teal.shade400,
                    ),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
                title: Text(name[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
