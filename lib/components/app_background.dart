import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart'
    show
        BackdropFilter,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Colors,
        Container,
        DecorationImage,
        ExactAssetImage,
        Key,
        StatelessWidget,
        Widget;

class AppBackground extends StatelessWidget {
  const AppBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            'assets/background.jpg',
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
        ),
      ),
    );
  }
}
