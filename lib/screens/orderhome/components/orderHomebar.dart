import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';


class OrderHomeabBar extends StatelessWidget {
  const OrderHomeabBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        height: 35.0,
        width: ScreenSize.width,
        child: TabBar(
          isScrollable: true,
          labelColor: kSeceonndaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: kSeceonndaryColor.withOpacity(0.8),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
          indicator: BoxDecoration(
            color: kSeceonndaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          controller: controller,
          tabs: [
            TabItemd(text: 'Pending Order'),
            TabItemd(text: 'Procesing Order'),
            TabItemd(text: 'Complete Order'),
          ],
        ),
      ),
    );
  }
}

class TabItemd extends StatelessWidget {
  final String text;

  const TabItemd({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
