

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../../data/models/loginwithmpin_screen.dart';
import '../../data/repositories/api_service.dart';
import '../widgets.dart';
import '../widgets/navigation_bar.dart';
import 'opt_verification_screen.dart';

class LoginWithMpinScreen extends StatefulWidget {
  const LoginWithMpinScreen({super.key});

  @override
  State<LoginWithMpinScreen> createState() => _LoginWithMpinScreenState();
}

class _LoginWithMpinScreenState extends State<LoginWithMpinScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isFocus = true;
  TextEditingController mpinCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.sp))),
        toolbarHeight: 160.sp, // Set this height
        flexibleSpace:Container(
          decoration: BoxDecoration(
            color: AppColor.bgClr,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.sp),
              bottomLeft: Radius.circular(15.sp),
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login With MPIN',
                      style: AppStyle.appBarTitleStyle(fontSize: 22.sp), // Adjusting font size responsively
                      softWrap: true,textAlign: TextAlign.left,maxLines: 2,
                    ),
                    SizedBox(width: 5.sp),
                    SvgPicture.asset(
                      'assets/images/logo_login.svg',
                    ),

                  ],
                ),
                SizedBox(height: 5.sp),
                Text(
                  'Enter your registered mpin to login into your account also you can use your registered biometrics ',
                  style: AppStyle.appBarTitleStyle(fontSize: 18.sp, fontWeight: FontWeight.w500), // Dynamically adjust font size
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(top: 20.sp),
        child: Form(
          key: formkey,
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // isFocus
              //     ?
              Text('MPIN', style: AppStyle.textfdTextStyle(color: AppColor.bgClr)),
              //     :
              // SizedBox() ,
              TextFormField(
                // onTap: () {
                //   setState(() {
                //     isFocus = false;
                //   });
                // },
                maxLength: 4,
                //focusNode: phoneFocusNode,
                controller: mpinCon,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: AppColor.textClr,
                ),
                // onFieldSubmitted: (value) {
                //   setState(() {
                //     isFocus = true;
                //   });
                // },
                // onSaved: (newValue) {
                //   setState(() {
                //     isFocus = true;
                //   });
                // },
                decoration: InputDecoration(
                  counterText: '',
                  filled:  isFocus,
                  fillColor: isFocus ? AppColor.textFiledbg : Colors.white,
               //   labelText: 'Enter MPIN' ,
                  hintText: 'Enter MPIN',
                  floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                  focusedBorder:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(
                      color: AppColor.bgClr, // Set border color when focused
                      width: 1,
                    ),
                  ),

                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(
                      color: AppColor.bgClr, // Set border color when focused
                      width: 1,
                    ),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide.none, // No border when unfocused
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/images/locktTxtPrefix.svg',
                      height: 24.sp,
                      width: 24.sp,
                    ),
                  ),

                //  labelStyle:isFocus == false ? AppStyle.textfdTextStyle( color: AppColor.bgClr ) :AppStyle.textfdTextStyle( color: AppColor.textClr ),
                  hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                ),
                validator: (value) {
                  if(value!.isEmpty || value == null){
                    return 'Please enter MPIN';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20.sp,),
              GestureDetector(
                  child: Text('Do you want to forgot your MPIN',style:AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontSize: 16.sp,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OptVerificationScreen(otp: 1234, isForgot: true,),));
              },

              ),
              SizedBox(height: 20.sp,),
              InkWell(
                onTap: () {
                },child: SvgPicture.asset('assets/images/finger_print.svg'))
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Widgets.getOtpBtn(
              data: 'Next',
              onPressed: () async {
                if (formkey.currentState!.validate()){
                  final prefs = await SharedPreferences.getInstance();
                  String? dvc = await prefs.getString('deviceId');
                  LoginWithMpinModel? otpResponse = await ApiService().loginWithMpin( mpin: mpinCon.text, deviceId: dvc!, firebaseToken: '789889656',);
                  //LocalData.saveUserId(otpResponse?.data?.id);
                  prefs.setString('userId', "${otpResponse?.data?.id}");
                  if(otpResponse?.status ==200){
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(token: otpResponse?.data?.token,id: otpResponse?.data?.id,),));
               }else{
                 print('faild to login');
                 _displayDialog(context, "Invalide MPIN" ?? 'Something went wrong');
                    // showAutoDismissAlert(context,otpResponse?.message ?? 'yuwyruw' );
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

  void _displayDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(message),  // Display the message from the API
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

}
