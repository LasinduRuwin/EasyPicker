import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Accounts/loginUI.dart';
import 'package:project_pcbuildhelper/Accounts/logout.dart';
import 'package:project_pcbuildhelper/Accounts/register_retailer.dart';
import 'package:project_pcbuildhelper/Admin/add_componentData.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';
import 'package:project_pcbuildhelper/screens/addstockforretailers.dart';

class NavDrawerNew extends StatefulWidget {
  const NavDrawerNew({Key key}) : super(key: key);

  @override
  _NavDrawerNewState createState() => _NavDrawerNewState();
}

class _NavDrawerNewState extends State<NavDrawerNew> {
  @override
  Widget build(BuildContext context) {
    String email = Sharedpref.getEmail();
    print('helo ' + email.toString());

    bool isLoggedIn = false;
    if (Sharedpref.getIsLoggedIn() != null) {
      isLoggedIn = Sharedpref.getIsLoggedIn();
      print(isLoggedIn);
    }
    //Navigation Drawer
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(250, 10, 0, 20),
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
          isLoggedIn == false
              ? ListTile(
                  title: const Text('Retailer Login'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login_user()));
                  },
                )
              : Column(
                  children: [
                    ListTile(
                      title: Text('Logged In as ' +
                          Sharedpref.getUserName().toString()),
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LogOut()));
                      },
                    ),
                    ListTile(
                      title: const Text('Add stock '),
                      onTap: () {
                        // Update the state of the app.
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddStock()));
                      },
                    ),
                  ],
                ),
          Padding(
              padding: EdgeInsets.fromLTRB(12, 5, 6, 5),
              child: Text(
                'Retailer ?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )),
          ListTile(
            title: const Text('Register Here'),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Register_retailer()));
            },
          ),
          ListTile(
            title: const Text('Add component data (Admin)'),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Add_componentdata()));
            },
          ),
        ],
      ),
    );
  }
}

// Widget navDrawer(BuildContext context) {
//   // preferance.getpref().then((String value) => {email = value});
//   // print('helo ' + email.toString());
//   String email = Sharedpref.getEmail();
//   print('helo ' + email.toString());

//   bool isLoggedIn = false;
//   if (Sharedpref.getIsLoggedIn() != null) {
//     isLoggedIn = Sharedpref.getIsLoggedIn();
//     print(isLoggedIn);
//   }

//   print(isLoggedIn);

//   return Drawer(
//     child: ListView(
//       // Important: Remove any padding from the ListView.
//       padding: EdgeInsets.zero,
//       children: [
//         const DrawerHeader(
//           decoration: BoxDecoration(
//             color: Color.fromARGB(250, 10, 0, 20),
//           ),
//           child: Text(
//             'Drawer Header',
//             style: TextStyle(color: Colors.blue, fontSize: 16),
//           ),
//         ),
//         isLoggedIn == false
//             ? ListTile(
//                 title: const Text('Retailer Login'),
//                 onTap: () {
//                   // Update the state of the app.
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => Login_user()));
//                 },
//               )
//             : Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                         'Logged In as ' + Sharedpref.getUserName().toString()),
//                   ),
//                   ListTile(
//                     title: const Text('Logout'),
//                     onTap: () {
//                       Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) => LogOut()));
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('Add stock '),
//                     onTap: () {
//                       // Update the state of the app.
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => AddStock()));
//                     },
//                   ),
//                 ],
//               ),
//         ListTile(
//           title: const Text('Register here '),
//           onTap: () {
//             // Update the state of the app.
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => Register_retailer()));
//           },
//         ),
//         ListTile(
//           title: const Text('Add component data (Admin)'),
//           onTap: () {
//             // Update the state of the app.
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => Add_componentdata()));
//           },
//         ),
//       ],
//     ),
//   );
// }
