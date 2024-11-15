import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../../data/repositories/api_service.dart';
import '../widgets.dart';

class WithdrawFunds extends StatefulWidget {
  final id;
  final token;
  const WithdrawFunds({super.key, this.id, this.token});

  @override
  State<WithdrawFunds> createState() => _WithdrawFundsState();
}

class _WithdrawFundsState extends State<WithdrawFunds> {
  TextEditingController rupeeCon =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: ApiService().getDetailAddFund(id: widget.id,token:widget.token),
      builder: ( context,  snapshot) {
        if (snapshot.data?.status != 200) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data available'));
        }
        return  Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp)),
            ),
            toolbarHeight: 170.sp, // Set this height
            flexibleSpace: Container(
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 30.sp,
                            height: 30.sp,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(image: AssetImage('assets/images/letwhiteArrow.png'))),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 20.sp),
                        Text(
                          'WITHDRAW FUNDS',
                          style: AppStyle.appBarTitleStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                          ), // Dynamically adjust font size
                          maxLines: 3,
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.sp,),
                    Text(
                      snapshot.data?.data!.details?.name ?? 'Abhishek Sharma',
                      style: AppStyle.appBarTitleStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.sp,),
                    Text(
                      "${snapshot.data?.data!.details?.mobile}" ??  '+7894561230',
                      style: AppStyle.appBarTitleStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
      //      physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 30.sp,horizontal: 20.sp),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Wallet Balance',style: AppStyle.tileTextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),textAlign: TextAlign.center,),
                  Text(     "₹ ${snapshot.data?.data!.details?.walletBalance}" ??'₹ 1000.00',style: AppStyle.tileTextStyle(fontSize: 20.sp),textAlign: TextAlign.center,),
                  SizedBox(height: 40.sp,),
                  Text('Enter Amount',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w500,fontSize: 20.sp,color: AppColor.bgClr),textAlign: TextAlign.center,),
                  SizedBox(height: 20.sp,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 70.sp),
                    child: TextFormField(
                      controller: rupeeCon,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: AppColor.bgClr,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 30.sp
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.sp).copyWith(left: 40.sp),
                            child: SvgPicture.asset(
                              'assets/icons/rupeeBigIcon.svg',
                            ),
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.bgClr,width: 2)
                          )
                      ),
                    ),
                  ),
                //Spacer(),
                 // SizedBox(height: 70,),

                ],
              ),
            ),
          ),
            // bottomSheet: Padding(
            //   padding:  EdgeInsets.symmetric(vertical: 30.sp),
            //   child: Widgets.getOtpBtn(data: 'Send Request',onPressed: () {
            //   },),
            // ) ,


          bottomSheet:     Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Widgets.getOtpBtn(
                  data: 'Send Request',
                  onPressed: () async {
                   var response = await
                    ApiService().withdrawfundApi(userId: widget.id, token: widget.token, amount:int.parse( rupeeCon.text));
                    if (response?.status == 200) {
                      //  showSuccessDialog(context, rupeeCon.text);
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => OptVerificationScreen(otp: otpResponse!.data.details.otp, isForgot: false,),
                      //   ),
                      // );
                    } else {

                      // Show the alert with the API message
                      //showAutoDismissAlert(context, otpResponse?.message ?? 'An unexpected error occurred.');
                      print('navigation stopped');
                    }


                  },
                ),
              ],
            ),
          ),
        );
      },


    );
  }
}
