import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../app_bar_fortab.dart';

class PassbookScreen extends StatefulWidget {
  const PassbookScreen({super.key});

  @override
  State<PassbookScreen> createState() => _PassbookScreenState();
}
class _PassbookScreenState extends State<PassbookScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarTab( // Use the common AppBar
        title: 'PASSBOOK', // Pass the title here
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
      return Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 10.sp,top: 10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.sp,),
          decoration: BoxDecoration(
            color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 4,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.sp))),
          child: Column(
      children: [
       Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp).copyWith(bottom: 5.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('MADHUR DAY (Single Digit, Open) : 2',style: AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontWeight: FontWeight.w600,fontSize: 15.sp),),
                            Text('+ ₹1.0',style: AppStyle.appBarTitleStyle(color: AppColor.greenClr,fontSize: 17.sp),),
                          ],
                        ),
              ),
        Container(
          color:AppColor.bgClr,
          padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 2.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,),textAlign: TextAlign.center,),
              Text('Previous Amount',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w600,fontSize: 12.sp),textAlign: TextAlign.center),
              Text('Current Amount',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w600,fontSize: 12.sp),textAlign: TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp).copyWith(top: 2.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('23/06/2024',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: AppColor.textBlackclr),),
              Text('20535',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: AppColor.textBlackclr),),
             SizedBox(width: 30.sp,),
              Text('20535',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: AppColor.textBlackclr),),
              SizedBox(width: 10.sp,),
            ],
          ),
        ),
      ],
          ),
        ),
      );
      },
        itemCount: 12,

      ),

    );
  }
}
