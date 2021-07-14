import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
