import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetComponents {
  final CollectionReference getpc =
      FirebaseFirestore.instance.collection('Stock');

  getcpu({@required String cpusocket}) async {
    // print(getpc.get());
    if (cpusocket != null && cpusocket != '') {
      return getpc
          .where('category', isEqualTo: 'CPU')
          .where('cpusocket', isEqualTo: cpusocket)
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    } else {
      return getpc
          .where('category', isEqualTo: 'CPU')
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    }
  }

  getmotherboard({@required String cpusocket, @required ramtype}) async {
    // print(getpc.get());
    if ((cpusocket != null && cpusocket != '') &&
        (ramtype != null && ramtype != '')) {
      return getpc
          .where('category', isEqualTo: 'Motherboard')
          .where('cpusocket', isEqualTo: cpusocket)
          .where('ramslot', isEqualTo: ramtype)
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    } else if ((cpusocket == null || cpusocket == '') &&
        (ramtype != null && ramtype != '')) {
      return getpc
          .where('category', isEqualTo: 'Motherboard')
          .where('ramslot', isEqualTo: ramtype)
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    } else if ((ramtype == null || ramtype == '') &&
        (cpusocket != null && cpusocket != '')) {
      return getpc
          .where('category', isEqualTo: 'Motherboard')
          .where('cpusocket', isEqualTo: cpusocket)
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    } else {
      return getpc
          .where('category', isEqualTo: 'Motherboard')
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    }
  }

  getgpu() async {
    return getpc
        .where('category', isEqualTo: 'GPU')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
  }

  getram({@required String ramtype}) async {
    if (ramtype != null && ramtype != '') {
      return getpc
          .where('category', isEqualTo: 'RAM')
          .where('ramtype', isEqualTo: ramtype)
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    } else {
      return getpc
          .where('category', isEqualTo: 'RAM')
          .orderBy('TimeStamp', descending: true)
          .snapshots();
    }
  }

  getstorage() async {
    return getpc
        .where('category', isEqualTo: 'Storage')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
  }

  getpsu({@required int wattage}) async {
    if (wattage != null) {
      return getpc
          .where('category', isEqualTo: 'PSU')
          .where('wattage', isGreaterThan: wattage)
          .snapshots();
    } else {
      return getpc.where('category', isEqualTo: 'PSU').snapshots();
    }
  }

  getcasing() async {
    return getpc
        .where('category', isEqualTo: 'Casing')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
  }

  getcooling() async {
    return getpc
        .where('category', isEqualTo: 'Cooling')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
  }
}
