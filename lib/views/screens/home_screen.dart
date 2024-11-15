import 'dart:io';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:bhau_777/views/screens/fund_screen.dart';
import 'package:bhau_777/views/screens/passbook_screen.dart';
import 'package:bhau_777/views/screens/starLine_dashboard_screen.dart';
import 'package:bhau_777/views/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/app_color.dart';
import '../../config/app_style.dart';
import 'all_game_screen.dart';
import 'jackpot_dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
 final token;
 final id;
  const HomeScreen({super.key, this.token, this.id,});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
   String gameType = 'MainGame';
   //String? token;
   String userId = '';
  String substring = "close";

  List mylist = ['Home','Chart', 'Funds','My Bid History','Passbook','Notifications',
   'How To Play', 'Chat With Support','Game Rates',
    'Generate MPIN','Notice Board/ Rules','Submit Your Ideas' ,'Setting','Logout'
  ];
  List imgs = ['assets/icons/home_menu.svg', 'assets/icons/user_menu.svg', 'assets/icons/passbook.svg', 'assets/icons/play.svg', 'assets/icons/passbook.svg','assets/icons/notification.svg',
    'assets/icons/play.svg', 'assets/icons/game_rete.svg','assets/icons/game_rete.svg',
  'assets/icons/generate_mpin.svg',
  'assets/icons/notice-board.svg', 'assets/icons/setting_menu.svg', 'assets/icons/setting_menu.svg',
    'assets/icons/setting_menu.svg',
  ];


  int selectedIndex = 0;
  void selectindex(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getid();
    print(widget.token);
    ApiService().getListForGame(userId: widget.id, token: widget.token);
  }
  Future<void> getid() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() async {
      userId= (await prefs.getString('userId'))!;
    });
  // print(token);
    print(userId);
  }
  _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      print('Could not launch $launchUri');
    }
  }
  whatsapp() async{
    var contact = "+880123232333";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("WhatsApp is not installed on the device"),
          ),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
            width: 260,
          //backgroundColor: Colors.cyan,
          elevation: 20,
          backgroundColor: Colors.white,
          semanticLabel: 'hellooo',
          shape: RoundedRectangleBorder(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        // color: Colors.lightBlueAccent,
                          height: 60.sp,
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/icons/logo_App_bar.svg'),
                              SizedBox(width: 15.sp,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bhau777',style: AppStyle.appBarTitleStyle(color: AppColor.blackClrMenuText,fontSize: 15.sp,fontWeight:  FontWeight.w600
                                  ),),
                                  Text('+91987654321223',style: AppStyle.appBarTitleStyle(color: AppColor.mobiletextMenu,fontSize: 12.sp,fontWeight:  FontWeight.w500
                                  ),),
                                ],),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],)
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return   ListTile(
                        selectedColor: Colors.white,
                        selectedTileColor: AppColor.bgClr,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.sp)),
                        title: Text('${mylist[index]}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp, color: selectedIndex == index ? Colors.white : Color(0xff535763)),),
                        leading:  SvgPicture.asset(imgs[index], color: selectedIndex == index ? Colors.white : Color(0xff535763),),
                        selected: selectedIndex == index,
                        onTap: (){
                          selectindex(index);
                          if(mylist[index] == 'Home'){
                            Navigator.pop(context);
                          } else if(mylist[index] == 'Funds'){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FundScreen(leftIcon: true,),));
                          }else if(mylist[index] == 'Passbook'){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PassbookScreen(),));
                          }else{
                            Navigator.pop(context);
                          }
                          // Navigator.pop(context);
                        },
                      );
                    },
                    itemCount: mylist.length,
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          toolbarHeight: 170.sp, // Set this height
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: AppColor.bgClr,
              image: DecorationImage(image: AssetImage('assets/images/appbarbg.png'),alignment: Alignment.topLeft),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.sp),
                bottomLeft: Radius.circular(15.sp),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    toolbarHeight: 10.sp,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: 25.sp,height: 25.sp,
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            'assets/images/menuIcon.svg',
                          ),
                        ),
                        onTap: (){
                          print('ontap');
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      SvgPicture.asset(
                        'assets/images/logo_login.svg',
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/images/wallet.svg',
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      SvgPicture.asset(
                        'assets/images/bellIcon.svg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Container(
                      height: 45.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          23.sp,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (widget.token != null && widget.id != null) {
                                  debugPrint("Token: ${widget.token}");
                                  debugPrint("ID: ${widget.id}");
                                  print('Tapped on Starline');

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => StarlineDashboardScreen(
                                        token: widget.token,
                                        id: widget.id,
                                      ),
                                    ),
                                  );
                                } else {
                                  // Handle the case where token or id is null, for example:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Invalid Token or ID')),
                                  );
                                }
                              },
                            //   onTap: () {
                            //     debugPrint(widget.token);
                            //     debugPrint(widget.id);
                            // print('tap on starline');
                            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => StarlineDashboardScreen(token: widget.token,id: widget.id,),));
                            //   },
                              child: Container(
                                margin: EdgeInsets.only(left: 2.sp),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Text(
                                    'Shree Starline',
                                    style: AppStyle.appBarTitleStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: AppColor.bgClr,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                debugPrint(widget.token);
                                debugPrint(widget.id);
                                print('jackpot navigate');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => JackpotDashboardScreen(id: widget.id, token: widget.token,),));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 2.sp),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Text(
                                    'Shree Jackpot',
                                    style: AppStyle.appBarTitleStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.sp),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/wtspIcon.png'),
                              ),
                              SizedBox(
                                width: 2.sp,
                              ),
                              Text(
                                '+919540567567',
                                style: AppStyle.textfdTextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    size: 14),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          whatsapp();
                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.sp),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/phoneIcon.png'),
                              ),
                              SizedBox(
                                width: 2.sp,
                              ),
                              Text('+919540567567',
                                style: AppStyle.textfdTextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500, size: 14),)
                            ],
                          ),
                        ),
    onTap: () {
      _makePhoneCall('+919876543210');
    },),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder(
          future: ApiService().getListForGame(
              userId: widget.id,
              token:widget.token),
          builder: (context, snapshot) {
            var data = snapshot.data?.data;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20.sp,
                        right: 20.sp,
                        left: 20.sp,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26.withOpacity(0.2),
                                blurRadius: 8),
                          ],
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/allgameCardSideIcon.png',
                              ),
                              alignment: Alignment.topLeft)),
                      child: Stack(

                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        data?[index].providerName ?? 'Sharda',
                                        style: AppStyle.appBarTitleStyle(
                                          color: AppColor.gameTItleclr,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        data?[index].providerResult ?? '123-56-600',
                                        style: AppStyle.appBarTitleStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        data?[index].displayText ?? 'Batting is running for open',
                                        style: AppStyle.blackClrtxtSyle(
                                          //color: (data?[index].displayText)?.contains(substring) == true ? AppColor.redShadeClr : AppColor.bgClr ,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                           color: data?[index].isClosed == true ? AppColor.redShadeClr :  AppColor.bgClr
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'assets/images/dotImg.png')),
                                          Text(
                                            ' Open Bide : ',
                                            style: AppStyle.blackClrtxtSyle(
                                              color: AppColor.gameTimeClr,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            data?[index].openBidTime ?? '09:00 AM',
                                            style: AppStyle.blackClrtxtSyle(
                                              color: AppColor.gameTimeClr,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(width: 20.sp),
                                          Image(
                                              image: AssetImage(
                                                  'assets/images/dotImg.png')),
                                          Text(
                                            ' Close Bide : ',
                                            style: AppStyle.blackClrtxtSyle(
                                              color: AppColor.gameTimeClr,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            data?[index].closeBidTime ??  '10:00 AM',
                                            style: AppStyle.blackClrtxtSyle(
                                              color: AppColor.gameTimeClr,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              print('tapp on dialog');
                            },
                            child: SizedBox(
                              height: 30.sp,width: 30.sp,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5.sp, left: 5.sp),
                                  child: SvgPicture.asset('assets/images/vertor1.svg',),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child:
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 10.sp,
                                  top: 32
                                      .sp), // Adjust the right padding as needed
                              child: Container(
                                height: 50.sp,
                                width: 50.sp,
                                decoration: BoxDecoration(
                                  color: AppColor.bgClr,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/playIconWhiteRight.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllGameScreen(id: widget.id, token: widget.token,gametype: "MainGame",) ));
                    },
                  );
                },
                itemCount: data?.length,
              ),
            );
          },
        ));
  }

  Widget appbarWidget({
    String? title,
    required BuildContext context,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height /
          3.5, // Height is dynamic based on screen size
      decoration: BoxDecoration(
        color: AppColor.bgClr,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.sp),
          bottomLeft: Radius.circular(15.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 10.sp,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/menuIcon.svg',
                ),
                SizedBox(
                  width: 10.sp,
                ),
                SvgPicture.asset(
                  'assets/images/logo_login.svg',
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/images/wallet.svg',
                ),
                SizedBox(
                  width: 10.sp,
                ),
                SvgPicture.asset(
                  'assets/images/bellIcon.svg',
                ),
              ],
            ),
            SizedBox(height: 30.sp),
            Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/leftErrowIcon.svg',
                ),
                SizedBox(
                  width: 20.sp,
                ),
                Text(
                  title ?? 'SRIDEVI OPEN GAME',
                  style: AppStyle.appBarTitleStyle(
                      fontSize: 19.sp,
                      fontWeight:
                          FontWeight.w700), // Dynamically adjust font size
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
