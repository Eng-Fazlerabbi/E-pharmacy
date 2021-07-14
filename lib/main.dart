import 'package:epharmacy/apis/ip_info.dart';
import 'package:epharmacy/models/ip_info.dart';
import 'package:epharmacy/provider/daySchedule.dart';
import 'package:epharmacy/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'helpers/themes/themes.dart';
import 'screens/wrapper.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(uiConfig!);
  Provider.debugCheckInvalidValueType = null;
  await Hive.openBox('user');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        FutureProvider<IpInfoModel?>(
          updateShouldNotify: (data1, data2) => data1 != data2,
          create: (_) => IPInfo.ipInfo(),
          initialData: null,
        ), 
        ChangeNotifierProvider<SelectSchedule>(
          create: (_) => SelectSchedule(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Wrapper(),
        builder: EasyLoading.init(),
      ),
    ),
  );
}
