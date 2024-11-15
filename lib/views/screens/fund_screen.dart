import 'package:bhau_777/views/screens/add_fund_screen.dart';
import 'package:bhau_777/views/screens/home_screen.dart';
import 'package:bhau_777/views/screens/withdraw_funds.dart';
import 'package:bhau_777/views/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../app_bar_fortab.dart';

class FundScreen extends StatefulWidget {
  final leftIcon;
  final id;
  final token;
  const FundScreen({super.key, this.leftIcon, this.id, this.token});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  List <String> itemsName = ['Add Fund','Withdraw Fund', 'Add Bank Details', 'Fund Deposite History', 'Fund Withdraw History' , 'Bank Change History' ];

  List <String> itemsImg = ['assets/images/add_fund.svg','assets/images/widraow_fund.svg', 'assets/images/details.svg',
    'assets/images/depositImg.svg','assets/images/fundwidraw_history.svg',"assets/images/svgformate_bank_change.svg", ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarTab(
        // Use the common AppBar
        title: 'Funds',
        IconsShow: widget.leftIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        // Pass the title here
      ),
    body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 15.sp),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,  mainAxisSpacing: 20.sp,childAspectRatio: 2/1.9,
          crossAxisSpacing: 20.sp,),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.grey.shade200),borderRadius: BorderRadius.circular(15.sp)),
              elevation: 2.sp,
              child: Padding(
                padding:  EdgeInsets.all(10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(itemsImg[index]),
                  SizedBox(height: 10.sp,),
                  Text(
                    itemsName[index] ?? '10:00 AM',
                    style: AppStyle.appBarTitleStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
                ),
              ),),
            onTap: () {
              if(index == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddFundScreen(id: widget.id,token: widget.token,), ));
              }else if(index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WithdrawFunds(id: widget.id,token: widget.token,), ));

              }
            },
          );
        },
        itemCount: itemsName.length,
      ),
    ),




    /* body: ListView.builder(
       reverse: false,
       padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 15.sp).copyWith(top: 20.sp),
       itemCount: 12,
         itemBuilder: (context, index) {
       return Card(
         elevation: 10,
         shadowColor: Colors.black26,
         margin: EdgeInsets.only(bottom: 20.sp),
         color: Colors.white,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.sp),),side: BorderSide(color: AppColor.bgClr, width: 1 )),
       child: ListTile(
         horizontalTitleGap: 25.sp,
       contentPadding: EdgeInsets.symmetric(horizontal: 25.sp),
         subtitle:Text('You can add fund to your wallet',style: AppStyle.appBarTitleStyle(fontSize: 12.sp,color: AppColor.textBlackclr,fontWeight: FontWeight.w600),),
         leading:   SvgPicture.asset(
           'assets/images/cardaddfund.svg',
         ),
         title: Text('Add Fund',style: AppStyle.appBarTitleStyle(fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w600),),
         trailing: Container(width: 50.sp,height: 50.sp,
           decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.bgClr,
           image: DecorationImage(image: AssetImage('assets/images/errowright.png'))
           ),),
       ),

       );
     },



     ),*/
    );
  }

}

