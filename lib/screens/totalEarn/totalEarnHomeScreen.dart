import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:epharmacy/screens/totalEarn/components/totalEarnHome.dart';
import 'package:flutter/material.dart';


class TotalEarnHomeScreen extends StatelessWidget {
  final String titleEarn;

  const TotalEarnHomeScreen({Key? key, required this.titleEarn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleEarn),
      ),
      drawer: KDrawer(),
      body: TotalEarnHome(),
    );
  }
}
