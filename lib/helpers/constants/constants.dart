import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' show MultipartRequest;
import '../size_config/size_config.dart';

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kAnimationDuration = Duration(milliseconds: 200);
const kTextColor = Color(0xFF757575);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final DateFormat dateFormat = DateFormat("dd-MM-yy");
const svgprofile = 'assets/icons/UsersIcon.svg';
const svglogOut = 'assets/icons/Log out.svg';
const svgterm = 'assets/icons/terms.svg';
const svgPayment = 'assets/icons/payment.svg';
const svgprofiles = 'assets/icons/profile.svg';
const svgshop = 'assets/icons/Shop Icon.svg';
const svgresource = 'assets/icons/resource.svg';
const svgclock = 'assets/icons/clock_end.svg';

// //WebView User Agent
const String webViewUserAgent =
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.192 Safari/537.36';

//SignUp Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp emailPhoneValidatorRegExp =
    RegExp(r"^([0-9]{9})|([A-Za-z0-9._%\+\-]+@[a-z0-9.\-]+\.[a-z]{2,3})$");

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter valid email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kInvaliedInfoError = 'Email or Password Invalied';
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kInvaliedPhoneNumberError = "Please Enter valid phone number";
const String kAddressNullError = "Please Enter your address";
const String kCountryNullError = "Please Select your Country";
const String kStateNullError = "Please Select your State";
const String kPharmacyNameNullError = "Please Enter your pharmacy Name";
const String kDisNameNullError = "Please Enter your district Name";
const String kPharmacyAdressNullError = "Please Enter your pharmacy Name";
const String kPharmacyAreaNullError = "Please Enter your pharmacy Name";
const String kPharmacyDesNullError = "Please write aboutt your pharmacy";

OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    );

const String baseLink = 'https://e-pharmacy.xyz/api/';
// 'http://192.168.0.106:8000/api/';

MultipartRequest getUrl(String url) =>
    MultipartRequest('GET', Uri.parse(baseLink + url));

MultipartRequest postUrl(String url) =>
    MultipartRequest('POST', Uri.parse(baseLink + url));

const Map<String, String> headersNoToken = {
  'Accept': 'application/json',
  'Content-Type': 'application/json'
};

Map<String, String> headers(String token) => {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

const String playStoreUrl = ' ';
