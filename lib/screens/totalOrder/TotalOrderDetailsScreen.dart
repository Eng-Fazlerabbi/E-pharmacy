import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:epharmacy/screens/totalOrder/components/body.dart';
import 'package:flutter/material.dart';


class TotalOrderDetailScreen extends StatelessWidget {
  final String totalOrder;

  const TotalOrderDetailScreen({Key? key, required this.totalOrder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(totalOrder),
        centerTitle: true,
      ),
      drawer: KDrawer(),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
