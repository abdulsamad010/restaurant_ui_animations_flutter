import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_ui_animations_flutter/main.dart';


class FoodCard extends StatelessWidget {
  String imgUrl,title ,description;
  double raiting;
  int price,index;
  FoodCard({super.key,required this.index,required this.raiting,required this.price, required this.imgUrl,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
                child: Hero(
                    flightShuttleBuilder: (flightContext, animation, direction,
                        fromContext, toContext) {
                      return FadeTransition(
                        opacity: animation,
                        child: toContext.widget,
                      );
                    },

                    tag: "img_${index}",
                    child: Image.network("$imgUrl",height: 140.h,width: 200.w,fit: BoxFit.cover,))),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                      color:warmBackground,
                    child:Icon(Icons.favorite,color:primaryRed,),
                  ),
                ),
              ),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("$title",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 10.sp),),
              SizedBox(height: 2.h,),
              Text("$description",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 7.sp),),

              SizedBox(height: 2.h,),
              Row(
                children: [
                  Icon(Icons.star,color:ratingGold,),
                  SizedBox(width: 2.w,),
                  Text("$raiting",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                  Expanded(child: SizedBox()),
                  Icon(Icons.currency_rupee,color:primaryRed,),
                  Text("$price",textAlign: TextAlign.center,style: TextStyle(color:primaryRed,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                  Expanded(child: SizedBox()),

                  ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      color:primaryRed,
                      child:Icon(Icons.fastfood_sharp,color:Colors.white,),
                    ),),
                ],
              )

            ],
          ),
        )

      ],
    );
  }
}
