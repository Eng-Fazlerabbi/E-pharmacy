import 'package:epharmacy/components/drawer/drawer.dart';
import 'package:epharmacy/screens/Paymenthome/components/paymentHome.dart';
import 'package:flutter/material.dart';


class PaymentHomeScreen extends StatelessWidget {
  final String titlePayemnt;

  const PaymentHomeScreen({Key? key, required this.titlePayemnt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePayemnt),
        centerTitle: true,
      ),
      drawer: KDrawer(),
      body: PaymentHome(),
    );
  }
}
