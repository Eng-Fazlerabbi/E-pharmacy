import 'package:epharmacy/screens/orderhome/orderHomeScreen.dart';
import 'package:epharmacy/screens/subHome/subHomeScreen.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _currentindex = 0;
  final pages = [
    SubHomeScreen(
      titlePharma: 'Easy Pharmacy',
    ),
    OrderHomeScreen(
      titleOrder: "Orders",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: kPrimaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
              // color: kPrimaryColor,
            ),
            label: 'Orders',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: pages[_currentindex],
    );
  }
}

// var _user = Provider.of<UserProvider>(context, listen: false);
  // 