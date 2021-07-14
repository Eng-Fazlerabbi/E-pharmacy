import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:epharmacy/helpers/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TransectiontHome extends StatelessWidget {
  const TransectiontHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RowOneItem(
              totalEarn: 'My Earn',
              totalEarnAmount: 0.0,
            ),
            RowTwoItem(
              totalpayable: 'Total Payable',
              totalpayableAmount: 0.0,
            ),
            TotalMoney()
          ],
        ),
      ),
    );
  }
}

class RowOneItem extends StatefulWidget {
  final String totalEarn;

  final double totalEarnAmount;

  const RowOneItem({
    Key? key,
    required this.totalEarn,
    required this.totalEarnAmount,
  }) : super(key: key);

  @override
  _RowOneItemState createState() => _RowOneItemState();
}

class _RowOneItemState extends State<RowOneItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              width: ScreenSize.width,
              height: ScreenSize.height! * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icons/salary.svg',
                    height: 60,
                    width: 50,
                    color: kSeceonndaryColor,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.totalEarn,
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
                        widget.totalEarnAmount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: kSeceonndaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowTwoItem extends StatelessWidget {
  final String totalpayable;
  final double totalpayableAmount;

  const RowTwoItem({
    Key? key,
    required this.totalpayable,
    required this.totalpayableAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              width: ScreenSize.width,
              height: ScreenSize.height! * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icons/payable.svg',
                    height: 70,
                    width: 60,
                    color: kSeceonndaryColor,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        totalpayable,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: kSeceonndaryColor),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        totalpayableAmount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: kSeceonndaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TotalMoney extends StatelessWidget {
  List<String> tmoney = [
    'rahim',
    'karim',
    'Fattah',
    'Rakib',
    'Rabbil',
    'Hasan',
    'Rakib',
    'Rabbil',
    'Hasan',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            width: ScreenSize.width,
            height: ScreenSize.height! * .05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              'Income Money List',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: kSeceonndaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tmoney.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: ListTile(
                leading: Text(
                  tmoney[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
