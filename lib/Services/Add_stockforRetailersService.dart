import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';

class AddstockforRetailersService {
  final CollectionReference stockCollection =
      FirebaseFirestore.instance.collection('Stock');
  String uid = Sharedpref.getUserID();
  String storename = Sharedpref.getStoreName();

  Future addCPU(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      String cpusocket,
      int clockspeed,
      int corecount,
      int threadcount,
      String specs,
      String availability,
      int price) async {
//Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'CPU',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'cpusocket': '$cpusocket',
      'clockspeed': clockspeed,
      'corecount': corecount,
      'threadcount': threadcount,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addMotherboard(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      String cpusocket,
      String ramslot,
      String expansionslots,
      String specs,
      String availability,
      int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'Motherboard',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'cpusocket': '$cpusocket',
      'ramslot': '$ramslot',
      'expansionslots': '$expansionslots',
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addGPU(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      int memorysize,
      int clockspeed,
      String specs,
      String availability,
      int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'GPU',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'memorysize': memorysize,
      'clockspeed': clockspeed,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addRAM(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      String ramtype,
      int ramStrCapacity,
      int ramspeed,
      String specs,
      String availability,
      int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'RAM',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'ramtype': '$ramtype',
      'ramStrCapacity': ramStrCapacity,
      'ramspeed': ramspeed,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addStorage(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      String storagetype,
      String connector,
      int ramStrCapacity,
      String specs,
      String availability,
      int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'Storage',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'storagetype': '$storagetype',
      'connector': '$connector',
      'ramStrCapacity': ramStrCapacity,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addPSU(String userID, String brand, String model, int powerOut,
      String imageURL, String specs, String availability, int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'PSU',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': powerOut,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addCasing(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      String casesize,
      int numOfFans,
      String specs,
      String availability,
      int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'Casing',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'case_size': '$casesize',
      'numOfFans': numOfFans,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }

  Future addCooling(
      String userID,
      String brand,
      String model,
      int wattage,
      String imageURL,
      String coolingtype,
      int fanRpm,
      int airflow,
      String specs,
      String availability,
      int price) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());

    await stockCollection.doc().set({
      'category': 'Cooling',
      'brand': '$brand',
      'model': '$model',
      'imageURL': '$imageURL',
      'wattage': wattage,
      'coolingtype': '$coolingtype',
      'fanRpm': fanRpm,
      'airflow': airflow,
      'specs': '$specs',
      'Availability': '$availability',
      'price': price,
      'UID': uid,
      'StoreName': storename,
      'TimeStamp': timestamp
    }).catchError((error) => {print('failed to add data')});
  }
}
