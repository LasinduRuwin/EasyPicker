import 'package:flutter/cupertino.dart';
import 'package:project_pcbuildhelper/userScreens/item.dart';

class Cart with ChangeNotifier {
  List<Item> hardwareItems = [
    Item(
        brandNDmodel: '',
        category: 'CPU',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'Motherboard',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'GPU',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'RAM',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'Storage',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'PSU',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'Casing',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0),
    Item(
        brandNDmodel: '',
        category: 'Cooling',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0)
  ];

  double total = 0;
  int wattage = 0;

  void addToBuild({@required Item item, @required int index}) {
    hardwareItems[index] = item;
    // hardwareItems.insert(index, item);
    notifyListeners();
  }

  void removeFromBuild({@required index}) {
    hardwareItems[index] = Item(
        brandNDmodel: '',
        count: 1,
        cpusocket: '',
        imgData: '',
        isExpanded: false,
        isSelected: false,
        price: 0,
        ramtype: '',
        retailer: '',
        wattage: 0);
  }

  void addPricetoTotal(int price) {
    total += price;
    notifyListeners();
  }

  void deductPriceFromTotal(int price) {
    total -= price;
    notifyListeners();
  }

  void addWattToWattage(int watt) {
    wattage += watt;
    notifyListeners();
  }

  void deductWattFromWattage(int watt) {
    wattage -= watt;
    notifyListeners();
  }
}
