import 'package:epharmacy/helpers/constants/constants.dart';
import 'package:epharmacy/provider/user.dart';
import 'package:epharmacy/screens/MainHome/mainHomeScreen.dart';
import 'package:epharmacy/screens/completeProfile/CompleteProfileHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Auth {
  static Future<void> signup({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
    required String country,
    required String countryCode,
    required String state,
    required String address,
    required String currency,
    required String flag,
    required double latitude,
    required double longitude,
  }) async {
    EasyLoading.show(status: 'Please wait');

    var request = postUrl('signup');

    request.fields.addAll({
      'role': 'pharmacyadmin',
      'country': country,
      'country_code': countryCode,
      'state': state,
      'address': address,
      'currency': currency,
      'flag': flag,
      'phone': phone,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'name': name,
      'email': email,
      'password': password,
    });

    request.headers.addAll(headersNoToken);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      var user = Hive.box('user');
      user.put('user', body);
      EasyLoading.showSuccess('Signed Up!');

      var _user = Provider.of<UserProvider>(context, listen: false);
      _user.getUserDataFromLocalWithoutNotify();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainHomeScreen(),
        ),
      );

      // Navigator.of(context).pushAndRemoveUntil(
      //     SizeRoute(page: SigninScreen()), (route) => false);

      print(body);
    } else {
      String body = await response.stream.bytesToString();

      if (body.contains(kInvaliedInfoError)) {
        EasyLoading.showError(kInvaliedInfoError);
      } else {
        EasyLoading.showError('Error');
      }

      print(response.reasonPhrase);
    }
  }

  static Future<void> signin(
      {required BuildContext context,
      required String email,
      required String password}) async {
    EasyLoading.show(status: 'Please wait');
    var request = postUrl('signin');

    request.fields.addAll(
        {
         'email': email,
         'password': password, 
         'role': 'pharmacyadmin',});

    request.headers.addAll(headersNoToken);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      // var user = Hive.box('user');
      // user.put('user', body);

      EasyLoading.showSuccess('Succesful');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => CompleteProfileHome(),
        ),
      );

      print(body);
    } else {
      String body = await response.stream.bytesToString();

      if (body.contains(kInvaliedInfoError)) {
        EasyLoading.showError(kInvaliedInfoError);
      } else {
        EasyLoading.showError('Error');
      }

      print(response.reasonPhrase);
    }
  }
}
