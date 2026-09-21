import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'home_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();


}

class _AboutScreenState extends State<AboutScreen> with TickerProviderStateMixin{

  late AnimationController con1;
  late AnimationController con2;
  late AnimationController con3;

  @override
  void initState() {
    super.initState();

    con1=AnimationController(vsync: this,
    duration: Duration(seconds: 5)
    );

    con1.repeat();


    con2=AnimationController(vsync: this,
        duration: Duration(seconds: 5)
    );

    con2.forward();


    con3=AnimationController(vsync: this,
        duration: Duration(milliseconds:1500)
    );

    con3.repeat();


  }

  @override
  void dispose() {
    con1.dispose();
    con2.dispose();
    con3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: warmBackground,
        appBar: AppBar(backgroundColor: warmBackground,leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_circle_left_outlined,color: secondaryText,)),
          actions: [
            Padding(
              padding:EdgeInsets.all(12.w),
              child: ScaleTransition(

                scale: Tween<double>(
                  end: 1,
                  begin: 0.70
                ).animate(con3),
                child: IconButton(onPressed: (){


                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      backgroundColor: warmBackground,
                      title: Center(
                        child: Text("Are You Sure To Logout?",style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                      ),

                      content: Icon(Icons.logout,color: primaryRed,size: 200.sp,),

                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryRed
                                  ),
                                  onPressed: (){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => true,);}, child: Text("Yes", style: TextStyle(
                                  color: Colors.white
                              ),)),
                            ),
                          ],
                        )
                      ],
                    );
                  });


                },
                
                  icon: Icon(Icons.logout,color: primaryRed,size: 35.sp,),
                  
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w,0,16.w,8.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Stack(children:[

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("About App",style: TextStyle(fontStyle: FontStyle.italic,color:darkText,fontWeight: FontWeight.bold,fontSize: 25.sp),),

                      SizedBox(height: 16.h,),


                      Center(
                        child: FadeTransition(
                          opacity: Tween(
                            begin: 0.1,
                            end: 1.0
                          ).animate(con2),

                          child: Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.r),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h,),

                    ],
                  ),



                  Center(child: Lottie.asset("assets/animations/celebrate.json",width: double.infinity,height: 195.h)),


                ]),

                SizeTransition(
                  axisAlignment: BorderSide.strokeAlignInside,
                    sizeFactor: con2,
                    child: Text("Savoria is a modern food ordering application built with Flutter, designed to deliver a delightful and seamless food exploration experience.\n\nOur goal is to bring great food closer to you with a beautiful interface, smooth animations, and a focus on user experience.",textAlign: TextAlign.justify,style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 12.sp),)),

                SizedBox(height: 32.h,),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [

                            ScaleTransition(
                                scale: con1,
                                child: Icon(Icons.favorite,color: primaryRed,size: 35.sp,)),

                            SizedBox(width: 16.w,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Quality Food",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                                SizedBox(height: 8.h,),

                                Text("Fresh ingredients, great taste.",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),

                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 16.h,),


                        Row(
                          children: [

                           ScaleTransition(
                             scale: con1,
                                child: Icon(Icons.person,color: primaryRed,size: 35.sp,)),

                            SizedBox(width: 16.w,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer First",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                                SizedBox(height: 8.h,),

                                Text("Your satisfaction is our priority.",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),

                              ],
                            ),

                          ],
                        ),

                        SizedBox(height: 16.h,),


                        Row(
                          children: [

                            ScaleTransition(
                                scale: con1,
                                child: Icon(Icons.energy_savings_leaf,color: primaryRed,size: 35.sp,)),


                            SizedBox(width: 16.w,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Better Everyday",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                                SizedBox(height: 8.h,),

                                Text("Good food, brighter days.",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),

                              ],
                            ),

                          ],
                        ),

                      ],
                    ),

                    SizedBox(width: 10.w,),

                    Lottie.asset("assets/animations/favorite.json",width: 120.w)

                  ],
                ),


                SizedBox(height: 75.h,),

                Center(child: Text("Version 1.0.0",style: TextStyle(color:secondaryText,fontSize: 13.sp),)),


              ],
            ),
          ),
        ),





    );
  }
}
