// import 'dart:io';
//
// import 'package:bhau_777/config/app_color.dart';
// import 'package:bhau_777/data/models/check_user_model.dart';
// import 'package:bhau_777/data/repositories/api_service.dart';
// import 'package:bhau_777/views/screens/login_screen.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../data/local_data.dart';
// import 'login_with_mpin_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   String dvc = '124536';
//   @override
//   void initState() {
//     super.initState();
//     getUniqueDeviceId();
//     //CheckUserModel? otpResponse = ApiService().checkUser(deviceId: dvc);
//     int status = ApiService().checkUser(deviceId: dvc) as int;
//     if(status == 200){
//       Future.delayed( Duration(seconds: 3),(){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithMpinScreen(),));
//       }
//       );
//     }else{
//       Future.delayed( Duration(seconds: 3),(){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
//       });
//     }
//
//   }
//   Future<String> getUniqueDeviceId() async {
//     //final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String uniqueDeviceId = '';
//     var deviceInfo = DeviceInfoPlugin();
//     if (Platform.isIOS) {
//       var iosDeviceInfo = await deviceInfo.iosInfo;
//       uniqueDeviceId =
//       '${iosDeviceInfo.name}:${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
//     } else if (Platform.isAndroid) {
//       var androidDeviceInfo = await deviceInfo.androidInfo;
//       uniqueDeviceId = androidDeviceInfo.id;
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setString('deviceId', uniqueDeviceId);
//     //  LocalData.saveUserData(uniqueDeviceId);
//     //  final prefs = await SharedPreferences.getInstance();
//       dvc  = prefs.getString('deviceId')!;
//       print("dvc ${dvc}");
//     }
//     return uniqueDeviceId;
//   }
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: AppColor.bgClr,
//       body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splash_logo.png'))),),
//
//     );
//   }
// }



import 'dart:io';
import 'package:bhau_777/config/app_color.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:bhau_777/views/screens/login_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_with_mpin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  String dvc = '';

  @override
  void initState() {
    super.initState();
    initSplash();
  }
  Future<void> initSplash() async {
    await getUniqueDeviceId();
    int? status = await ApiService().checkUser(deviceId: dvc);

    // Check status and navigate accordingly
    if (status == 200) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginWithMpinScreen()),
        );
      });
    }
    else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }
// else {
    //     // Handle other statuses or errors (optional)
    //     print('Unexpected status: $status');
    //   }
    // }
  }
  Future<void> getUniqueDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      dvc = '${iosDeviceInfo.name}:${iosDeviceInfo.identifierForVendor}';
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      dvc = androidDeviceInfo.id;
    }
    // Save the device ID in shared preferences
    await prefs.setString('deviceId', dvc);
    print("Device ID: $dvc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.bgClr,
      body: Center(
        child: Container(
          child: SvgPicture.asset('assets/images/splash_logo.svg'),
        ),
      ),
    );
  }
}
