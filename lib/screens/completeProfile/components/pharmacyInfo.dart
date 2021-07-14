import 'package:epharmacy/helpers/constants/constants.dart';
import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:epharmacy/models/bdCountry_details.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
import 'dart:ui';

class PharmacyInfo extends StatefulWidget {
  @override
  PharmacyInfoState createState() => PharmacyInfoState();
}

class PharmacyInfoState extends State<PharmacyInfo> {
  String? pharmacyName;
  String? pharmacyDes;
  String? disName;
  String? thanaName;
  String? areaName;
  String? address;
  int? disIndex;
  

  static final formKey = GlobalKey<FormState>();
 

  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(
        () {
          errors.add(error!);
        },
      );
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(
        () {
          errors.remove(error);
        },
      );
  }

  // Future _getImageGalleryLogo() async {
  //   final pickedFiled = await picker.getImage(source: ImageSource.gallery);
  //   setState(
  //     () {
  //       if (pickedFiled != null) {
  //         image = File(pickedFiled.path);
  //       } else {
  //         Fluttertoast.showToast(msg: 'No image is selected');
  //       }
  //     },
  //   );
  // }

  // Future _getImageFromCamraLogo() async {
  //   var pickedFile =
  //       await picker.getImage(source: ImageSource.camera, imageQuality: 50);
  //   setState(
  //     () {
  //       if (pickedFile != null) {
  //         image = File(pickedFile.path);
  //       } else {
  //         Fluttertoast.showToast(msg: 'No image is selected');
  //       }
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    getCountryDetailsbd();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           // pharmacyLogoPicker(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          districtPicker(),
          SizedBox(height: getProportionateScreenHeight(30)),
          thanaPicker(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAreaFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDescriptionFormField(),
        ],
      ),
    );
  }

  // Padding pharmacyLogoPicker() {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 10),
  //     child: Container(
  //       height: image == null ? null : 100,
  //       width: ScreenSize.width,
  //       padding: EdgeInsets.only(left: 25, right: 20, bottom: 15, top: 15),
  //       alignment: Alignment.center,
  //       child: image == null
  //           ? Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Expanded(
  //                   child: Text(
  //                     'Select Logo of Pharmacy',
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                     ),
  //                   ),
  //                 ),
  //                 GestureDetector(
  //                   onTap: () async {
  //                     await _showLogoPicker(context);
  //                   },
  //                   child: Icon(
  //                     Icons.file_upload,
  //                     color: kSeceonndaryColor,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           : Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Expanded(child: Image.file(image!)),
  //                 IconButton(
  //                   icon: Icon(
  //                     Icons.delete_outline_rounded,
  //                     size: 30,
  //                     color: kSeceonndaryColor,
  //                   ),
  //                   onPressed: () => setState(() => image = null),
  //                 ),
  //               ],
  //             ),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           color: kSeceonndaryColor,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _showLogoPicker(context) async {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Container(
  //           child: Wrap(
  //             children: <Widget>[
  //               ListTile(
  //                   leading: Icon(Icons.photo_library),
  //                   title: Text('Gellary'),
  //                   onTap: () {
  //                     _getImageGalleryLogo();
  //                     Navigator.of(context).pop();
  //                   }),
  //               ListTile(
  //                 leading: Icon(Icons.photo_camera),
  //                 title: Text('Camera'),
  //                 onTap: () {
  //                   _getImageFromCamraLogo();
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  TextFormField buildNameFormField() {
    return TextFormField(
           onSaved: (newValue) => pharmacyName = newValue,
      onChanged: (value) {
        print(value);
        if (value.isNotEmpty) {
          removeError(error: kPharmacyNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPharmacyNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Pharmacy Name",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "@example pharmacy",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
        minLines: 1,
        onSaved: (newValue) => pharmacyDes = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPharmacyDesNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPharmacyDesNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Pharmacy Descriptions",
          labelStyle: TextStyle(
            color: kSeceonndaryColor,
          ),
          hintText: "@example Short descripion services.",
          // floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        maxLines: 4);
  }

  Container districtPicker() {
    return Container(
      alignment: Alignment.center,
      width: ScreenSize.width,
      height: ScreenSize.height! * .08,
      child: DropdownButton<String>(
        isExpanded: true,
        onChanged: (value) {
          disIndex =
              bdcountryDetails!.indexWhere((x) => x.districtName == value);
          setState(() {
            disName = value;
          });
        },
        value: disName,
        items: countries(),
        hint: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('Select District'),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> countries() {
    List<DropdownMenuItem<String>> list = [];
    // print(bdcountryDetails);
    bdcountryDetails!.forEach((c) {
      list.add(DropdownMenuItem<String>(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(c.districtName.toString()),
        ),
        value: c.districtName,
      ));
    });
    return list;
  }

  Container thanaPicker() {
    return Container(
      alignment: Alignment.center,
      width: ScreenSize.width,
      height: ScreenSize.height! * .08,
      child: DropdownButton<String>(
        isExpanded: true,
        onChanged: (values) => setState(() => thanaName = values),
        value: thanaName,
        items: disName == null
            ? [
                DropdownMenuItem(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Text('Select Upazia/Thana'),
                  ),
                )
              ]
            : thanas(),
        hint: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
          ),
          child: Text('Select Upazia/Thana'),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> thanas() {
    int disIndex = bdcountryDetails!
        .indexWhere((element) => element.districtName == disName);

    List<DropdownMenuItem<String>> list = [];
    bdcountryDetails![disIndex].upazila!.forEach((cs) {
      list.add(DropdownMenuItem<String>(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
          ),
          child: Text(cs.upazilaName.toString()),
        ),
        value: cs.upazilaName,
      ));
    });
    return list;
  }

  TextFormField buildAreaFormField() {
    return TextFormField(
      maxLines: 1,
      onSaved: (newValue) => areaName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPharmacyAreaNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPharmacyAreaNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Area Name",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "@example area",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      maxLines: 1,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPharmacyAdressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPharmacyAdressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        labelStyle: TextStyle(
          color: kSeceonndaryColor,
        ),
        hintText: "@example road/house",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

class TitleInfo extends StatelessWidget {
  final String infoTitle;

  const TitleInfo({Key? key, required this.infoTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        infoTitle,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
            color: kSeceonndaryColor),
      ),
    );
  }
}
