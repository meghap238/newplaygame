import 'package:bhau_777/config/app_color.dart';
import 'package:bhau_777/views/screens/all_game_screen.dart';
import 'package:bhau_777/views/screens/example.dart';
import 'package:bhau_777/views/screens/fund_screen.dart';
import 'package:bhau_777/views/screens/login_screen.dart';
import 'package:bhau_777/views/screens/login_with_mpin_screen.dart';
import 'package:bhau_777/views/screens/opt_verification_screen.dart';
import 'package:bhau_777/views/screens/passbook_screen.dart';
import 'package:bhau_777/views/screens/ragistration_bank_screen.dart';
import 'package:bhau_777/views/screens/registration_screen.dart';
import 'package:bhau_777/views/screens/splash_screen.dart';
import 'package:bhau_777/views/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.bgClr),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

