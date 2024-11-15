/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';

class JackpotDashboardScreen extends StatefulWidget {
  const JackpotDashboardScreen({super.key});

  @override
  State<JackpotDashboardScreen> createState() => _JackpotDashboardScreenState();
}

class _JackpotDashboardScreenState extends State<JackpotDashboardScreen> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.sp))),
        toolbarHeight: 100.sp, // Set this height
        flexibleSpace:Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/appbarbg.png'),alignment: Alignment.topLeft,fit: BoxFit.cover),
            color: AppColor.bgClr,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.sp),
              bottomLeft: Radius.circular(15.sp),
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp).copyWith(bottom: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Row(
                  children: [
                       GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                     'assets/images/leftErrowIcon.svg',
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                    SizedBox(width: 25.sp,),
                    Text(
                      'JACKPOT DASHBOARD',
                      style: AppStyle.appBarTitleStyle(fontSize: 19.sp, fontWeight: FontWeight.w700), // Dynamically adjust font size
                      maxLines: 3,
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
         body: Column(
           children: [
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.sp),
               child: Row(
                 children: [
                   SvgPicture.asset('assets/images/clockIcon.svg'),
                   SizedBox(width: 5.sp,),
                   Text(
                     'History',
                     style: AppStyle.appBarTitleStyle(fontSize: 15.sp, fontWeight: FontWeight.w400,color: Color(0xff333333)), // Dynamically adjust font size
                   ),
                   Spacer(),
                   Text(
                     'Notification',
                     style: AppStyle.appBarTitleStyle(fontSize: 15.sp, fontWeight: FontWeight.w400,color: Color(0xff333333)), // Dynamically adjust font size
                   ),


                 ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.sp),
               child: Row(
                 children: [
                   Expanded(child: Divider(color: AppColor.bgClr,)),
                   Container(
                     padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 17.sp),
                     decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20) ,border: Border.all(color: AppColor.bgClr,width: 1)
                     ),
                     child: Row(
                       children: [
                         Text('Jodi',style: AppStyle.appBarTitleStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 11.sp),),
                         Text(' : 1-100',style: AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontWeight: FontWeight.w500,fontSize: 11.sp),),
                       ],
                     ),
                   ),
                   Expanded(child: Divider(color: AppColor.bgClr,)),
                 ],
               ),
             ),
             SizedBox(height: 8.sp,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.sp),
               child: Flexible(
                 child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4/4.4,mainAxisSpacing: 20.sp,crossAxisSpacing: 20.sp),
                   shrinkWrap: true,
                   itemBuilder: (BuildContext context, int index) {
                     return Stack(
                       children: [
                       Card(
                         color: Colors.white,
                         elevation: 10,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(topLeft:Radius.circular(15.sp),
                             topRight:Radius.circular(15.sp),
                             bottomLeft: Radius.circular(15.sp),
                             bottomRight: Radius.circular(15.sp),),),
                         child:
                         Padding(
                           padding:  EdgeInsets.symmetric(horizontal:  15.sp).copyWith(bottom: 10,top: 5.sp),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                             children: [
                               CircleAvatar(
                                 radius: 25.sp,
                                 backgroundColor: AppColor.bgClr,child: Text('56',style:  AppStyle.appBarTitleStyle(fontSize: 18.sp, ),),),
                               Text('10:00 AM',style: AppStyle.appBarTitleStyle(fontSize: 18.sp,color: Colors.black ),textAlign: TextAlign.center,),
                               SizedBox(height: 5.sp,),
                               Container(
                                 padding: EdgeInsets.symmetric(vertical: 5.sp),
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                                     boxShadow: [
                                       BoxShadow(
                                         color: Colors.grey.shade400,
                                         blurRadius: 4,)
                                     ]),
                                 child:  Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Container(
                                       height: 30.sp,
                                       width: 30.sp,
                                       margin: EdgeInsets.only(right: 3.sp),
                                       decoration: BoxDecoration(
                                         color: AppColor.bgClr,
                                         shape: BoxShape.circle,
                                       ),
                                       child: Center(
                                         child: Image.asset(
                                           'assets/images/playbtnforfackpot.png',),),
                                     ),
                                     Text(
                                       "Play Game",
                                       textAlign: TextAlign.center,
                                       style: AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontWeight: FontWeight.w600,fontSize: 13.sp
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(height: 5.sp,),
                               Text('Closed for Today',style: AppStyle.appBarTitleStyle(fontSize: 10.sp,color: AppColor.redShadeClr,fontWeight: FontWeight.w600 ),textAlign: TextAlign.center,softWrap: true,maxLines: 1,),
                             ],
                           ),
                         ),

                         // ),
                       ),
                       const Align(
                         alignment: Alignment.bottomCenter,
                         child: Image(image: AssetImage('assets/images/Rectangle.png')),
                       ) ],);
                     },
                   itemCount: 15,
                 ),
               ),
             )

           ],
         ),


    );

  }
}
*/
import 'package:bhau_777/data/models/jackpot_screen_model.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/app_color.dart';
import '../../config/app_style.dart';
import 'all_game_screen.dart';

class JackpotDashboardScreen extends StatefulWidget {
  final token;
  final id;
  const JackpotDashboardScreen({super.key, this.token, this.id});

  @override
  State<JackpotDashboardScreen> createState() => _JackpotDashboardScreenState();
}

class _JackpotDashboardScreenState extends State<JackpotDashboardScreen> {
  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('jackpot screen');
   // initSplash();
    print(widget.id);
    ApiService().getJackpotList(userId: widget.id, token: widget.token);
  }
  Future<void> initSplash() async {
// await ApiService().getJackpotList(userId: widget.id, token: widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
        ),
        toolbarHeight: 100.sp, // Set this height
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'JACKPOT DASHBOARD',
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
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<JackpotScreenModel?>(

        future: ApiService().getJackpotList(userId: widget.id, token: widget.token),
        builder: (context, snapshot) {
          var data = snapshot.data?.data;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }
          return   SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/clockIcon.svg'),
                      SizedBox(width: 5.sp),
                      Text(
                        'History',
                        style: AppStyle.appBarTitleStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ), // Dynamically adjust font size
                      ),
                      Spacer(),
                      Text(
                        'Notification',
                        style: AppStyle.appBarTitleStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ), // Dynamically adjust font size
                      ),
                      SizedBox(width: 3.sp,),
                      SizedBox(
                        height: 35.sp,
                        width: 48.sp,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor:  AppColor.bgClr,
                            activeColor: AppColor.bgClr,
                            thumbColor: WidgetStatePropertyAll(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.sp),
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColor.bgClr)),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 17.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColor.bgClr, width: 1),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Jodi',
                              style: AppStyle.appBarTitleStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              ' : 1-100',
                              style: AppStyle.appBarTitleStyle(
                                color: AppColor.bgClr,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Divider(color: AppColor.bgClr)),
                    ],
                  ),
                  SizedBox(height: 8.sp),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                    shrinkWrap: true, // Make GridView take only the necessary space
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 4.3,
                      mainAxisSpacing: 20.sp,
                      crossAxisSpacing: 20.sp,
                    ),
                    itemCount: data?.length ?? 10,
                    itemBuilder: (BuildContext context, int index) {

                      return InkWell(
                        child: Stack(
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp)
                                    .copyWith(bottom: 5, top: 5.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    CircleAvatar(
                                      radius: 25.sp,
                                      backgroundColor: AppColor.bgClr,
                                      child: Text(
                                        data?[index].providerResult  ?? '56',
                                        style: AppStyle.appBarTitleStyle(
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data?[index].providerName  ?? '10:00 AM',
                                      style: AppStyle.appBarTitleStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 5.sp),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.sp),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 4,
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30.sp,
                                            width: 30.sp,
                                            margin: EdgeInsets.only(right: 3.sp),
                                            decoration: BoxDecoration(
                                              color: AppColor.bgClr,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                'assets/images/playbtnforfackpot.png',
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Play Game",
                                            textAlign: TextAlign.center,
                                            style: AppStyle.appBarTitleStyle(
                                              color: AppColor.bgClr,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.sp),
                                    Text(
                                      data?[index].displayText  ?? 'Closed for Today',
                                      style: AppStyle.appBarTitleStyle(
                                        fontSize: 10.sp,
                                        color:  data?[index].isClosed == true ?  AppColor.redShadeClr : AppColor.bgClr ,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: Image(
                                image: AssetImage('assets/images/Rectangle.png'),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AllGameScreen(id: widget.id, token: widget.token,gametype: "JackPot",) ));

                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

