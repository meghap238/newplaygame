import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app_color.dart';
import '../config/app_style.dart';

abstract class Widgets{

  static Widget CustomText({required String data,Color? color, FontWeight? fontWeight,double? fontSize,}){
    return Text(
      data,
      style: TextStyle(
        color: color ?? Colors.white,
        fontWeight:  fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 18,
      ),



    );
  }




  static Widget getOtpBtn({required void Function()? onPressed,String? data}){
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColor.bgClr),
        elevation: WidgetStateProperty.all(7),
        shadowColor: WidgetStateProperty.all(Colors.green),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.sp),),
          ),
        ),
      ),
      onPressed:onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.sp),
        child: Text(
         data ??  'Get OTP',
          style: AppStyle.btnStyle(),
        ),
      ),
    );
  }


  static Widget trustedFromUserFunc(){
   return    Row(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       SvgPicture.asset('assets/images/codicon_workspace-trusted.svg'),
       SizedBox(width: 5.sp),
       FittedBox(
         fit: BoxFit.scaleDown,
         child: Text(
           'Trusted by 1 Lakh Users',
           style: TextStyle(
             fontSize: 14.sp,
             fontWeight: FontWeight.w400,
             fontFamily: 'Open Sans',
             color: Colors.black,
           ),
         ),
       ),
     ],
   );
  }


  static Widget AppBarForTab({String? data}){
    return  AppBar(
      backgroundColor: AppColor.bgClr,
      title:  Padding(
        padding:  EdgeInsets.only(top: 20.sp),
        child: Text(
          data ?? 'Funds',
          style: AppStyle.appBarTitleStyle(fontSize: 19.sp, fontWeight: FontWeight.w700), // Dynamically adjust font size
          maxLines: 3,
          textAlign: TextAlign.left,
          softWrap: true,
        ),
      ),
      titleSpacing: 30,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      toolbarHeight: 100.sp,
    );
  }
}