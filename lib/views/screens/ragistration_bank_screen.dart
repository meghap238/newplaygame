import 'package:bhau_777/views/screens/login_with_mpin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../../data/models/singup_model.dart';
import '../../data/repositories/api_service.dart';
import '../widgets.dart';
import '../app_bar_widget.dart';

class RegistrationBlankScreen extends StatefulWidget {
  const RegistrationBlankScreen({super.key});

  @override
  State<RegistrationBlankScreen> createState() => _RegistrationBlankScreenState();
}

class _RegistrationBlankScreenState extends State<RegistrationBlankScreen> {
  bool isFocusName = true;
  bool isFocusState = true;
  bool isFocusCity = true;
  bool isFocusLanguage = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController languagecon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                Spacer(), // Adjust the spacing for alignment
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                    'Welcome To ',
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
                  'India’s best Satta Matka Application Welcomes You !!!',
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
     // resizeToAvoidBottomInset: false,
      body:   SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(top: 20.sp),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Name',
                    style: AppStyle.textfdTextStyle(color: AppColor.bgClr)
                ),
                TextFormField(
                  controller: nameCon,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: AppColor.textClr,
                  ),
                  decoration: InputDecoration(
                    filled:  isFocusName,
                    fillColor: isFocusName ? AppColor.textFiledbg : Colors.white,
                   // labelText: 'Name' ,
                    hintText: 'Enter your full name',
                    floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                    focusedBorder:
                    //isFocusName == false ?
                    OutlineInputBorder(
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide.none, // No border when unfocused
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: SvgPicture.asset(
                        'assets/images/userIcon.svg',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                  ),
                  validator: (value) {
                    if(value!.isEmpty || value == null){
                      return 'Please enter name';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 10,),
                Text(
                    'State',
                    style: AppStyle.textfdTextStyle(color: AppColor.bgClr)
                ), SizedBox() ,
                TextFormField(
                  controller: stateCon,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: AppColor.textClr,
                  ),
                  decoration: InputDecoration(
                    filled:  isFocusState,
                    fillColor: isFocusState ? AppColor.textFiledbg : Colors.white,
                    hintText: 'Enter your state',
                    floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(
                        color: AppColor.bgClr, // Set border color when focused
                        width: 1,
                      ),
                    ),
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(
                        color: AppColor.bgClr, // Set border color when focused
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
                        'assets/images/stateIcon.svg',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                  ),
                  validator: (value) {
                    if(value!.isEmpty || value == null){
                      return 'Please enter state';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                Text(
                    'City',
                    style: AppStyle.textfdTextStyle(color: AppColor.bgClr)
                ),
                TextFormField(
                  controller: cityCon,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: AppColor.textClr,
                  ),
                  decoration: InputDecoration(
                    filled:  isFocusCity,
                    fillColor: isFocusCity ? AppColor.textFiledbg : Colors.white,
                    hintText: 'Enter your city',
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(
                        color: AppColor.bgClr, // Set border color when focused
                        width: 1,
                      ),
                    ),
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(
                        color: AppColor.bgClr, // Set border color when focused
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
                        'assets/images/cityIcon.svg',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                  ),

                  validator: (value) {
                    if(value!.isEmpty || value == null){
                      return 'Please enter city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                Text(
                    'Language',
                    style: AppStyle.textfdTextStyle(color: AppColor.bgClr)),
                TextFormField(
                  controller: languagecon,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: AppColor.textClr,
                  ),
                  decoration: InputDecoration(
                    filled:  isFocusLanguage,
                    fillColor: isFocusLanguage ? AppColor.textFiledbg : Colors.white,
                    hintText: 'Enter your Language',
                    floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(
                        color: AppColor.bgClr, // Set border color when focused
                        width: 1,
                      ),
                    ),
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(
                        color: AppColor.bgClr, // Set border color when focused
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
                        'assets/images/languageIcon.svg',
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                  ),
                  validator: (value) {
                    if(value!.isEmpty || value == null){
                      return 'Please enter language';
                    }
                    return null;
                  },
                ),
                //Spacer(),
               SizedBox(height: 70,),
                Widgets.getOtpBtn(
                  data: 'Next',
                  onPressed: () async {
                    if (formKey.currentState!.validate()){
                      final prefs = await SharedPreferences.getInstance();
                      String? dvc = await prefs.getString('deviceId');
                      print(dvc);
                      SignUpModel? otpResponse =
                      await ApiService().singUpApi(name: nameCon.text, deviceId: dvc!, language: languagecon.text, city: cityCon.text, state: stateCon.text);
                      if (otpResponse?.status == 200) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginWithMpinScreen(),
                          ),
                        );
                      } else {
                        print('navigation stopped');
                      }
                    }
                  },),
                SizedBox(height: 30.sp),
                Widgets.trustedFromUserFunc()

              ],
            ),
          ),
        ),
      ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Widgets.getOtpBtn(
      //         data: 'Next',
      //         onPressed: () async {
      //         if (formKey.currentState!.validate()) {
      //           final prefs = await SharedPreferences.getInstance();
      //           String? dvc = await prefs.getString('deviceId');
      //           SignUpModel? otpResponse =
      //               await ApiService().singUpApi(name: nameCon.text, deviceId: dvc!, language: languagecon.text, city: cityCon.text, state: stateCon.text);
      //           if (otpResponse?.status == 200) {
      //             Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(
      //                 builder: (context) => LoginWithMpinScreen(),
      //               ),
      //             );
      //           } else {
      //             print('navigation stopped');
      //           }
      //         }
      //       },),
      //       SizedBox(height: 30.sp),
      //       Widgets.trustedFromUserFunc()
      //       //Widgets.trustedFromUserFunc()
      //     ],
      //   ),
      // ),

    );
  }
}
