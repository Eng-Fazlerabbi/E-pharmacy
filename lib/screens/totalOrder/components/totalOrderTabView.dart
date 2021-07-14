import 'package:epharmacy/screens/totalOrder/components/body.dart';
import 'package:epharmacy/screens/transectionDetails/transectionHomeScreen.dart';
import 'package:flutter/material.dart';


class TotalOrderTabBarView extends StatelessWidget {
  const TotalOrderTabBarView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: [
          Body(),
          TransectionHomeScreen(),
        ],
      ),
    );
  }
}
