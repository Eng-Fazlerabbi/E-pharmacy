import 'package:epharmacy/apis/auth/auth.dart';
import 'package:epharmacy/components/custom_surfix_icon.dart';
import 'package:epharmacy/components/form_error.dart';
import 'package:epharmacy/helpers/constants/constants.dart';
import 'package:epharmacy/helpers/keyboard/keyboard.dart';
import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:epharmacy/models/bdCountry_details.dart';
import 'package:epharmacy/models/country_details.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../components/default_button.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  bool selectedIcons = true;
  bool isHidden = true;

  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
    getCountryDetailsbd();
    getCountryDetails();
    try {
      Hive.openBox('user');
    } on Exception catch (_) {}
  }

  @override
  Widget build(BuildContext ctx) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kSeceonndaryColor,
                onChanged: (value) => setState(() => remember = value!),
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: 20.0),
          DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Keyboard.hide(ctx);
                  await Auth.signin(
                    context: context,
                    email: email!,
                    password: password!,
                  );
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else {
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: selectedIcons,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomSurffixIcon(svgIcon: "assets/icons/security.svg"),
        suffixIcon: InkWell(
          onTap: _passwordHidden,
          child: Icon(
            selectedIcons ? Icons.visibility_off_sharp : Icons.visibility,
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  void _passwordHidden() => setState(() => selectedIcons = !selectedIcons);
}
