import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/screens/userProfile/userProfileSreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height! * 0.2,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        child: GestureDetector(
            child: SvgPicture.asset('assets/icons/profile.svg'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          UserProfileScreen(profile: "profile")));
            }
            // Navigator.push(context, SizeRoute(page: ProfileScreen())),
            ),
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
      ),
    );
  }
}
