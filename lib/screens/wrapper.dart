import 'package:epharmacy/screens/MainHome/mainHomeScreen.dart';
import 'package:epharmacy/screens/auth/signin/signinScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../helpers/size_config/size_config.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Hive.box('user');
    ScreenSize().init(context);
    return _user.containsKey('user') ? MainHomeScreen() : SigninScreen();
  }
}
