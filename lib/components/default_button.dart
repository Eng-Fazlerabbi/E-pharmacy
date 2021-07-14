import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  final String text;
  final void Function() press;

  const DefaultButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(58),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: kSeceonndaryColor,
        ),
        onPressed: press,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
