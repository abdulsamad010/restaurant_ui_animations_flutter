import 'package:flutter/material.dart';
import 'package:restaurant_ui_animations_flutter/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: warmBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.location_on,color: primaryRed,),



            TextButton(onPressed: (){}, child: Text("Islamabad",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),



            Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),

            SizedBox(width: 4.w,),

            CircleAvatar(
              backgroundColor: lightRed,
              child: Icon(Icons.person,color: primaryRed,),
            )
          ],
        ),
      ),

      backgroundColor:warmBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Good Morning",style: TextStyle(color: secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                  Icon(Icons.waving_hand,color: ratingGold,size: 10.sp,),
                ],
              ),
              SizedBox(height: 8.h,),
              Text("Craving\nSomething Great?",style: TextStyle(color: darkText,fontWeight: FontWeight.bold,fontSize: 20.sp),),
              SizedBox(height: 8.h,),
              Text("Delicious food, delivered happiness",style: TextStyle(color: secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),

              SizedBox(height: 16.h,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),

                    boxShadow: [
                      BoxShadow(
                          color: secondaryText,
                          blurRadius: 1
                      )
                    ]
                ),

                child: Row(
                  children: [
                    SizedBox(width: 8.h,),
                    Icon(Icons.search,color: darkText,size: 15.sp,),
                    SizedBox(width: 8.h,),
                    Text("Search for burgers, pizza, pasta...",style: TextStyle(color: secondaryText,fontSize: 10.sp),),
                  ],
                ),
              ),

              SizedBox(height: 16.h,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  gradient: LinearGradient(colors: [
                    primaryRed,lightRed
                  ],begin: Alignment.centerLeft,end: Alignment.bottomRight,),
                ),
                padding: EdgeInsets.all(16.w),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Today's",style: TextStyle(color: secondaryText,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                            Icon(Icons.waving_hand,color: ratingGold,size: 15.sp,),

                          ],
                        ),

                        SizedBox(height: 8.h,),
                        Text("Special",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                        SizedBox(height: 8.h,),
                        Text("Premium Burgers",style: TextStyle(color: secondaryText,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                        SizedBox(height: 8.h,),

                        Text("Up to 30% OFF",style: TextStyle(color:ratingGold,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                        SizedBox(height: 8.h,),
                        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.white),child: Text("Order Now",style: TextStyle(color: primaryRed),))

                      ],
                    ),

                    Image.asset("assets/images/bannerIcon.png"),
                  ],
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
