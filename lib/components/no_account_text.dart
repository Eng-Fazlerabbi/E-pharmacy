import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:epharmacy/screens/completeProfile/CompleteProfileHome.dart';
import 'package:flutter/material.dart';
import '../screens/auth/signup/signupScreen.dart';

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account? ",
              style: TextStyle(fontSize: getProportionateScreenWidth(18)),
            ),
            GestureDetector(
              onTap: () => Navigator.of(ctx).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupScreen(),
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  color: kSeceonndaryColor,
                ),
              ),
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CompleteProfileHome()));
            },
            child: Text('ByPass'))
      ],
    );
  }
}
