import 'package:epharmacy/helpers/constants/constants.dart';
import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileHome extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageProfile(),
          SizedBox(
            height: 10.0,
          ),
          NextProfile(
            phoneNo: 01309958997,
            phoneTitle: 'Phone Number',
            ownerName: 'Rabbi',
            ownerTitle: 'Owner Name',
            email: 'rabbicse1234@gmail.com',
            emailTitle: ' E - mail',
            pharmacytitle: 'Name Of Pharmacy',
            pharmacyName: 'Easy Pharmacy',
          ),
          MoreProfile(),
          // MoresProfile(),
        ],
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: ScreenSize.width * .90,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              svgprofiles,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class NextProfile extends StatelessWidget {
  final String pharmacytitle;
  final String pharmacyName;
  final String ownerTitle;
  final String ownerName;
  final String emailTitle;
  final String email;
  final String phoneTitle;
  final int phoneNo;

  const NextProfile({
    Key? key, 
  required this.pharmacytitle, 
  required this.pharmacyName, 
  required this.ownerTitle, 
  required this.ownerName, 
  required this.emailTitle, 
  required this.email, 
  required this.phoneTitle,
   required this.phoneNo,
   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pharmacytitle,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      pharmacyName,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ownerTitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    ownerName,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    emailTitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    email,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneTitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    phoneNo.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade300,
                  ),
                  height: ScreenSize.height! * .35,
                  width: ScreenSize.width * .45,
                  child: Text('Nid Font Image'),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade300,
                  ),
                  height: ScreenSize.height! * .35,
                  width: ScreenSize.width * .45,
                  child: Text('Drug image'),
                  alignment: Alignment.center,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade300,
                  ),
                  height: ScreenSize.height! * .35,
                  width: ScreenSize.width * .45,
                  child: Text('Nid back Image'),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade300,
                  ),
                  height: ScreenSize.height! * .35,
                  width: ScreenSize.width * .45,
                  child: Text('Trade Image'),
                  alignment: Alignment.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
