import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';
import 'signupform.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenSize.height! * 0.04,
                ),
                Text(
                  "Register Account",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: kSeceonndaryColor,
                    height: 1.5,
                  ),
                ),
                Text(
                  "Please complete your details for register your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: ScreenSize.height! * 0.06),
                SignUpForm(),
                SizedBox(height: ScreenSize.height! * 0.04),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: ScreenSize.height! * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
