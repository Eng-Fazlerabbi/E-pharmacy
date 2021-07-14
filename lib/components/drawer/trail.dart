import 'package:epharmacy/screens/auth/signin/signinScreen.dart';
import 'package:flutter/material.dart';
import '../../helpers/themes/themes.dart';
import 'child.dart';

class DrawerTrail extends StatelessWidget {
  const DrawerTrail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        color: white,
        child: Column(
          children: [
            SizedBox(height: 15.0),
            DrawerTile(
              name: 'Settings',
              icon: 'Settings',
              iconSize: 22.0,
              child: SigninScreen(),
            ),
            DrawerTile(
              name: 'Help Center',
              icon: 'help',
              iconSize: 22.0,
              child: SigninScreen(),
            ),
            DrawerTile(
              name: 'Terms & Conditions',
              icon: 'terms',
              iconSize: 22.0,
              child: SigninScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
