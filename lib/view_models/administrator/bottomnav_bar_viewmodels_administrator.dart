import 'package:flutter/material.dart';

class AdministratorBottomNavBarViewModel extends ChangeNotifier{
  int currectIndex = 0;
  int get getCurrentIndex => currectIndex;
  set setCurrectIndex(int value){
    currectIndex = value;
    notifyListeners();
  }
}