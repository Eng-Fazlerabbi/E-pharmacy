import 'package:epharmacy/screens/userProfile/userProfileSreen.dart';
import 'package:flutter/material.dart';


import '../../helpers/themes/themes.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        color: white,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  // ProfileImage(size: 60.0),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Easy pharmacy',
                        style: tsEBoldSize(18.0),
                      ),
                      SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      UserProfileScreen(profile: "profile")));
                        },
                        child: Text(
                          'View and edit profile',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: kSeceonndaryColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text('0.0% completed', style: tsBoldSize(10)),
                    ],
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
