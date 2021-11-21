import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';
import 'package:project_pcbuildhelper/infoSection/SectionPicker.dart';
import 'package:project_pcbuildhelper/navDrawer.dart';
import 'package:project_pcbuildhelper/userScreens/ListBuilderScreen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email;
    email = Sharedpref.getEmail();
    print('home' + email.toString());

    // pref.getpref().then((String value) => {email = value});
    // custom button widget for the main menu
    Widget buttonwidget(String name, Widget path) {
      return GestureDetector(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue, width: 2)),
          child: Center(
            child: Text(
              '$name',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        onTap: () {
          print(email);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => path));
        },
      );
    }

    return MaterialApp(
      home: Material(
        child: Scaffold(
          drawer: NavDrawerNew(), //navDrawer(context),
          appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(250, 10, 0, 20),
          ),
          backgroundColor: Color.fromARGB(255, 4, 7, 50),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonwidget('View Catalogue', ListBuilderScreen()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonwidget('Learn the basics', SectionPicker()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
