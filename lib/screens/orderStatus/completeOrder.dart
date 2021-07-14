import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CompleteOrder extends StatelessWidget {
  final String titleComple;

  List<String> compl = [
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

  CompleteOrder({Key? key, required this.titleComple}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleComple),
        centerTitle: true,
      ),
      drawer: KDrawer(),
      body: ListView.builder(
        itemCount: compl.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: CircleAvatar(
                        radius: 8.0, backgroundColor: Color(0xFF2C3A7A)),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
                title: Text(
                  compl[index],
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
    );
  }
}
