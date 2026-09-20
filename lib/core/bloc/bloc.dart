

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_ui_animations_flutter/core/bloc/state.dart';
import 'package:restaurant_ui_animations_flutter/main.dart';

import 'event.dart';

class BlocFile extends Bloc<Event,BlocState>{
  BlocFile():super(BlocState(item: "Burgers", selectedCategory: 0, colorVar:[
    primaryRed,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ], opicity: 0.0)){

    on<UpdateCategory>((event, emit) {

      final item;
      if(event.selectedCategory==0){
        item="Burgers";
      }
      else if(event.selectedCategory==1){
        item="Pizza";
      }
      else if(event.selectedCategory==2){
        item="Pasta";
      }
      else if(event.selectedCategory==3){
        item="Drinks";
      }
      else if(event.selectedCategory==4){
        item="Desserts";
      }
      else{
        item="Snacks";
      }

      final colorVar2=event.colorVar;
      colorVar2[event.selectedCategory]=primaryRed;


      emit(BlocState(count: state.count,opicity: 1.0,item: item, selectedCategory: event.selectedCategory, colorVar: colorVar2,cart: state.cart));
    });




    on<AddCart>((event, emit) {
      var fC= Map.from(state.cart);
      fC[fC.length] = {
        "index": event.index,
        "category": event.category[event.index],
      };

      int count1=0;
      for(int i=0; i<fC.length; i++){
        if(fC[i]!=null){
          count1++;
        }
      }

      emit(BlocState(count: count1,opicity: 1.0,item: state.item, selectedCategory: state.selectedCategory, colorVar: state.colorVar,cart: fC));
    });



    on<DeleteItem>((event, emit) {
      var fC= Map.from(state.cart);
      fC[event.index]=null;
      int count1=0;
      for(int i=0; i<fC.length; i++){
        if(fC[i]!=null){
          count1++;
        }
      }

      emit(BlocState(count:count1, opicity: 1.0,item: state.item, selectedCategory: state.selectedCategory, colorVar: state.colorVar,cart: fC));
    });


    on<ChangeOpicity>((event, emit) {
      emit(BlocState(count: state.count,item: state.item, selectedCategory: state.selectedCategory, colorVar: state.colorVar,cart: state.cart,opicity:1.0));
    });



    on<ChangeHover>((event, emit) {
      emit(BlocState(count: state.count,hoverIndex: event.index,item: state.item, selectedCategory: state.selectedCategory, colorVar: state.colorVar,cart: state.cart,opicity:1.0));
    });




  }
}