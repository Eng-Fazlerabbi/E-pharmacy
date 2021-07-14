import 'package:epharmacy/screens/orderhome/components/orderHomeTabView.dart';
import 'package:epharmacy/screens/orderhome/components/orderHomebar.dart';
import 'package:flutter/material.dart';

class OrderHome extends StatefulWidget {
  @override
  _OrderHomeState createState() => _OrderHomeState();
}

class _OrderHomeState extends State<OrderHome> with TickerProviderStateMixin {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OrderHomeabBar(controller: controller),
        OrderHomeTabBarView(controller: controller)
      ],
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
}
