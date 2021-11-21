import 'package:flutter/material.dart';

class Item with ChangeNotifier {
  Item(
      {this.retailer = '',
      this.brandNDmodel = '',
      this.isExpanded = false,
      this.isSelected = false,
      this.category = '',
      this.count = 1,
      this.price = 0,
      this.wattage = 0,
      this.cpusocket = '',
      this.ramtype = '',
      this.imgData = ''});
  int count;
  int price, wattage;
  String retailer;
  String brandNDmodel;
  String category;
  String imgData;
  String ramtype, cpusocket;
  bool isExpanded;
  bool isSelected;

  void setIsItemSelected() {
    this.isSelected = !this.isSelected;
    notifyListeners();
  }
}
