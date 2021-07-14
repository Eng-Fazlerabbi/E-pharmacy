import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class PharmcayLicense extends StatefulWidget {
  const PharmcayLicense({Key? key}) : super(key: key);

  @override
  _PharmcayLicenseState createState() => _PharmcayLicenseState();
}

class _PharmcayLicenseState extends State<PharmcayLicense> {
  File? image;
  File? image2;
  File? image3;
  File? image4;

  final picker = ImagePicker();

  Future _getImageGalleryNid() async {
    final pickedFiled= await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFiled != null) {
          image = File(pickedFiled.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageFromCamraNid() async {
    var pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(
      () {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageGalleryNidEnd() async {
    final pickedFiled = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFiled != null) {
          image2 = File(pickedFiled.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageFromCamraNidEnd() async {
    var pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(
      () {
        if (pickedFile != null) {
          image2 = File(pickedFile.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageGalleryTrade() async {
    final pickedFiled = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFiled != null) {
          image3 = File(pickedFiled.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageFromCamraTrade() async {
    var pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(
      () {
        if (pickedFile != null) {
          image3 = File(pickedFile.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageGalleryDrug() async {
    final pickedFiled = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFiled != null) {
          image4 = File(pickedFiled.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  Future _getImageFromCamraDrug() async {
    var pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(
      () {
        if (pickedFile != null) {
          image4 = File(pickedFile.path);
        } else {
          Fluttertoast.showToast(msg: 'No image is selected');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          fontNidImagePicker(),
          SizedBox(height: getProportionateScreenHeight(30)),
          backNidImagePicker(),
          SizedBox(height: getProportionateScreenHeight(30)),
          tradeImagePicker(),
          SizedBox(height: getProportionateScreenHeight(30)),
          drugImagePicker(),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  Padding fontNidImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: image == null ? null : 100,
        width: ScreenSize.width,
        padding: EdgeInsets.only(left: 25, right: 20, bottom: 15, top: 15),
        alignment: Alignment.center,
        child: image == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('Select Font Picture of NID',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _showFontPicker(context);
                    },
                    child: Icon(
                      Icons.file_upload,
                      color: kSeceonndaryColor,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.file(image!)),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 30,
                      color: kSeceonndaryColor,
                    ),
                    onPressed: () => setState(() => image = null),
                  ),
                ],
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  Future<void> _showFontPicker(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gellary'),
                    onTap: () {
                      _getImageGalleryNid();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImageFromCamraNid();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding backNidImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: image2 == null ? null : 100,
        width: ScreenSize.width,
        padding: EdgeInsets.only(left: 25, right: 20, bottom: 15, top: 15),
        alignment: Alignment.center,
        child: image2 == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('Select Back Picture of NID',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _showBackPicker(context);
                    },
                    child: Icon(
                      Icons.file_upload,
                      color: kSeceonndaryColor,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.file(image2!)),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 30,
                      color: kSeceonndaryColor,
                    ),
                    onPressed: () => setState(() => image2 = null),
                  ),
                ],
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  Future<void> _showBackPicker(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gellary'),
                    onTap: () {
                      _getImageGalleryNidEnd();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImageFromCamraNidEnd();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding tradeImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: image3 == null ? null : 100,
        width: ScreenSize.width,
        padding: EdgeInsets.only(left: 25, right: 20, bottom: 15, top: 15),
        alignment: Alignment.center,
        child: image3 == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('Select Picture of TradeLicense ',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _showTradePicker(context);
                    },
                    child: Icon(
                      Icons.file_upload,
                      color: kSeceonndaryColor,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.file(image3!)),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 30,
                      color: kSeceonndaryColor,
                    ),
                    onPressed: () => setState(() => image3 = null),
                  ),
                ],
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  Future<void> _showTradePicker(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                    onTap: () {
                      _getImageGalleryTrade();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImageFromCamraTrade();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding drugImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: image4 == null ? null : 100,
        width: ScreenSize.width,
        padding: EdgeInsets.only(left: 25, right: 20, bottom: 15, top: 15),
        alignment: Alignment.center,
        child: image4 == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('Select Picture of DrugLicense ',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _showDrugPicker(context);
                    },
                    child: Icon(
                      Icons.file_upload,
                      color: kSeceonndaryColor,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.file(image4!)),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 30,
                      color: Colors.blue.shade400,
                    ),
                    onPressed: () => setState(() => image4 = null),
                  ),
                ],
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kSeceonndaryColor,
          ),
        ),
      ),
    );
  }

  Future<void> _showDrugPicker(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Galllery'),
                    onTap: () {
                      _getImageGalleryDrug();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImageFromCamraDrug();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
