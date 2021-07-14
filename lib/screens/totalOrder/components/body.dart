import 'package:epharmacy/screens/totalOrder/components/totalOrderTab.dart';
import 'package:epharmacy/screens/totalOrder/components/totalOrderTabView.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TotalOderTabBar(controller: controller),
        TotalOrderTabBarView(controller: controller)
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
    controller = TabController(length: 2, vsync: this);
  }
}
