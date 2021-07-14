import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:epharmacy/screens/orderhome/components/orderHome.dart';
import 'package:flutter/material.dart';


class OrderHomeScreen extends StatelessWidget {
  final String titleOrder;

  const OrderHomeScreen({Key? key, required this.titleOrder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleOrder),
      ),
      drawer: KDrawer(),
      body: OrderHome(),
    );
  }
}
