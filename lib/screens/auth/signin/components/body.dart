import 'package:epharmacy/components/no_account_text.dart';
import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';
import 'Signinform.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: ScreenSize.height! * 0.04),
                Text(
                  "Easy Pharmacy",
                  style: TextStyle(
                    color: kSeceonndaryColor,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: ScreenSize.height! * 0.02),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: ScreenSize.height! * 0.08),
                SignInForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
