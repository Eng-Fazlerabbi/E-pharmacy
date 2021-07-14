import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:epharmacy/screens/totalEarn/totalEarnHomeScreen.dart';
import 'package:epharmacy/screens/totalOrder/TotalOrderDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SubHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RowOneItem(
            totalOrder: 'Total Order',
            amountOrder: 0,
          ),
          RowTwoItem(
            amountPayment: 0.0,
            totalAmount: 'Total Earn',
          ),
          RowThreeItem(monthlyIncome: "Total Monthly Income", tmIncome: 0.0),
        ],
      ),
    );
  }
}

class RowOneItem extends StatefulWidget {
  final String totalOrder;
  final int amountOrder;

  const RowOneItem({
    Key? key,
    required this.totalOrder,
    required this.amountOrder,
  }) : super(key: key);

  @override
  _RowOneItemState createState() => _RowOneItemState();
}

class _RowOneItemState extends State<RowOneItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          border: Border.all(color: kSeceonndaryColor, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: ScreenSize.width,
        height: ScreenSize.height! * .25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/order.svg',
                    height: 40,
                    width: 30,
                    color: kSeceonndaryColor,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.totalOrder,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: kSeceonndaryColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.amountOrder.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: kSeceonndaryColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TotalOrderDetailScreen(
                                totalOrder: 'Total Orders',
                              )));
                },
                icon: Icon(
                  Icons.arrow_right_alt_rounded,
                  color: kSeceonndaryColor,
                  size: 50.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowTwoItem extends StatelessWidget {
  final String totalAmount;
  final double amountPayment;

  const RowTwoItem({
    Key? key,
    required this.amountPayment,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kSeceonndaryColor, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: ScreenSize.width,
        height: ScreenSize.height! * .25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/payment.svg',
                    height: 40,
                    width: 30,
                    color: kSeceonndaryColor,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    totalAmount.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: kSeceonndaryColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    amountPayment.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: kSeceonndaryColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TotalEarnHomeScreen(
                                titleEarn: 'Total Earn',
                              )));
                },
                icon: Icon(
                  Icons.arrow_right_alt_rounded,
                  color: kSeceonndaryColor,
                  size: 50.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowThreeItem extends StatelessWidget {
  final String monthlyIncome;
  final double tmIncome;

  const RowThreeItem({
    Key? key,
    required this.monthlyIncome,
    required this.tmIncome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/salary.svg',
              height: 50,
              width: 40,
              color: kSeceonndaryColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              monthlyIncome,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: kSeceonndaryColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              tmIncome.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: kSeceonndaryColor),
            ),
          ],
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 2,
            color: kSeceonndaryColor,
          ),
        ),
        width: ScreenSize.width,
        height: ScreenSize.height! * .25,
      ),
    );
  }
}
