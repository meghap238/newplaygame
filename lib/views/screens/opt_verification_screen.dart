/*
import 'dart:async';
import 'package:bhau_777/data/local_data.dart';
import 'package:bhau_777/data/models/verified_otp_model.dart';
import 'package:bhau_777/views/screens/registration_screen.dart';
import 'package:bhau_777/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bhau_777/config/app_color.dart';
import 'package:bhau_777/config/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/forgot_mpin_model.dart';
import '../../data/repositories/api_service.dart';
import '../app_bar_widget.dart';

class OptVerificationScreen extends StatefulWidget {
  final int otp;
  final bool isForgot;
  const OptVerificationScreen({super.key,  required this.otp, required this.isForgot,});

  @override
  State<OptVerificationScreen> createState() => _OptVerificationScreenState();
}

class _OptVerificationScreenState extends State<OptVerificationScreen> {
  var _start = 25;
  String? errorMsg = '';
  String? otp;
  var dvcId;
  var strigNumer;
  int numvber = 111111111;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  TextEditingController txCon1 = TextEditingController();
  TextEditingController txCon2 = TextEditingController();
  TextEditingController txCon3 = TextEditingController();
  TextEditingController txCon4 = TextEditingController();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    getMObileNum();
 //  strigNumer =  LocalData.getMobile();
    _startTimer();
    if(widget.isForgot == true){
      print('come from forgotMpin button');
      forgotMpinModel? otpResponse =  ApiService().forgotMPin( deviceId: dvcId, mobile: strigNumer ) as forgotMpinModel?;
      ApiService().forgotMPin(mobile: 9638527410 , deviceId: 'RP1A.200720.011');
    }else {
      print('come from login Screen');
    }
   // var strigNumer = (widget.number).toString();
  //  print(strigNumer.runtimeType);
  }



Future<void> getMObileNum() async {
  final prefs = await SharedPreferences.getInstance();
  strigNumer =  prefs.getInt('mobile');
  // numvber =  prefs.getInt('mobile');
  dvcId = await prefs.getString('deviceId');
 // print(strigNumer);
  print(dvcId);
 // print(numvber);
 //  setState(() {
 //    strigNumer = numvber;
 //  });
}
  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        print(_start);
      } else {
        setState(() {
          _start--;
        });
      }
    });}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
         resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              AppBarWidget.appbarWidget(
                title: 'OTP Verification',
               subTitle: '',
                context: context,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Enter the OTP sent to ',
                                  style: AppStyle.blackClrtxtSyle(),
                                ),
                              ),
                            ),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '+91 ${strigNumer}',
                                  style: AppStyle.blackClrtxtSyle(
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.sp),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: txCon1,
                                  focusNode: focusNode1,
                                  autofocus: true,
                                  maxLength: 1,

                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon1.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);
                                    } else {
                                      setState(() {
                                        txCon1.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);

                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);
                                    } else {
                                      setState(() {
                                        txCon1.text = '';
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);
                                     // txCon1.text = '';
                                    }
                                  },

                                ),

                              ),
                              SizedBox(width: 20.sp),
                              Flexible(
                                child: TextFormField(
                                  controller: txCon2,
                                  focusNode: focusNode2,
                                maxLength: 1,
                                //  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon2.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                    } else {
                                      setState(() {
                                        txCon2.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);
                                    }

                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                    } else {
                                      setState(() {
                                        txCon2.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.sp),
                              Flexible(
                                child: TextFormField(
                                  controller: txCon3,
                                  focusNode: focusNode3,
                                  maxLength: 1,
                                  //  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon3.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode4);
                                    } else {
                                      setState(() {
                                        txCon3.text = '';
                                      });


                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);

                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode4);
                                    } else {
                                      setState(() {
                                        txCon3.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);

                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.sp),
                              Flexible(
                                child: TextFormField(
                                  controller: txCon4,
                                  focusNode: focusNode4,
                                  maxLength: 1,
                                  //  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon4.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .unfocus();
                                    } else {
                                      setState(() {
                                        txCon4.text = '';
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);

                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .unfocus();
                                    } else {
                                      setState(() {
                                        txCon4.text = '';
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                      // txCon1.text = '';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.sp),
                          child: Text('$errorMsg',style: AppStyle.blackClrtxtSyle(color: Colors.red,fontSize: 10.sp,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                        ),
                        SizedBox(height: 20.sp),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Seconds Remaining:',
                            style: AppStyle.appBarTitleStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.grey.shade600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 00:$_start',
                                style: AppStyle.appBarTitleStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: AppColor.textblack3A,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Didn’t you receive? ',
                                  style: AppStyle.blackClrtxtSyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.textClr,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _start = 25;
                                });

                                // Your resend OTP logic here
                                _startTimer();
                              },
                              child: Text(
                                'Resend OTP',
                                style: AppStyle.blackClrtxtSyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.bgClr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Widgets.getOtpBtn(data: 'Submit',
                  onPressed: () async {
               if (formKey.currentState!.validate()) {
                    final prefs = await SharedPreferences.getInstance();
                    String? dvc = prefs.getString('deviceId');
                    String otp = ''; // Initialize empty string
                    setState(() async {
                      if(txCon1.text.isNotEmpty || txCon2.text.isNotEmpty || txCon3.text.isNotEmpty || txCon4.text.isNotEmpty){
                        setState(() {
                          errorMsg = '';
                          otp = otp + txCon1.text; // Add first text field value
                          otp = otp + txCon2.text; // Add second text field value
                          otp = otp + txCon3.text; // Add third text field value
                          otp = otp + txCon4.text; // Add fourth text field value
                          int OTP = int.parse(otp!);
                        });

                          VerifiedOtpModel? otpResponse = await ApiService().verifiedOtpApi(otp: widget.otp, deviceId: dvc!);
                        if (otpResponse?.status == 200 ) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        }
                        else {
                          // showAutoDismissAlert(context, otpResponse?.message ?? 'An unexpected error occurred.');
                          print('navigation stopped');
                        }
                      }
                      // else if(OTP != widget.otp){
                      //   setState(() {
                      //     errorMsg = 'Please fill correct OTP';
                      //   });
                      // }
                      else{
                        setState(() {
                          errorMsg = 'Please fill OTP';
                        });
                      }
                    });

                  }else{
                    print('hsgfhsdgf');
                  }
                },),
                SizedBox(height: 30.sp),
                Widgets.trustedFromUserFunc()
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget buildOtpField({
    required TextEditingController controller,
    required FocusNode focusNode,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
  }) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: controller.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.only(bottom: 5.sp),
        ),
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
*/
import 'dart:async';
import 'package:bhau_777/data/local_data.dart';
import 'package:bhau_777/data/models/forgot_verify_otp_model.dart';
import 'package:bhau_777/data/models/verified_otp_model.dart';
import 'package:bhau_777/views/screens/registration_screen.dart';
import 'package:bhau_777/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bhau_777/config/app_color.dart';
import 'package:bhau_777/config/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/api_service.dart';
import '../app_bar_widget.dart';

class OptVerificationScreen extends StatefulWidget {
  final int otp;
  final bool isForgot;
  const OptVerificationScreen(
      {super.key, required this.otp, required this.isForgot});

  @override
  State<OptVerificationScreen> createState() => _OptVerificationScreenState();
}

class _OptVerificationScreenState extends State<OptVerificationScreen> {
  var _start = 25;
  String? errorMsg = '';
  String? otp;
  String? dvcId;
  int? mobileNumber;
  Timer? timer;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  TextEditingController txCon1 = TextEditingController();
  TextEditingController txCon2 = TextEditingController();
  TextEditingController txCon3 = TextEditingController();
  TextEditingController txCon4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    getMobileNum();
    _startTimer();
  }
  Future<void> getMobileNum() async {
    final prefs = await SharedPreferences.getInstance();

    // Fetch the mobile number and device ID from SharedPreferences
    int? number = prefs.getInt('mobile');
    String? deviceId = prefs.getString('deviceId');

    // Update the state after fetching the values
    setState(() {
      mobileNumber = number ?? 0;  // Set a default value of 0 if null
      dvcId = deviceId;
    });

    print('Mobile Number: $mobileNumber');
    print('Device ID: $dvcId');

    // Once the mobile number and device ID are fetched, make the API call
    if (widget.isForgot == true) {
      print('Come from forgotMpin button');

      if (mobileNumber != 0 && dvcId != null) {
        print('Calling forgotMPin API with mobileNumber: $mobileNumber and deviceId: $dvcId');
        ApiService().forgotMPin(mobile: mobileNumber!, deviceId: dvcId!);
      } else {
        print('Mobile number or device ID is null, cannot call forgotMPin');
      }
    } else {
      print('Come from login Screen');
    }
  }
  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              AppBarWidget.appbarWidget(
                title: 'OTP Verification',
                subTitle: '',
                context: context,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Enter the OTP sent to ',
                                  style: AppStyle.blackClrtxtSyle(),
                                ),
                              ),
                            ),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '+91 $mobileNumber', // Displaying the mobile number
                                  style: AppStyle.blackClrtxtSyle(
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.sp),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: txCon1,
                                  focusNode: focusNode1,
                                  autofocus: true,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon1.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);
                                    } else {
                                      setState(() {
                                        txCon1.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);

                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);
                                    } else {
                                      setState(() {
                                        txCon1.text = '';
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);
                                      // txCon1.text = '';
                                    }
                                  },

                                ),

                              ),
                              SizedBox(width: 20.sp),
                              Flexible(
                                child: TextFormField(
                                  controller: txCon2,
                                  focusNode: focusNode2,
                                  maxLength: 1,
                                  //  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon2.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                    } else {
                                      setState(() {
                                        txCon2.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);
                                    }

                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                    } else {
                                      setState(() {
                                        txCon2.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode1);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.sp),
                              Flexible(
                                child: TextFormField(
                                  controller: txCon3,
                                  focusNode: focusNode3,
                                  maxLength: 1,
                                  //  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon3.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode4);
                                    } else {
                                      setState(() {
                                        txCon3.text = '';
                                      });


                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);

                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode4);
                                    } else {
                                      setState(() {
                                        txCon3.text = '';
                                      });

                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);

                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.sp),
                              Flexible(
                                child: TextFormField(
                                  controller: txCon4,
                                  focusNode: focusNode4,
                                  maxLength: 1,
                                  //  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(1)],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: txCon4.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5.sp),
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .unfocus();
                                    } else {
                                      setState(() {
                                        txCon4.text = '';
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);

                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.length >= 1) {
                                      FocusScope.of(context)
                                          .unfocus();
                                    } else {
                                      setState(() {
                                        txCon4.text = '';
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                      // txCon1.text = '';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Text(
                            '$errorMsg',
                            style: AppStyle.blackClrtxtSyle(
                                color: Colors.red,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Seconds Remaining:',
                            style: AppStyle.appBarTitleStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.grey.shade600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 00:$_start',
                                style: AppStyle.appBarTitleStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: AppColor.textblack3A,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        _buildResendOtpRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: _buildBottomSheet(context),
        ),
      ],
    );
  }

  Widget _buildOtpFields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildOtpField(txCon1, focusNode1, focusNode2),
          SizedBox(width: 20.sp),
          _buildOtpField(txCon2, focusNode2, focusNode3),
          SizedBox(width: 20.sp),
          _buildOtpField(txCon3, focusNode3, focusNode4),
          SizedBox(width: 20.sp),
          _buildOtpField(txCon4, focusNode4, null),
        ],
      ),
    );
  }

  Widget _buildOtpField(TextEditingController controller, FocusNode currentNode,
      FocusNode? nextNode) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        focusNode: currentNode,
        autofocus: true,
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: controller.text.isNotEmpty ? AppColor.bgClr : Colors.grey,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.only(bottom: 5.sp),
        ),
        onChanged: (value) {
          if (value.length >= 1 && nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          }else{
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
      ),
    );
  }

  Widget _buildResendOtpRow() {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Didn’t you receive? ',
              style: AppStyle.blackClrtxtSyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.textClr,
              ),
            ),
          ),
        ),
        TextButton(
        onPressed:  _start == 0 ? () {
            setState(() {
              _start = 25;
            });
            if (widget.isForgot == true) {
              print('for forgot');
              // Ensure both mobileNumber and dvcId are not null before using them
              if (mobileNumber != null && dvcId != null) {
                print('mobileNumber or dvcId is $dvcId and  $mobileNumber , cannot call forgotMPin');
                ApiService()
                    .forgotMPin(mobile: mobileNumber!, deviceId: dvcId!);
              } else {
                print('mobileNumber or dvcId is null, cannot call forgotMPin');
              }
            } else {
              ApiService().getOtp(mobileNumber!, dvcId!);
              print('for login');
            }
            _startTimer();
          }
          : null,child: Text(
            'Resend OTP',
            style: AppStyle.blackClrtxtSyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: _start == 0 ? AppColor.bgClr :  AppColor.textClr,
            ),
          ),

        ),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Widgets.getOtpBtn(
            data: 'Submit',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                String otp = txCon1.text + txCon2.text + txCon3.text + txCon4.text;

                if (otp.isNotEmpty) {
                  setState(() {
                    errorMsg = '';
                  });
                  if (widget.isForgot) {
                    FPasswordVerifyOtpModel? otprsp = await ApiService()
                        .FVerifyforgotOtp(
                            otp: int.parse(otp), deviceId: dvcId!);
                    if (otprsp?.status == 200) {
                      print('verify otp successfully forgot otp');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen(isForgot: widget.isForgot,)),
                      );
                    } else {
                      print('stop navigate');
                    }
                  } else {
                    VerifiedOtpModel? otpResponse =
                        await ApiService().verifiedOtpApi(
                      otp: int.parse(otp),
                      deviceId: dvcId!,
                    );

                    if (otpResponse?.status == 200) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen(
                                  isForgot: false,
                                )),
                      );
                    } else {
                      print('stop navigate');
                    }
                  }
                } else {
                  print('Not valide');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
