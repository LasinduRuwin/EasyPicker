import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Add_components {
  final CollectionReference hardwareDataCollection =
      FirebaseFirestore.instance.collection('ComponentInfo');

  Future addCPU(
      File selectedImage,
      String brand,
      String model,
      int wattage,
      String cpu_socket,
      int clock_speed,
      int core_count,
      int thread_count,
      String specs) {
//Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'CPU',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'cpu_socket': '$cpu_socket',
                'clock_speed': clock_speed,
                'core_count': core_count,
                'thread_count': thread_count,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });

    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        cpu_socket +
        ' ' ' \n' +
        clock_speed.toString() +
        ' ' '\n ' +
        core_count.toString() +
        ' ' '\n ' +
        thread_count.toString() +
        ' \n' +
        specs);
  }

  Future addMotherboard(
      File selectedImage,
      String brand,
      String model,
      int wattage,
      String cpu_socket,
      String ram_slot,
      String expansion_slots,
      String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'Motherboard',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'cpu_socket': '$cpu_socket',
                'ram_slot': '$ram_slot',
                'expansion_slots': '$expansion_slots',
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });
    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        cpu_socket +
        ' ' ' \n' +
        ram_slot +
        ' ' '\n ' +
        expansion_slots.toString() +
        ' \n' +
        specs);
  }

  Future addGPU(File selectedImage, String brand, String model, int wattage,
      int memorysize, int clock_speed, String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'GPU',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'memorysize': memorysize,
                'clock_speed': clock_speed,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });
    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        memorysize.toString() +
        ' ' ' \n' +
        clock_speed.toString() +
        ' ' '\n ' +
        specs.toString());
  }

  Future addRAM(File selectedImage, String brand, String model, int wattage,
      String ram_type, int ram_str_capacity, int ram_speed, String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'RAM',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'ram_type': '$ram_type',
                'ram_str_capacity': ram_str_capacity,
                'ram_speed': ram_speed,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });

    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        ram_type +
        ' ' ' \n' +
        ram_str_capacity.toString() +
        ' ' '\n ' +
        ram_speed.toString() +
        ' \n' +
        specs);
  }

  Future addStorage(
      File selectedImage,
      String brand,
      String model,
      int wattage,
      String storage_type,
      String connector,
      int ram_str_capacity,
      String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'Storage',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'storage_type': '$storage_type',
                'connector': '$connector',
                'ram_str_capacity': ram_str_capacity,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });
    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        storage_type +
        ' ' ' \n' +
        connector.toString() +
        ' ' '\n ' +
        ram_str_capacity.toString() +
        ' \n' +
        specs);
  }

  Future addPSU(File selectedImage, String brand, String model, int power_out,
      String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'PSU',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': power_out,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });
    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        power_out.toString() +
        '\n' +
        specs);
  }

  Future addCasing(File selectedImage, String brand, String model, int wattage,
      String case_size, int num_of_fans, String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'Casing',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'case_size': '$case_size',
                'num_of_fans': num_of_fans,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });
    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        case_size +
        ' ' ' \n' +
        num_of_fans.toString() +
        ' \n' +
        specs);
  }

  Future addCooling(File selectedImage, String brand, String model, int wattage,
      String cooling_type, int fan_rpm, int airflow, String specs) {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$brand $model{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('ComponentImgs').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(selectedImage)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async => {
              await hardwareDataCollection.doc().set({
                'category': 'Cooling',
                'brand': '$brand',
                'model': '$model',
                'imageURL': '$imageURL',
                'wattage': wattage,
                'cooling_type': '$cooling_type',
                'fan_rpm': fan_rpm,
                'airflow': airflow,
                'specs': '$specs',
                'TimeStamp': timestamp
              }).catchError((error) => {print('failed to add data')})
            });
    print(' ' +
        brand +
        ' \n' ' ' +
        model +
        ' ' '\n ' +
        wattage.toString() +
        ' ' '\n ' +
        cooling_type +
        ' ' ' \n' +
        fan_rpm.toString() +
        ' ' '\n ' +
        airflow.toString() +
        ' \n' +
        specs);
  }

  getData(String category) async {
    return FirebaseFirestore.instance
        .collection('ComponentInfo')
        .where('category', isEqualTo: category)
        // .orderBy('timestamp',descending: true) TODO
        .snapshots();
  }
}
