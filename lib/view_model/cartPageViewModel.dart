import 'package:flutter/material.dart';

class CartPageViewModel with ChangeNotifier {
  final List<int> _selected = [];

  List<int> get selected => _selected;

  void addItem(int value) {
    _selected.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selected.remove(value);
    notifyListeners();
  }
}
