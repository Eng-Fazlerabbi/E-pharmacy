import 'package:epharmacy/helpers/size_config/size_config.dart';
import 'package:flutter/material.dart';


class PaymentHome extends StatelessWidget {
  const PaymentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RowOneItem(nagad: "Nagad", bkash: "Bkash"),
          RowTwoItem(upay: "Upay", rocket: "Rocket"),
          RowThreeItem(bank: "Bank", paypal: "Paypal"),
        ],
      ),
    );
  }
}

class RowOneItem extends StatefulWidget {
  final String nagad;
  final String bkash;

  const RowOneItem({
    Key? key,
    required this.nagad,
    required this.bkash,
  }) : super(key: key);

  @override
  _RowOneItemState createState() => _RowOneItemState();
}

class _RowOneItemState extends State<RowOneItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withOpacity(.9),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                width: ScreenSize.width * .438,
                height: ScreenSize.height! * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.payment_outlined,
                      color: Colors.pink.shade600,
                    ),
                    Text(
                      widget.nagad,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withOpacity(.9),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                width: ScreenSize.width * .438,
                height: ScreenSize.height! * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.card_membership,
                      color: Colors.pink,
                    ),
                    Text(
                      widget.bkash,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RowTwoItem extends StatefulWidget {
  final String upay;
  final String rocket;

  const RowTwoItem({
    Key? key,
    required this.upay,
    required this.rocket,
  }) : super(key: key);

  @override
  _RowTwoItemState createState() => _RowTwoItemState();
}

class _RowTwoItemState extends State<RowTwoItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withOpacity(.9),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                width: ScreenSize.width * .438,
                height: ScreenSize.height! * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.payment_outlined,
                      color: Colors.pink.shade600,
                    ),
                    Text(
                      widget.rocket,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withOpacity(.9),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                width: ScreenSize.width * .438,
                height: ScreenSize.height! * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.card_membership,
                      color: Colors.pink,
                    ),
                    Text(
                      widget.upay,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RowThreeItem extends StatefulWidget {
  final String bank;
  final String paypal;

  const RowThreeItem({Key? key, required this.bank, required this.paypal})
      : super(key: key);

  @override
  _RowThreeItemState createState() => _RowThreeItemState();
}

class _RowThreeItemState extends State<RowThreeItem>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withOpacity(.9),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                width: ScreenSize.width * .438,
                height: ScreenSize.height! * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.payment_outlined,
                      color: Colors.pink.shade600,
                    ),
                    Text(
                      widget.bank,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withOpacity(.9),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                width: ScreenSize.width * .438,
                height: ScreenSize.height! * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.card_membership,
                      color: Colors.pink,
                    ),
                    Text(
                      widget.paypal,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
