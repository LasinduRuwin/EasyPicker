import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';
import 'package:project_pcbuildhelper/main.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LogOut'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Sharedpref.removeEmail();
                  Sharedpref.setIsLoggedIn(false);
                  Sharedpref.removeUserID();
                  Sharedpref.removeUserName();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainApp()));
                },
                child: const Text('Signout'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainApp()));
                },
                child: const Text('Back to Main Menu'),
              ),
            ],
          ),
        ));
  }
}
