import 'package:flutter/material.dart'
    show BuildContext, EdgeInsets, Key, Padding, StatelessWidget, Widget;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SvgPicture.asset(
        'assets/icons/noti.svg',
        height: 25.0,
      ),
    );
  }
}
