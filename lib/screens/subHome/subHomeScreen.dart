import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:epharmacy/screens/subHome/components/subHome.dart';
import 'package:flutter/material.dart';


class SubHomeScreen extends StatelessWidget {
  final String titlePharma;

  const SubHomeScreen({Key? key, required this.titlePharma}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePharma),
        centerTitle: true,
      ),
      drawer: KDrawer(),
      body: SubHome(),
    );
  }
}
