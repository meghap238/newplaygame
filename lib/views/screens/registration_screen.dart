import 'package:bhau_777/data/models/registration_model.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:bhau_777/views/screens/ragistration_bank_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../widgets.dart';
import '../app_bar_widget.dart';
import '../widgets/textfield_widget.dart';
import 'login_with_mpin_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final isForgot;
   RegistrationScreen({super.key, this.isForgot});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isFocus = true;
  bool isFocusState = true;
  bool error = false;
  String? errorMsg;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mpinCon = TextEditingController();
  TextEditingController cMpinCon = TextEditingController();
  bool showMpin = true;
  bool showcMpin = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body:   Column(
        children: [
          AppBarWidget.appbarWidget(
            title: 'MPIN Registartion',
            subTitle: '',
            context: context,
             discription: 'Please provide a 4 digit numeric MPIN to protect your account against unauthorized access'
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(top: 20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // isFocus
                        //     ?
                        Text(
                            'MPIN',
                            style: AppStyle.textfdTextStyle(color: AppColor.bgClr)
                        ),
                        //     :
                        // SizedBox() ,
                        TextFormField(
                          onTap: () {
                            setState(() {
                              isFocus = false;
                            });
                          },
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
                            filled:  true,
                            fillColor:  AppColor.textFiledbg ,
                            hintText:'Enter MPIN' ,
                            //  labelText: 'Enter MPIN' ,
                              floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                              focusedBorder:
                              //isFocus == false ?
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(
                                  color: AppColor.bgClr, // Set border color when focused
                                  width: 1,
                                ),
                              ),
                              //     : OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10.sp),
                              //   borderSide: BorderSide.none, // No border when unfocused
                              // ),
                              border:
                              //isFocus == true ?
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(
                                  color: AppColor.bgClr, // Set border color when focused
                                  width: 1,
                                ),
                              ),
                              //     : OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10.sp),
                              //   borderSide: BorderSide.none, // No border when unfocused
                              // ),
                              // errorBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10.sp),
                              //   borderSide: BorderSide(
                              //     color: Colors.red, // Set border color when focused
                              //     width: 1,
                              //   ),
                              // ),
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
                              suffixIcon: IconButton(
                                icon: showMpin ? SvgPicture.asset('assets/images/eyetext.svg',) : Icon(CupertinoIcons.eye,color: AppColor.bgClr,),
                                //Icon(showMpin ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined ),
                                onPressed: () {
                                  setState(() {
                                    showMpin = !showMpin;
                                  });
                                },
                              ),
                              // labelStyle:
                              // isFocus == false ? AppStyle.textfdTextStyle( color: AppColor.bgClr ) :AppStyle.textfdTextStyle( color: AppColor.textClr ),
                            hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                          ),
                          obscureText: showMpin,
                          validator: (value) {
                            if(value!.isEmpty || value == null){
                              return 'Please enter MPIN';
                            }else if(value.length <4){
                              return 'Please enter maximum 4 digit MPIN';
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 15,),


                        // isFocusState
                        //     ?
                        Text(
                            'Confirm MPIN',
                            style: AppStyle.textfdTextStyle(color: AppColor.bgClr)
                        ),
                        //     :
                        // SizedBox() ,
                        TextFormField(
                          // onTap: () {
                          //   setState(() {
                          //     isFocusState = false;
                          //   });
                          // },
                          maxLength: 4,
                          //focusNode: phoneFocusNode,
                          controller: cMpinCon,
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
                          //     isFocusState = true;
                          //   });
                          // },
                          // onSaved: (newValue) {
                          //   setState(() {
                          //     isFocusState = true;
                          //   });
                          // },
                          decoration: InputDecoration(
                            counterText: '',
                          //  error: error == true ? Text('$errorMsg') : Text("$errorMsg"),
                            filled:  true,
                            fillColor:  AppColor.textFiledbg ,
                           // labelText: 'Enter MPIN',
                            hintText: 'Enter MPIN',
                            floatingLabelBehavior: FloatingLabelBehavior.auto, // Ensure label floats
                            focusedBorder:
                           // isFocusState == false ?
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide(
                                color: AppColor.bgClr, // Set border color when focused
                                width: 1,
                              ),
                            ),
                            //     : OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10.sp),
                            //   borderSide: BorderSide.none, // No border when unfocused
                            // ),
                            border:
                            //isFocusState == true ?
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide(
                                color: AppColor.bgClr, // Set border color when focused
                                width: 1,
                              ),
                            ),
                            //     :
                            // OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10.sp),
                            //   borderSide: BorderSide.none, // No border when unfocused
                            // ),
                            // errorBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10.sp),
                            //   borderSide: BorderSide(
                            //     color: Colors.red, // Set border color when focused
                            //     width: 1,
                            //   ),
                            // ),
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
                            suffixIcon: IconButton(
                              icon: showcMpin ? SvgPicture.asset('assets/images/eyetext.svg',) : Icon(CupertinoIcons.eye,color: AppColor.bgClr,),
                              //Icon(showMpin ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined ),
                              onPressed: () {
                                setState(() {
                                  showcMpin = !showcMpin;
                                });
                              },
                            ),
                         //   labelStyle:isFocus == false ? AppStyle.textfdTextStyle( color: AppColor.bgClr ) :AppStyle.textfdTextStyle( color: AppColor.textClr ),
                            hintStyle: AppStyle.textfdTextStyle(color: AppColor.bgClr),
                          ),
                          obscureText: showcMpin,

                          validator: (value)  {
                            if(value!.isEmpty || value == null){
                              return 'Please enter MPIN';
                            }else if(cMpinCon.text != mpinCon.text){
                              return 'MPIN does not match';
                            }else if(value.length <4){
                              return 'Please enter maximum 4 digit MPIN';
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
            Widgets.getOtpBtn(data: 'Submit',


              onPressed: () async {
              if (formKey.currentState!.validate()) {
                final prefs = await SharedPreferences.getInstance();
                String? dvc =  await prefs.getString('deviceId');
                RegistrationModel? response = await ApiService().registrationApi(deviceId: dvc!, mpin: mpinCon.text, );

                if(widget.isForgot == true){
                  if(response?.status == 200){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginWithMpinScreen(),));
                  }else{
                    print(response?.message);
                  }
                }
                else{
                  if(response?.status == 200){
                    print('object');
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegistrationBlankScreen(),));
                  }else{
                    print(response?.message);
                  }
                }

              }
              },
            ),
            SizedBox(height: 30.sp),
            Widgets.trustedFromUserFunc()
            //Widgets.trustedFromUserFunc()
          ],
        ),
      ),
    );
  }
}
