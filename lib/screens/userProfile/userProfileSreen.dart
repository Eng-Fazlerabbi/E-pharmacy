import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:epharmacy/screens/userProfile/components/userProfileHome.dart';
import 'package:flutter/material.dart';


class UserProfileScreen extends StatelessWidget {
  final String profile;

  const UserProfileScreen({Key? key,  required this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profile),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      drawer: KDrawer(),
      body: ProfileHome(),
    );
    //change
  }
}
