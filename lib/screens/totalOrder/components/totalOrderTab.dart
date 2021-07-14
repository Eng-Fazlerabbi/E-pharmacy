import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';


class TotalOderTabBar extends StatelessWidget {
  const TotalOderTabBar({
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
          unselectedLabelColor: kSeceonndaryColor,
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.7,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.7,
          ),
          indicator: BoxDecoration(
            color: kSeceonndaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          controller: controller,
          tabs: [
            TabItem(text: 'Sales statement'),
            TabItem(text: 'Transaction details'),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;

  const TabItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Tab(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
