import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/routes/custom_routes.dart';
import '../../helpers/themes/themes.dart';

class DrawerTile extends StatelessWidget {
  final String name, icon;
  final double iconSize;
  final Widget child;

  const DrawerTile(
      {Key? key,
      required this.name,
      required this.icon,
      this.iconSize = 30.0,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        SlideLeftRoute(page: child),
      ),
      child: Container(
        padding: const EdgeInsets.only(right: 5.0, bottom: 20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset(
                'assets/icons/$icon.svg',
                height: iconSize,
                width: iconSize,
              ),
            ),
            Text(
              name,
              style: tsColorEBoldSize(15.0),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.0,
              color: white,
            ),
          ],
        ),
      ),
    );
  }
}
