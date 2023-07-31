import 'package:flutter/material.dart';


class NumberListProvider with ChangeNotifier{
  //  (1)  Increment
  List<int> numbers = [1,2,3,4];

  void add() {
    int last = numbers.last;
    numbers.add(last+1);
    notifyListeners();
  }

  // (2)  Container Opacity Changing
   double opacityValue = 0.5;
  void setValue(double val) {
    opacityValue = val;
    notifyListeners();
  }

  // Favourites logics
  List shopping = ["iphone","samsung","motorboat", "benz", "MI", "itel", "grandy"];
  List favourites = [];
   addToFavourite(index){
     favourites.add(index);
     print(favourites);
     notifyListeners();
   }
  removeToFavourite(index){
    favourites.remove(index);
    notifyListeners();
  }
  removeToFavouriteAtIndex(index){
    favourites.removeAt(index);
    notifyListeners();
  }

  // dark and light theme
  bool iconBool = true;
  changeMode () {
    iconBool = !iconBool;
    notifyListeners();
    print(iconBool);
  }



}