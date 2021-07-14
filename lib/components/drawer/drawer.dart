import 'package:flutter/material.dart';
import 'trail.dart';
import '../../helpers/size_config/size_config.dart';
import '../../helpers/themes/themes.dart';
import 'balance.dart';
import 'body.dart';
import 'top_bar.dart';

class KDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.0),
          child: Container(
            height: ScreenSize.height,
            width: ScreenSize.width * 0.7,
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(),
                  SizedBox(height: 10.0),
                  BalanceContainer(),
                  SizedBox(height: 10.0),
                  DrawerBody(),
                  SizedBox(height: 10.0),
                  DrawerTrail(),
                  SizedBox(height: 10.0),
                  logOutTile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect logOutTile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Icon(Icons.logout, size: 18.0),
            SizedBox(width: 10.0),
            Text(
              'Logout',
              style: tsColorBoldSize(14.0),
            ),
          ],
        ),
      ),
    );
  }
}
