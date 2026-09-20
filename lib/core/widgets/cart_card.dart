import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_ui_animations_flutter/core/bloc/bloc.dart';

import '../../main.dart';
import '../bloc/event.dart';

class CartCard extends StatelessWidget {
  String imgUrl,title ,description;
  double raiting;
  int price;
  int index;
  CartCard({super.key,required this.index,required this.raiting,required this.price, required this.imgUrl,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomLeft: Radius.circular(20.r)),
            child: Image.network("$imgUrl",height: 175.h,width: 100.w,fit: BoxFit.cover,)),


        Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 18.sp),),

              Text("$description",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 7.sp),),






                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(8.w,0,8.w,0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE5E5),
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(15.r)
                            ),
                            child: Text("Qty:1",textAlign: TextAlign.center,style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,fontSize: 10.sp),)),


                        SizedBox(width: 4.w,),

                        Container(
                            padding: EdgeInsets.fromLTRB(8.w,0,8.w,0),
                            decoration: BoxDecoration(
                                color: Color(0xFFE8F5E9),
                                border: Border.all(color:successGreen),
                                borderRadius: BorderRadius.circular(15.r)
                            ),
                            child: Text("Fresh & Tasty",textAlign: TextAlign.center,style: TextStyle(color:successGreen,fontWeight: FontWeight.bold,fontSize: 10.sp),)),


                        SizedBox(width: 55.w,),

                        IconButton(onPressed: (){



                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: warmBackground,
                              title: Center(
                                child: Text("Are you sure to Delete?",style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),

                              content: Lottie.asset("assets/animations/shopping_cart.json"),

                              actionsAlignment: MainAxisAlignment.spaceBetween,

                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:Colors.white
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);}, child: Text("No", style: TextStyle(
                                    color: Colors.black
                                ),)),



                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryRed
                                    ),
                                    onPressed: (){
                                      context.read<BlocFile>().add(DeleteItem(index));
                                      Navigator.pop(context);

                                    }, child: Text("Yes", style: TextStyle(
                                    color: Colors.white
                                ),))

                              ],
                            );
                          });




                        }, icon: Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: Color(0xFFFFE5E5)
                            ),
                            child: Icon(Icons.delete,color:primaryRed,size: 35,)),),


                      ],
                    ),




              Row(
                children: [

                  Icon(Icons.currency_rupee,color:primaryRed,),
                  Text("$price",textAlign: TextAlign.center,style: TextStyle(color:primaryRed,fontWeight: FontWeight.bold,fontSize: 15.sp),),


                ],
                          ),





            ],
          ),
        ),






      ],
    );
  }
}

