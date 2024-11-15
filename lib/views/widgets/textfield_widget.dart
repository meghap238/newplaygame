import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final int maxLength;
  final bool? isFocus;
  final TextInputType keyboardType;
  final bool showPassword;
  final void Function()? togglePassword;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final  void Function()? onPressedsufix;
  final void Function()? onTap;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength = 4,
    this.keyboardType = TextInputType.text,
    this.showPassword = false,
    this.togglePassword,
    this.validator,
    this.inputFormatters,
    this.fillColor,
    this.onPressedsufix, this.onTap, this.isFocus
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters ?? [],
      obscureText: obscureText,
      onTap:onTap ,
      decoration: InputDecoration(
          labelStyle:isFocus == true ? AppStyle.textfdTextStyle( color: AppColor.bgClr ) :AppStyle.textfdTextStyle( color: AppColor.textClr ),
          hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
        labelText: labelText,
        hintText: hintText,
        counterText: '',
        filled:  isFocus,
        fillColor: isFocus == false ? Colors.white : AppColor.textFiledbg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // No border when not focused
        ),
        prefixIcon:  Padding(
          padding: EdgeInsets.all(12.sp),
          child: SvgPicture.asset(
            'assets/images/locktTxtPrefix.svg',
            height: 24.sp,
            width: 24.sp,
          ),
        ),
        //prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon:
        //isPassword
//?
        IconButton(
          icon: showPassword ? SvgPicture.asset('assets/images/eyetext.svg',) : Icon(CupertinoIcons.eye,color: AppColor.bgClr,),
          //Icon(showMpin ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined ),
          onPressed:onPressedsufix
          //     () {
          //   setState(() {
          //     showMpin = !showMpin;
          //   });
          // },
        )
           // : (suffixIcon != null ? Icon(suffixIcon) : null),
      ),
      validator: validator,
    );
  }
}
