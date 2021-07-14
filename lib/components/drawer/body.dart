import 'package:epharmacy/screens/MainHome/mainHomeScreen.dart';
import 'package:epharmacy/screens/Paymenthome/paymentHomeScreen.dart';
import 'package:epharmacy/screens/auth/signin/signinScreen.dart';
import 'package:epharmacy/screens/orderStatus/completeOrder.dart';
import 'package:epharmacy/screens/orderStatus/pendingOrder.dart';
import 'package:epharmacy/screens/orderStatus/processingOrdrer.dart';
import 'package:epharmacy/screens/subHome/components/recenSales.dart';
import 'package:epharmacy/screens/totalOrder/TotalOrderDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../helpers/themes/themes.dart';
import 'child.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        color: white,
        child: Column(
          children: [
            SizedBox(height: 15.0),
            DrawerTile(
              name: 'Home',
              icon: 'homes',
              child: MainHomeScreen(),
            ),
            DrawerTile(
              name: 'Orders',
              icon: 'order',
              child: TotalOrderDetailScreen(totalOrder: "Total Orders"),
            ),
            DrawerTile(
                name: 'Payment',
                icon: 'payment',
                child: PaymentHomeScreen(
                  titlePayemnt: 'Payment',
                )),
            DrawerTile(
              name: 'Recent Sales',
              icon: 'sales',
              child: RecentSales(
                titleRecent: "Recent Sales",
              ),
            ),
            DrawerTile(
              name: 'Pending Order',
              icon: 'pending',
              child: PendingOrder(
                titlePend: 'Pending Order',
              ),
            ),
            DrawerTile(
              name: 'Processing Order',
              icon: 'process',
              child: ProcessingOrder(
                titleProcess: 'Processing Order',
              ),
            ),
            DrawerTile(
              name: 'Complete Order',
              icon: 'complete',
              child: CompleteOrder(
                titleComple: "Complete Order",
              ),
            ),
            DrawerTile(
              name: 'Shop Availity',
              icon: 'Shop Icon',
              child: SigninScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
