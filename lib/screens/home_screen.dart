import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_ui_animations_flutter/core/bloc/state.dart';
import 'package:restaurant_ui_animations_flutter/core/data/data.dart';
import 'package:restaurant_ui_animations_flutter/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/bloc/bloc.dart';
import '../core/bloc/event.dart';
import '../core/widgets/food_card.dart';
import 'about_screen.dart';
import 'cart_screen.dart';
import 'food_details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController con1;

  void changeOpicity() async{
    await Future.delayed(Duration(milliseconds: 200));
    context.read<BlocFile>().add(ChangeOpicity());
  }

  @override
  void initState() {
    super.initState();
    changeOpicity();

    con1=AnimationController(vsync: this,
        duration: Duration(seconds: 5)
    );

    con1.repeat();
  }


  @override
  void dispose() {
    con1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.only(bottomRight: Radius.circular(45.r),bottomLeft: Radius.circular(45.r))),
        leading: Icon(Icons.fastfood,color: primaryRed,),
        backgroundColor: warmBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(child: Text("Savoria",textAlign: TextAlign.start,style: TextStyle(
              color: darkText,fontWeight: FontWeight.bold,fontSize: 25.sp,
              fontStyle: FontStyle.italic
            ),)),


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
      body: BlocBuilder<BlocFile,BlocState>(
        builder:(context,state){
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Good Morning",style: TextStyle(color: secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                          SizedBox(height: 8.h,),
                          Text("Craving\nSomething Great?",style: TextStyle(fontStyle: FontStyle.italic,color: darkText,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                          SizedBox(height: 8.h,),
                          Text("Delicious food, delivered happiness",style: TextStyle(color: secondaryText,fontWeight: FontWeight.bold,fontSize: 10.sp),),

                        ],
                      ),


                      Lottie.asset(
                      "assets/animations/waving_hand.json",height: 95.w),



                    ],
                  ),

                  SizedBox(height: 16.h,),

                  Row(
                    children: [
                      Expanded(
                        child: Container(

                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),

                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFFE8EAED),
                                    blurRadius: 1
                                )
                              ]
                          ),

                          child: Row(
                            children: [
                              SizedBox(width: 8.h,),
                              Icon(Icons.search,color: darkText,size: 15.sp,),
                              SizedBox(width: 8.h,),
                              SizeTransition(
                                axisAlignment: BorderSide.strokeAlignInside,
                                sizeFactor: con1,
                              axis: Axis.horizontal,
                              child: Text("Search for burgers, pizza, pasta...",style: TextStyle(color: secondaryText,fontSize: 10.sp),)),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 8.w,),

                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            color: warmBackground,
                            borderRadius: BorderRadius.circular(16.r),

                            boxShadow: [
                              BoxShadow(
                                  color: secondaryText,
                                  blurRadius: 1
                              )
                            ]
                        ),

                        child: Icon(Icons.list,color: secondaryText,size: 23.sp,),
                      )

                    ],
                  ),

                  SizedBox(height: 16.h,),

                  AnimatedOpacity(
                    duration: Duration(seconds: 3),
                    opacity:state.opicity,
                    curve: Curves.easeInOut,
                    child: Stack(
                      children:[
                        Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          gradient: LinearGradient(colors: [
                            primaryRed,Colors.red,lightRed
                          ],begin: Alignment.centerLeft,end: Alignment.bottomRight,),
                        ),
                        padding: EdgeInsets.fromLTRB(16.w,8.w,16.w,8.w),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Today's",style: TextStyle(color: Color(0xFFE8EAED),fontWeight: FontWeight.bold,fontSize: 15.sp),),
                                    SizedBox(width: 4.w,),
                                    Icon(Icons.offline_bolt,color: ratingGold,size: 15.sp,),

                                  ],
                                ),

                                SizedBox(height: 4.h,),
                                Text("Special",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                                SizedBox(height: 4.h,),
                                Text("Premium Burgers",style: TextStyle(color: Color(0xFFE8EAED),fontWeight: FontWeight.bold,fontSize: 15.sp),),

                                SizedBox(height: 8.h,),

                                Text("Up to 30% OFF",style: TextStyle(color:ratingGold,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                                SizedBox(height: 8.h,),
                                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.white),child: Text("Order Now",style: TextStyle(color: primaryRed),))

                              ],
                            ),

                            Expanded(child: ScaleTransition(
                                scale:con1,
                                child: Image.asset("assets/images/banner.png"))),
                          ],
                        ),
                      ),
                        
                        LottieBuilder.asset("assets/animations/celebrate.json",height: 220.h,width: 500.w,)
                        
                    ]),
                  ),


                  SizedBox(height: 16.h,),

                  SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 80.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,itemCount:state.categoryIcons.length,itemBuilder: (context,index){


                        return Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                          context.read<BlocFile>().add(
                            UpdateCategory(
                              selectedCategory: index,
                              colorVar: [
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                              ],
                            ),
                          );
                        },
                              child: AnimatedOpacity(
                                curve: Curves.easeInOutExpo,
                                duration: Duration(seconds: 2*index),
                                opacity: state.opicity,
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                      color: state.colorVar[index],
                                      borderRadius: BorderRadius.circular(16.r),

                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFFE8EAED),
                                            blurRadius: 1
                                        )
                                      ]
                                  ),

                                  child: Icon(size: 35.sp,state.categoryIcons[index],color: state.categoryColors[index],),
                                ),
                              ),
                            ),

                            SizedBox(width: 8.w,),
                          ],
                        );



                      })


                  ),


                  SizedBox(height: 16.h,),

                  Row(
                    children: [
                      Text("Popular Today",style: TextStyle(color:darkText,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                      SizedBox(width: 4.w,),

                      Icon(Icons.local_offer,color: ratingGold,size: 15.sp,),

                      Expanded(child: SizedBox()),


                      Text("All",style: TextStyle(color:primaryRed,fontWeight: FontWeight.bold,fontSize: 10.sp),),

                    ],
                  ),

                  SizedBox(height: 16.h,),

                  
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 15.h,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: foodData[state.item]!.length,
                      itemBuilder: (context,index){


                        final category=foodData[state.item];

                        return MouseRegion(
                          onEnter: (i){
                            context.read<BlocFile>().add(ChangeHover(index:index));
                          },
                          onExit: (i){
                            context.read<BlocFile>().add(ChangeHover(index:-1));
                          },
                          child: AnimatedScale(
                            duration: Duration(milliseconds: 500),
                            scale: state.hoverIndex==index ? 1.07: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                border: Border.all(color: Color(0xFFE8EAED))
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(25.r),
                                color: Colors.white,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25.r),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodDetailsScreen(
                                      raiting: (category![index]["rating"] ?? 0).toDouble(),
                                        price: category[index]["price"],
                                        imgUrl: category[index]["imgUrl"],
                                        title: category[index]["title"],
                                        description: category[index]["description"],
                                      index:index,
                                      category: category,
                                    )));
                                  },
                                  child: FoodCard(index: index,raiting: (category![index]["rating"] ?? 0).toDouble(),
                                    price: category[index]["price"],
                                    imgUrl: category[index]["imgUrl"],
                                    title: category[index]["title"],
                                    description: category[index]["description"],),
                                ),
                              ),
                            ),
                          ),
                        );

                      }),





                ],
              ),
            ),
          );
        },
      ),


      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ],

        backgroundColor: warmBackground,

        unselectedItemColor: secondaryText,

        selectedItemColor: primaryRed,

        onTap: (index){

          if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          }

          if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
          }

        },

      ),

    );
  }
}
