/*

import 'dart:io';
import 'package:bhau_777/config/app_color.dart';
import 'package:bhau_777/config/app_style.dart';
import 'package:bhau_777/data/models/get_otp_model.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:bhau_777/views/app_bar_widget.dart';
import 'package:bhau_777/views/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/local_data.dart';
import 'opt_verification_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberCon = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  bool isFocus = false;
  bool isLoading = false;
  Future<String> getUniqueDeviceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String uniqueDeviceId = '';
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uniqueDeviceId = '${iosDeviceInfo.name}:${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uniqueDeviceId = androidDeviceInfo.id;
      LocalData.saveUserData(uniqueDeviceId);
    }
    return uniqueDeviceId;
  }
  void showAutoDismissAlert(BuildContext context, String? msg) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Automatically dismiss after 3 seconds
        });
        return AlertDialog(
          title: Text("Login Alert"),
          content: Text(msg ?? 'An unexpected error occurred.'), // Provide fallback message
        );
      },
    );
  }


  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }
@override
  void initState()  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body:  isLoading
          ? Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,color: Colors.blue,)) :
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarWidget.appbarWidget(context: context,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all( 20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Phone Number',
                          style: AppStyle.textfdTextStyle()
                        ),
                        // TextFormField for Phone Number
                        TextFormField(
                          maxLength: 10,
                          focusNode: phoneFocusNode,
                          controller: phoneNumberCon,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppColor.textClr,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            filled:  true,
                            fillColor: AppColor.textFiledbg,
                            hintText: 'Phone Number',
                            floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide(
                                color: AppColor.bgClr, // Set border color when focused
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide(
                                color: AppColor.bgClr, // Set border color when focused
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: const BorderSide(
                                color: Colors.red, // Set border color when focused
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide.none, // No border when unfocused
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12.sp),
                              child: SvgPicture.asset(
                                'assets/images/phoneIcon.svg',
                                height: 24.sp,
                                width: 24.sp,
                              ),
                            ),
                            labelStyle: AppStyle.textfdTextStyle()
                          ),
                          validator: (value) {
                            String pattern = r'^[6789]\d{9}$';
                            RegExp regex = RegExp(pattern);
                            if (value!.isEmpty || value == null) {
                              return 'Please enter number';
                            } else if (!regex.hasMatch(value)) {
                              return 'Please enter a valid Phone Number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
bottomSheet: Container(
  color: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Widgets.getOtpBtn(onPressed: () async {
        if (formKey.currentState!.validate()) {
          String deviceId = await getUniqueDeviceId();
          int mobile = int.parse(phoneNumberCon.text);
          final prefs = await SharedPreferences.getInstance();
          String? dvc =  await prefs.getString('deviceId');
          print("dvc ${dvc}");
          setState(() => isLoading = true);
          GetLoginModel? otpResponse = await ApiService().getOtp(mobile, dvc!);

          String? msg = otpResponse?.message ?? 'Unable to login at the moment.';
          setState(() => isLoading = false);
          if(otpResponse?.status ==200){

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => OptVerificationScreen(),
    ),
  );

}
else{
    Future.delayed(Duration.zero, () => showAutoDismissAlert(context,msg));
  print('navigation stop');
}
        }
      },),
      SizedBox(height: 30.sp),
      Widgets.trustedFromUserFunc()
    ],
  ),
),
    );
  }
}
*/
import 'dart:ffi';
import 'dart:io';
import 'package:bhau_777/config/app_color.dart';
import 'package:bhau_777/config/app_style.dart';
import 'package:bhau_777/data/models/get_otp_model.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:bhau_777/views/app_bar_widget.dart';
import 'package:bhau_777/views/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/local_data.dart';
import 'opt_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberCon = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  bool isLoading = false;


  // Show auto-dismiss alert dialog with custom message
  void showAutoDismissAlert(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          print(msg);
          Navigator.of(context).pop(); // Automatically dismiss after 3 seconds
        });
        return AlertDialog(
          title: Text("Login Alert"),
          content: Text(msg),

          // Display the message passed from API response
        );
      },
    );
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    phoneNumberCon.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body:
      // isLoading
      //     ? Center(
      //   child: CircularProgressIndicator(
      //     backgroundColor: Colors.transparent,
      //     color: Colors.blue,
      //   ),
      // )
      //     :
      Stack(
        children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarWidget.appbarWidget(context: context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Phone Number',
                              style: AppStyle.textfdTextStyle(color: AppColor.bgClr)
                          ),
                          TextFormField(
                            maxLength: 10,
                            focusNode: phoneFocusNode,
                            controller: phoneNumberCon,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: AppColor.textClr,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: AppColor.textFiledbg,
                              hintText: 'Phone Number',
                              floatingLabelBehavior:
                              FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(
                                  color: AppColor.bgClr,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(
                                  color: AppColor.bgClr,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: SvgPicture.asset(
                                  'assets/images/phoneIcon.svg',
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                              ),
                              hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                            ),
                            validator: (value) {
                              String pattern = r'^[6789]\d{9}$';
                              RegExp regex = RegExp(pattern);
                              if (value!.isEmpty || value == null) {
                                return 'Please enter number';
                              } else if (!regex.hasMatch(value)) {
                                return 'Please enter a valid Phone Number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
        isLoading ?
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.sp),
              child: CircularProgressIndicator(
               // backgroundColor: Colors.yellow,
                color: AppColor.bgClr,
              ),
            ),
          )
              : SizedBox(),

      ],),
      bottomSheet: Container(
        color: Colors.white,
        padding:
        EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Widgets.getOtpBtn(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                 // String deviceId = await getUniqueDeviceId();
                  int mobile = int.parse(phoneNumberCon.text);
                  final prefs = await SharedPreferences.getInstance();
                  String? dvc = await prefs.getString('deviceId');
                  print("dvc ${dvc}");
                  setState(() => isLoading = true);
                  // Fetch OTP response from the API
                  GetLoginModel? otpResponse =
                  await ApiService().getOtp(mobile, dvc!);
                  await prefs.setInt('mobile', otpResponse!.data.details.mobile);
                  int? numvber =  prefs.getInt('mobile');
                  print(numvber);
               //LocalData.saveMobileNum(otpResponse!.data.details.mobile);
                  setState(() => isLoading = false);
                  if (otpResponse?.status == 200) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => OptVerificationScreen(otp: otpResponse!.data.details.otp, isForgot: false,),
                      ),
                    );
                  } else {
                    // Show the alert with the API message
                   showAutoDismissAlert(context, otpResponse?.message ?? 'An unexpected error occurred.');
                    print('navigation stopped');
                  }
                }
              },
            ),
            SizedBox(height: 30.sp),
            Widgets.trustedFromUserFunc(),
          ],
        ),
      ),
    );
  }
}
