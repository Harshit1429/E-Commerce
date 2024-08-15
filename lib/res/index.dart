import 'package:flutter/material.dart';

class Index with ChangeNotifier {

  static  int _productIndex = 0 ;

 static int get productIndex => _productIndex ;

  updateIndex(int value){
    _productIndex = value ;
    notifyListeners();
  }

}

