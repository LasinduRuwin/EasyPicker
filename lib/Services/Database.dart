import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  // collection reference
  final CollectionReference processorDataCollection =
      FirebaseFirestore.instance.collection('Processor');
  // collection reference
  final CollectionReference motherboardDataCollection =
      FirebaseFirestore.instance.collection('Motherboard');
  // collection reference
  final CollectionReference gpuDataCollection =
      FirebaseFirestore.instance.collection('GPU');
  // collection reference
  final CollectionReference ramDataCollection =
      FirebaseFirestore.instance.collection('RAM');
  // collection reference
  final CollectionReference storageDataCollection =
      FirebaseFirestore.instance.collection('Storage');
  // collection reference
  final CollectionReference psuDataCollection =
      FirebaseFirestore.instance.collection('PSU');
  // collection reference
  final CollectionReference coolingDataCollection =
      FirebaseFirestore.instance.collection('Cooling & Casing');
//Upload data Method
  Future setData(File imageFile, String imageFileName, String category,
      String title, String author, String description) async {
    //Required Variables
    var timestamp = Timestamp.fromDate(DateTime.now());
    String imageName;
    String imageURL;
    int randomNumber = Random().nextInt(100000);
    imageName = '$imageFileName{$randomNumber}';
//Uploading image to Firebase Storage
    Reference photoRef =
        FirebaseStorage.instance.ref().child('photos').child(imageName);
//Retrieving the Image URL
    photoRef
        .putFile(imageFile)
        .whenComplete(() => print('photo upload Successful'))
        .then((storageTask) async {
      imageURL = await storageTask.ref.getDownloadURL();
      print(imageURL + ' from crud');
      //Then send the data to Firestore
    }).whenComplete(() async {
      //category 1
      if (category == 'CPU') {
        print('Set Data Function Executed on Processor');
        return await processorDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
      //category 2
      if (category == 'Motherboard') {
        print('Set Data Function Executed on Motherboard');
        return await motherboardDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
      //category 3
      if (category == 'GPU') {
        print('Set Data Function Executed on GPU');
        return await gpuDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
      //category 4
      if (category == 'RAM') {
        print('Set Data Function Executed on RAM');
        return await ramDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
      //category 5
      if (category == 'Storage') {
        print('Set Data Function Executed on Storage');
        return await storageDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
      //category 6
      if (category == 'PSU') {
        print('Set Data Function Executed on PSU');
        return await psuDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
      //category 7
      if (category == 'Casing & Cooling') {
        print('Set Data Function Executed on Cooling & Casing');
        return await coolingDataCollection.doc().set({
          'Title': '$title',
          'imageURL': '$imageURL',
          'Author': '$author',
          'Article': '$description',
          'timestamp': '$timestamp'
        }).catchError((error) => {print('failed to add data! :(')});
      }
    });
  }

  getData(String category) async {
    return FirebaseFirestore.instance
        .collection(category)
        // .orderBy('timestamp',descending: true) TODO
        .snapshots();
  }
}
