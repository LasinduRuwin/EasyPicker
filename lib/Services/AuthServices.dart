import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';

class FirebaseAuthService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  var timestamp = Timestamp.fromDate(DateTime.now());

  Future registerRetailer(
      String name, email, password, storename, contact, dilivery) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        print('success');
      } else {
        print('auht failed');
      }
      await userCollection.doc(user.uid).set({
        'userType': 'Retailer',
        'Name': '$name',
        'Email': '$email',
        'StoreName': '$storename',
        'contact': '$contact',
        'Dilivery': '$dilivery',
        'TimeStamp': timestamp
      }).catchError((error) => {print('failed to add data')});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signin(String email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = FirebaseAuth.instance.currentUser;
      Sharedpref.setUserID(user.uid);
      getData(user.uid);
      print('From Auth ' + user.uid);

      if (userCredential != null) {
        print('Login Success');
        await Sharedpref.setIsLoggedIn(true);
      } else {
        print('Login Failed');
        await Sharedpref.setIsLoggedIn(false);
      }
    } on FirebaseAuthException catch (e) {
      await Sharedpref.setIsLoggedIn(false);
      if (e.code == 'user-not-found') {
        print('\n\t auth services \n No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('\n\t auth services \n Wrong password provided for that user.');
      }
    }
  }

  getData(String userID) async {
    FirebaseFirestore.instance
        .collection('User')
        .doc(userID)
        .get()
        .then((value) => {
              Sharedpref.setUserName(value.data()['Name']),
              Sharedpref.setStoreName(value.data()['StoreName'])
            });
  }
}
