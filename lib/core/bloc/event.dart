import 'dart:ui';

abstract class Event{

}

class UpdateCategory extends Event{
  var selectedCategory=0;
  List<Color> colorVar=[];

  UpdateCategory({required this.selectedCategory,required this.colorVar});
}

class AddCart extends Event{
  final index,category;
  AddCart(this.index,this.category);
}

class ChangeOpicity extends Event{
  ChangeOpicity();
}



class DeleteItem extends Event{
  final index;
  DeleteItem(this.index);
}


class ChangeHover extends Event{
  final index;
  ChangeHover({this.index});
}

