import 'package:flutter/material.dart';

class WishListViewModel with ChangeNotifier {
  final List<int> _selectedFav = [];

  List<int> get selectedFav => _selectedFav;

  void addItem(int value) {
    _selectedFav.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedFav.remove(value);
    notifyListeners();
  }
}
