import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui_animations_flutter/main.dart';


class BlocState {

  final Map<dynamic,dynamic> cart;

  final opicity;

  final List<IconData> categoryIcons = [
    Icons.lunch_dining,
    Icons.local_pizza,
    Icons.ramen_dining,
    Icons.local_drink,
    Icons.cake,
    Icons.fastfood,
  ];

  final hoverIndex;

  final item;
  final selectedCategory;
  final colorVar;

  final List<Color> categoryColors=[
  Colors.blue,
  const Color(0xFFF77F00),
  const Color(0xFF2E7D32),
  const Color(0xFF4CAF50),
  Colors.yellowAccent,
  const Color(0xFFFFA000),
  ];

  final count;

  BlocState({this.count=0,this.hoverIndex=-1,this.item,this.selectedCategory,this.colorVar,this.cart=const {}, this.opicity=0.0});
}