import 'package:bhau_777/data/models/add_fun_model.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../widgets.dart';
class AddFundScreen extends StatefulWidget {
  final id;
  final token;
  const AddFundScreen({super.key, this.id, this.token});
  @override
  State<AddFundScreen> createState() => _AddFundScreenState();
}
class _AddFundScreenState extends State<AddFundScreen> {
  TextEditingController rupeeCon =  TextEditingController();
  //List amount = ["100","500","300","1000","2000","1500"];
  List<dynamic> amount = [100, 200, 300, 400, 500, 600];
  int _value = 0;
  bool isLoading  = false;
  @override
  void initState() {
    super.initState();
    // Set the initial value of the TextFormField based on the selected chip
    rupeeCon.text = "${amount[_value]}";
  }
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
                          'ADD FUNDS',
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
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 30.sp,horizontal: 20.sp),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Wallet Balance',style: AppStyle.tileTextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),textAlign: TextAlign.center,),
                Text( "₹ ${snapshot.data?.data!.details?.walletBalance}" ??'₹ 1000.00',style: AppStyle.tileTextStyle(fontSize: 20.sp),textAlign: TextAlign.center,),
                SizedBox(height: 40.sp,),
                Text('Enter Amount',style: AppStyle.appBarTitleStyle(fontWeight: FontWeight.w500,fontSize: 20.sp,color: AppColor.bgClr),textAlign: TextAlign.center,),
                SizedBox(height: 20.sp,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 70.sp),
                  child: Row(
                    children: [
                     // SvgPicture.asset('assets/icons/rupeeBigIcon.svg',),
                      Expanded(
                        child: TextFormField(
                          controller: rupeeCon,
                          style: TextStyle(
                              color: AppColor.bgClr,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 30.sp,
                          ),
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.sp),
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
                    ],
                  ),
                ),
                SizedBox(height: 20.sp,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Wrap(alignment: WrapAlignment.center,
                    spacing: 10,
                    children: List<Widget>.generate(
                      6,
                          (int index) {
                        return ChoiceChip(
                          elevation: 3,side: BorderSide(width: 1,color: Colors.grey.shade400),
                          shadowColor: Colors.grey.shade100,selectedShadowColor: Colors.transparent,
                          selectedColor: AppColor.bgClr,
                          showCheckmark: false,
                          label: Container(
                              width: 50.sp,alignment: Alignment.center,
                              child: Text("${amount[index]}")),
                          backgroundColor: Colors.grey.shade200,
                          labelStyle: TextStyle( color:_value == index ? Colors.white :Colors.black ),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                            //  _value = selected ? index : null;
                              _value = selected ? index : 0; // Update selected index
                              rupeeCon.text = "${amount[_value]}";
                            });
                           // print(" amount is : ${amount[index]}");
                        //    rupeeCon.text = "${amount[index]}";
                           // print(rupeeCon.text);
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                const Spacer(),
                Widgets.getOtpBtn(
                  data: 'Send Request',
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    AddFundModel? response = await
                    ApiService().addFundApi(userId: widget.id, token: widget.token,  amount: int.parse(rupeeCon.text));
                    setState(() {
                      isLoading = false;
                    });
                  isLoading ? Center(child: CircularProgressIndicator(color: Colors.red,),) :
                  showDialog<void>(
                       context: context,
                       barrierDismissible: false, // user must tap button!
                       builder: (BuildContext context) {
                     return   Stack(
                       children: [
                         AlertDialog(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp),side: BorderSide(color: AppColor.bgClr,width: 3)),
                           title:  Text('Amount Add Successful', style: AppStyle.appBarTitleStyle(
                             fontSize: 17.sp,
                             fontWeight: FontWeight.bold,color: AppColor.bgClr,
                           ),textAlign: TextAlign.center,),
                           content: Text("₹${rupeeCon.text}"?? '₹500', style: AppStyle.appBarTitleStyle(
                             fontSize: 20.sp,
                             fontWeight: FontWeight.bold,color: AppColor.bgClr,
                           ),textAlign: TextAlign.center,),
                           actions: <Widget>[
                             InkWell(
                               child: Container(
                                 decoration: BoxDecoration(color: AppColor.bgClr,borderRadius: BorderRadius.circular(15.sp),),
                                 child: Text('ok',style:  AppStyle.appBarTitleStyle(
                                   fontSize: 20.sp,
                                   fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),
                                 padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 40.sp),
                                 alignment: Alignment.center,
                               ),
                               onTap: () {
                                 Navigator.of(context).pop();
                               },
                             )
                           ],
                           alignment: Alignment.center,
                         ),
                         Container(decoration: BoxDecoration(shape: BoxShape.circle),
                           height: 50.sp,width: 50.sp,
                         )
                       ],
                     );
                       },
                     );

                },),
              ],
            ),
          ),
        );
      },

      
    );
  }



  void showSuccessDialog(BuildContext context, String amount) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          contentPadding: EdgeInsets.only(top: 50.sp),
          content: SingleChildScrollView(  // Wrap content with SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -60.sp,
                      child: CircleAvatar(
                        radius: 40.sp,
                        backgroundColor: Colors.green.shade700,
                        child: Icon(
                          Icons.check,
                          size: 40.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                Text(
                  'Amount Add Successful',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.sp),
                Text(
                  '₹ 5000.00',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.sp),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 40.sp),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),
              ],
            ),
          ),
        );
      },
    );

  }
}
