import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../config/app_color.dart';
import '../config/app_style.dart';

class CustomAppBarTab extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? IconsShow;
  final void Function()? onPressed;

  // Define the height of the app bar
  @override
  final Size preferredSize;

  CustomAppBarTab({
    Key? key,
    this.title, this.IconsShow, this.onPressed,
  })  : preferredSize = Size.fromHeight(100.sp), // You can adjust this height as needed
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/appbarbg.png'),
          alignment: Alignment.topLeft,
          fit: BoxFit.cover,
        ),
        color: AppColor.bgClr,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.sp),
          bottomLeft: Radius.circular(15.sp),
        ),
      ),


      child: AppBar(

       // backgroundColor: AppColor.bgClr,
        backgroundColor: Colors.transparent,
        titleSpacing: 20.sp,

        leading: IconsShow == true ? IconButton(
          onPressed:onPressed,
          icon:  Padding(
          padding: EdgeInsets.only(top: 20.sp),
          child: Image(image: AssetImage('assets/images/letwhiteArrow.png')),
        ), ) : null,

        title: Padding(
          padding: EdgeInsets.only(top: 20.sp),
          child: Text(
            title ?? 'Funds', // Default title if none provided
            style: AppStyle.appBarTitleStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(15.sp),
        //   ),
        // ),
        toolbarHeight: 100.sp, // Set the toolbar height dynamically
      ),
    );
  }
}
