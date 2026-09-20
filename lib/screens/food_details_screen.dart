import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_ui_animations_flutter/core/bloc/event.dart';

import '../core/bloc/bloc.dart';
import '../core/bloc/state.dart';
import '../main.dart';

class FoodDetailsScreen extends StatefulWidget {
  final raiting,price,imgUrl,title,description,index,category;
  FoodDetailsScreen({super.key,required this.raiting,required this.price,required this.imgUrl,required this.title,required this.description,required this.index,required this.category});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> with TickerProviderStateMixin{

  late AnimationController con1;
  late AnimationController con2;

  @override
  void initState() {
    super.initState();

    con1=AnimationController(vsync: this,
    duration: Duration(seconds: 2),
    );

    con1.forward();


    con2=AnimationController(vsync: this,
      duration: Duration(seconds: 2),
    );

    con2.repeat();



  }

  @override
  void dispose() {
    con1.dispose();
    con2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocFile,BlocState>(
        builder:(context,state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Hero(

                      tag: "img_${widget.index}",
                      child: FadeTransition(
                          opacity: con1,
                          child: Image.network("${widget.imgUrl}",height: 300,width: double.infinity,fit: BoxFit.cover,))),

                  Padding(
                    padding:EdgeInsets.all(8.w),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_circle_left,color: Colors.white,size: 30.sp,)),
                  ),



                  Column(
                    children: [

                      SizedBox(height: 295.h,),

                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(55.r),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("${widget.title}",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 35.sp),),

                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                Icon(Icons.star,color:ratingGold,),
                                SizedBox(width: 2.w,),
                                Text("${widget.raiting}",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                                Expanded(child: SizedBox()),
                                Icon(Icons.currency_rupee,color:primaryRed,),
                                Text("${widget.price}",textAlign: TextAlign.center,style: TextStyle(color:primaryRed,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                                Expanded(child: SizedBox()),

                                ClipOval(
                                  child: Container(
                                    padding: EdgeInsets.all(8.r),
                                    color:primaryRed,
                                    child:Icon(Icons.fastfood_sharp,color:Colors.white,),
                                  ),),

                              ],
                            ),


                          SizedBox(height: 8.h,),

                            Text("${widget.description}",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 20.sp),),

                            SizedBox(height: 16.h,),
                            Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Size",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                                  SizedBox(height: 8.h,),

                                  Container(

                                    padding: EdgeInsets.fromLTRB(16.w,8.w,16.w,8.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.r),
                                        border: Border.all(color: primaryRed)
                                    ),

                                    child: Text("Regular",style: TextStyle(color: primaryRed,fontWeight: FontWeight.bold),),
                                  ),


                                ],
                              ),


                              Expanded(child: SizedBox()),

                              ScaleTransition(
                                    scale: con2,
                                    child: Row(
                                      children: [
                                        Text("30%\nOFF",style: TextStyle(
                                          color: primaryRed,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.sp
                                        ),),

                                        SizedBox(width: 16,),
                                        Icon(Icons.discount,color: primaryRed,size: 35.sp,),


                                      ],
                                    )),


                            ],
                          ),





                            SizedBox(height: 50),

                           SizedBox(
                                width: double.infinity,
                                child: BlocBuilder<BlocFile,BlocState>(

                                  builder: (context,state)=> ElevatedButton(onPressed: (){

                                    context.read<BlocFile>().add(AddCart(
                                      widget.index,widget.category
                                    ));


                                    print("${state.cart}");

                                  },
                                      style: ElevatedButton.styleFrom(backgroundColor: primaryRed,
                                      ),
                                      child: Text("Add to Cart",style: TextStyle(color: Colors.white),)
                                    ),
                              ),
                           )])
                      ),
                      )]
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
