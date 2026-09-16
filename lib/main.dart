import 'package:flutter/material.dart';
import 'package:restaurant_ui_animations_flutter/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


const Color primaryRed = Color(0xFFD62828);
const Color accentOrange = Color(0xFFF77F00);
const Color warmBackground = Color(0xFFFFF8F0);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}