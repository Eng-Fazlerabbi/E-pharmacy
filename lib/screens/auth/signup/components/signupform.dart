import 'package:epharmacy/apis/auth/auth.dart';
import 'package:epharmacy/components/custom_surfix_icon.dart';
import 'package:epharmacy/components/form_error.dart';
import 'package:epharmacy/helpers/constants/constants.dart';
import 'package:epharmacy/helpers/keyboard/keyboard.dart';
import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:epharmacy/models/bdCountry_details.dart';
import 'package:epharmacy/models/country_details.dart';
import 'package:epharmacy/models/ip_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../components/default_button.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;
  String? state;
  String? country;
  String? countryCode;
  String? currency;
  String? phoneNumber;
  String? address;
  String? flag;
  int? countryIndex;
  bool remember = false;
  double? latitude, longitude;
  TextEditingController? _addressController, _phoneController;
  bool selected = true;
  bool selectedIcon = true;
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          addressContainer(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Keyboard.hide(context);
                await Auth.signup(
                  context: context,
                  // name: _firstName! + ' ' + _lastName!,
                  name: fullName!,
                  email: email!,
                  phone: phoneNumber!,
                  password: password!,
                  country: country ?? '',
                  countryCode: countryCode ?? '',
                  state: state ?? '',
                  address: address ?? '',
                  currency: currency ?? '',
                  flag: flag ?? '',
                  latitude: latitude ?? 0.0,
                  longitude: longitude ?? 0.0,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kFirstNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kFirstNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full-Name",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "@example name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "@example gmail.com",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  Consumer addressContainer() {
    return Consumer<IpInfoModel?>(builder: (_, data, __) {
      if (data != null) {
        country = data.countryName;
        currency = data.currency;
        countryCode = data.countryCallingCode;
        countryIndex = countryDetails!
            .indexWhere((x) => x.countryName == data.countryName);
        _addressController =
            TextEditingController(text: '${data.city}, ${data.region}');
        flag = data.countryCode;
        latitude = data.latitude ?? 0.0;
        longitude = data.longitude ?? 0.0;
        if (_phoneController == null) {
          _phoneController =
              TextEditingController(text: data.countryCallingCode);
        }
      }
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: ScreenSize.width / 1.3,
            child: DropdownButton<String>(
              isExpanded: true,
              onChanged: (value) {
                countryIndex =
                    countryDetails!.indexWhere((x) => x.countryName == value);
                setState(() {
                  country = value;
                  countryCode = countryDetails![countryIndex!].countryCode;
                  currency = countryDetails![countryIndex!].currency;
                });
              },
              value: country,
              items: countries(),
              hint: Text('Select Country'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: ScreenSize.width / 1.3,
            child: DropdownButton<String>(
              isExpanded: true,
              onChanged: (value) => setState(() => state = value),
              value: state,
              items: country == null
                  ? [DropdownMenuItem(child: Text('Select State'))]
                  : states(),
              hint: Text('Select State'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _addressController,
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kAddressNullError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kAddressNullError);
                return "";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Address",
              labelStyle: TextStyle(
                color: kSeceonndaryColor,
              ),
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.location_on),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
        ],
      );
    });
  }

  List<DropdownMenuItem<String>> countries() {
    List<DropdownMenuItem<String>> list = [];
    countryDetails!.forEach((c) {
      list.add(DropdownMenuItem<String>(
        child: Text(c.countryName),
        value: c.countryName,
      ));
    });
    return list;
  }

  List<DropdownMenuItem<String>> states() {
    int countryIndex =
        countryDetails!.indexWhere((element) => element.countryName == country);
    List<DropdownMenuItem<String>> list = [];
    countryDetails![countryIndex].states.forEach((c) {
      list.add(DropdownMenuItem<String>(
        child: Text(c.stateName),
        value: c.stateName,
      ));
    });
    return list;
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else {
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText:
            "Phone Number ${countryCode == null ? '' : '($countryCode)'}",
        hintText: 'Phone Number',
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: selected,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      onTap: () => setState(() => selected = !selected),
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomSurffixIcon(svgIcon: "assets/icons/security.svg"),
        suffixIcon: InkWell(
          onTap: _tapPasswodView,
          child: Icon(
            selected ? Icons.visibility_off : Icons.visibility,
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: selectedIcon,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "Re-enter password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomSurffixIcon(svgIcon: "assets/icons/security.svg"),
        suffixIcon: InkWell(
          onTap: _tapPasswodView,
          child: Icon(
            selectedIcon ? Icons.visibility_off : Icons.visibility,
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  void _tapPasswodView() => setState(() => selectedIcon = !selectedIcon);
}
