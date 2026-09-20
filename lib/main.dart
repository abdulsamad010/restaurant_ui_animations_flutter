import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_ui_animations_flutter/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc/bloc.dart';


const Color primaryRed = Color(0xFFC1121F);
const Color accentOrange = Color(0xFFF77F00);
const Color warmBackground = Color(0xFFF3F4F6);
const Color darkText = Color(0xFF2D2D2D);
const Color secondaryText = Color(0xFF777777);
const Color ratingGold = Color(0xFFFFB000);
const Color successGreen = Color(0xFF2E7D32);
const Color lightRed = Color(0xFFFCE8E6);
const Color lightOrange = Color(0xFFFFF3E8);
const Color lightGrey = Color(0xFFF5F5F5);
const Color dividerGrey = Color(0xFFEAEAEA);
const Color pureWhite = Colors.white;


void main() {

  runApp(

      ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context){
        return BlocFile();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}