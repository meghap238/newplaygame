/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_color.dart';
import '../config/app_style.dart';

abstract class AppBarWidget {
  static Widget appbarWidget({String? title, String? subTitle, context,String? discription }) {
return
      Container(
      height: MediaQuery.of(context).size.height/3.5,
      
      decoration: BoxDecoration(
     //   image: DecorationImage(image: SvgPicture('assets/images/bgimageappbar.svg'),),
        color:  AppColor.bgClr,
        borderRadius: BorderRadius.only(bottomRight:Radius.circular(15.sp),
            bottomLeft: Radius.circular(15.sp) ),

      ),
      child:   Padding(
        padding:  EdgeInsets.symmetric(horizontal:  15.sp).copyWith(bottom: 22.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         //   SizedBox(height:  60.sp),
            Spacer(),
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                    child: Text( title ?? 'Welcome To ',style: AppStyle.appBarTitleStyle(),softWrap: true,)),
               SizedBox(width: 10.sp,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(subTitle ??'assets/images/logo_login.svg',fit: BoxFit.scaleDown,width:110.sp ,)),
              ],
            ),
            SizedBox(height: 5.sp,),
            FittedBox(
              fit: BoxFit.scaleDown,
                child: Text(discription ?? 'India’s best Satta Matka Application Welcomes You !!!',style: AppStyle.appBarTitleStyle(fontSize: 22.sp,fontWeight: FontWeight.w500),maxLines: 3,textAlign: TextAlign.left,softWrap: true,))
          ],
        ),
      ),
    );
}
}*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_color.dart';
import '../config/app_style.dart';

abstract class AppBarWidget {
  static Widget appbarWidget({
    String? title,
    String? subTitle,
    String? discription,
    required BuildContext context,

  }) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5, // Height is dynamic based on screen size
      decoration: BoxDecoration(
        color: AppColor.bgClr,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.sp),
          bottomLeft: Radius.circular(15.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp).copyWith(bottom: 22.sp),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(), // Adjust the spacing for alignment
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Welcome To',
                  style: AppStyle.appBarTitleStyle(fontSize: 22.sp), // Adjusting font size responsively
                  softWrap: true,textAlign: TextAlign.left,maxLines: 2,
                ),
                SizedBox(width: 5.sp),
                Expanded(
                  child: SvgPicture.asset(
                    subTitle ?? 'assets/images/logo_login.svg',
                  ),
                ),
                     Spacer()
              ],
            ),
            SizedBox(height: 5.sp),
            // Description text
            Text(
              discription ?? 'India’s best Satta Matka Application Welcomes You !!!',
              style: AppStyle.appBarTitleStyle(fontSize: 18.sp, fontWeight: FontWeight.w500), // Dynamically adjust font size
              maxLines: 3,
              textAlign: TextAlign.left,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
