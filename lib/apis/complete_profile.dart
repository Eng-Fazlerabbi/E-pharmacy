import 'package:epharmacy/helpers/constants/constants.dart';
import 'package:epharmacy/provider/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';


class CompleteProfile {
  static Future<void> createProfile(
      {
      pharmacyName,
      disName,
      thanaName,
      areaName,
      pharmacyDes,
      address,
      radioValue,
      chosenValue,
      opentime,
      closetime,
      image,
      image2,
      image3,
      image4}) async {
    var request = MultipartRequest('POST',
        Uri.parse('https://e-treatment.xyz/api/pharmacy-profile-setting'));
    request.fields.addAll({
      'user_id': UserData.user!.user!.id.toString(),
      'pharmacyname': pharmacyName,
      'district': disName,
      'Upazilla': thanaName,
      'area_name': areaName,
      'description': pharmacyDes,
      'address': address,
      'off_day': chosenValue,
      'duration_time': radioValue,
      'closing_time': opentime,
      'opening_time': closetime,
      'nid_front_image': image,
      'nid_back_image': image2,
      'trade_license_image': image3,
      'drug_license_image': image4
    });
    // print(UserData.user!.token!);

    /// for add this request files. need filepicker and give a file path
    if (image != null) {
        request.files.add(MultipartFile.fromBytes(
            'image', image.readAsBytesSync(),
            filename: image.path.split("/").last));
      }
       if (image2 != null) {
        request.files.add(MultipartFile.fromBytes(
            'image', image2.readAsBytesSync(),
            filename: image2.path.split("/").last));
      }  if (image3 != null) {
        request.files.add(MultipartFile.fromBytes(
            'image', image3.readAsBytesSync(),
            filename: image3.path.split("/").last));
      }  if (image4 != null) {
        request.files.add(MultipartFile.fromBytes(
            'image', image4.readAsBytesSync(),
            filename: image4.path.split("/").last));
      }
    request.headers.addAll(headers(UserData.user!.token!));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      EasyLoading.showSuccess(' Successfull');
      print('sssssss');
      return null;
    } else {
      print(await response.stream.bytesToString());
      print(response.reasonPhrase);
      EasyLoading.showError('Failed');
      return null;
    }
  }
}
