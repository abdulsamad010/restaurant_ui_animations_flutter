import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_ui_animations_flutter/core/bloc/bloc.dart';
import 'package:restaurant_ui_animations_flutter/core/bloc/state.dart';
import 'package:restaurant_ui_animations_flutter/main.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_ui_animations_flutter/screens/home_screen.dart';
import '../core/widgets/cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin{


  late AnimationController con;

  @override
  void initState() {
    super.initState();

    con=AnimationController(vsync: this,
    duration: Duration(seconds: 3)
    );

    con.forward();


  }

  @override
  void dispose() {
    con.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warmBackground,
      body: BlocBuilder<BlocFile,BlocState>(
        builder:(context,state)=> SafeArea(child: Padding(
          padding: EdgeInsets.fromLTRB(16.w,0,16.w,8.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon:Icon(Icons.arrow_circle_left_outlined,color: secondaryText,)),

                        Text("Your Cart",style: TextStyle(fontStyle: FontStyle.italic,color:darkText,fontWeight: FontWeight.bold,fontSize: 25.sp),),

                        SizedBox(height: 4.h,),

                        Text("${state.count} items",style: TextStyle(color:primaryRed,fontWeight: FontWeight.bold,fontSize: 13.sp),),
                      ],
                    ),
                    
                    
                    Column(
                      children: [
                        
                        Center(child: Lottie.asset("assets/animations/shopping_cart.json",height: 130.h))
                        
                      ],
                    )
                    
                    
                  ],
                ),
            

                SizedBox(height: 16.h,),



                state.cart.length!=0 ?
                SizeTransition(
                  axis: Axis.horizontal,
                  axisAlignment: BorderSide.strokeAlignInside,
                  sizeFactor: con,
                  child: ListView.builder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.cart.length,
                      itemBuilder: (context,index){


                        final item = state.cart[index];

                        if(item==null){
                          return SizedBox();
                        }

                        if (item != null){

                        return Padding(
                          padding: EdgeInsets.only(bottom:12.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(color: Color(0xFFE8EAED) )
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.white,
                              child: InkWell(

                                borderRadius: BorderRadius.circular(25.r),
                                onTap: (){

                                },
                                child:CartCard(index:index,raiting: state.cart![index]["category"]["rating"],
                                    price: state.cart[index]["category"]["price"],
                                    imgUrl: state.cart[index]["category"]["imgUrl"],
                                    title: state.cart[index]["category"]["title"],
                                    description: state.cart[index]["category"]["description"],),

                              ),
                            ),
                          ),
                        );}

                      }),
                ) : Center(
                  child:Text("No Item Added",style: TextStyle(color:secondaryText,fontWeight: FontWeight.bold,fontSize: 15.sp),),

                ),
            



            
              ],
            ),
          ),
        )),
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 400,
        child: FloatingActionButton(
          backgroundColor: primaryRed,onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                backgroundColor: warmBackground,
                title: Center(
                  child: Text("Transaction Successfully",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold
                  ),),
                ),

                content: Lottie.asset("assets/animations/shopping_bag.json"),

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
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => true,);}, child: Text("Go To Home", style: TextStyle(
                          color: Colors.white
                        ),)),
                      ),
                    ],
                  )
                ],
              );
            });
        },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Check Out",style: TextStyle(color: Colors.white),),
                SizedBox(width: 4.w,),
                Icon(Icons.shopping_cart,color: Colors.white,)
              ],
            ),),
      ),

    );
  }
}
