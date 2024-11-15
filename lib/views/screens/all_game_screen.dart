import 'package:bhau_777/data/models/cart_list_model.dart';
import 'package:bhau_777/data/repositories/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/app_color.dart';
import '../../config/app_style.dart';

class AllGameScreen extends StatefulWidget {
  final id;
  final token;
  final gametype;
   AllGameScreen({super.key,required this.id,required this.token, this.gametype});

  @override
  State<AllGameScreen> createState() => _AllGameScreenState();
}
class _AllGameScreenState extends State<AllGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         appbarWidget(context: context,),
        SizedBox(height: 30.sp,),
        FutureBuilder<CardListModel?>(
          future: ApiService().CardList(userId: widget.id, gameType: widget.gametype, token: widget.token),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data available'));
            }
            return  Padding(
              padding: EdgeInsets.only(top: 120.sp,).copyWith(left: 15.sp,right: 15.sp),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4/3.9,mainAxisSpacing: 20.sp,crossAxisSpacing: 20.sp),
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
                        padding:  EdgeInsets.symmetric(horizontal:  15.sp).copyWith(bottom: 10.sp,top: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            snapshot.data?.data!.card![index].cardImage != null ? Image(image: NetworkImage(snapshot.data?.data!.card![index].cardImage ?? 'https://bhaubuckettest.s3.eu-north-1.amazonaws.com/cardImage/cardImage_1727786097905_Screenshot%20%28101%29.png')) : SizedBox(height: 80.sp,),
                            SizedBox(height: 10.sp,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.sp),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 4,)
                                  ]),
                              child:  Text(
                             snapshot.data?.data!.card?[index].cardName ?? 'test'
                               // "${allGmData[index].gameName}"
                                ,softWrap: true,
                                textAlign: TextAlign.center,
                                style: AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontWeight: FontWeight.w600,fontSize: 12.sp
                                ),
                              ),
                              /*     child: ElevatedButton(
                                style: ButtonStyle(
                                  textStyle: WidgetStatePropertyAll(

                                 AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontWeight: FontWeight.w600,fontSize: 13.sp,
                                  ),),
                                  alignment: Alignment.center,
                                  backgroundColor: WidgetStateProperty.all(Colors.white),
                                  elevation: WidgetStateProperty.all(3),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.sp),),
                                    ),
                                  ),
                                ),
                                onPressed:() {

                                },
                                child: Text(
                                  "${allGmData[index].gameName}",softWrap: true,
                                  // textAlign: TextAlign.center,maxLines: 1,softWrap: true,
                                  // style: AppStyle.appBarTitleStyle(color: AppColor.bgClr,fontWeight: FontWeight.w600,fontSize: 9.sp
                                  // ),
                                ),
                              ),*/
                            ),
                          ],
                        ),
                      ),
                      // ),
                    ),
                    Align(
                      child: Image(image: AssetImage('assets/images/Rectangle.png')),

                      alignment: Alignment.bottomCenter,
                    )                  ],);

                },
                itemCount: snapshot.data?.data?.card?.length,
              ),
            );
          },


        )
      ],),


    );
  }

/*  Widget bottomNavigationBarItem(
      {required String title,
        BoxDecoration? boxDecoration,
        IconData? icon,
        double? height,
        MainAxisAlignment? mainaxisalign}) {
    return InkWell(
      onTap: () {
        print('selected');
      },
      child: Container(
        margin: EdgeInsets.all(2),
        height: height == null ? 65.0 : height,
        width: (MediaQuery.of(context).size.width / 5) - 4,
        alignment: Alignment.center,
        decoration: boxDecoration == null
            ? BoxDecoration(
            color: Colors.grey[350],
            shape: BoxShape.rectangle,
            border: Border.all(
                width: 2, color: Colors.black, style: BorderStyle.solid)) : boxDecoration, child: Column(
        mainAxisAlignment:
        mainaxisalign == null ? MainAxisAlignment.start : mainaxisalign,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Text(
            '$title',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      ),
    );
  }*/
   Widget appbarWidget({
    String? title,
    required BuildContext context,

  }) {
    return Container(
      height: MediaQuery.of(context).size.height /3.8, // Height is dynamic based on screen size
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/appbarbg.png'),alignment: Alignment.topLeft),
        color: AppColor.bgClr,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.sp),
          bottomLeft: Radius.circular(15.sp),
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
        toolbarHeight: 10.sp,
            ),
            SizedBox(height: 30.sp),
            Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
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
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(userId: userId, token: token),));
                  },
                ),
                SizedBox(width: 20.sp,),
                Text(
                  title ?? 'SRIDEVI OPEN GAME',
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
    );
  }
}
