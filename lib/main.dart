import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';
import 'package:project_pcbuildhelper/home.dart';
import 'package:project_pcbuildhelper/models/cart.dart';
import 'package:project_pcbuildhelper/userScreens/item.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Sharedpref.init();
  runApp(ChangeNotifierProvider(create: (context) => Item(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(home: Home()),
    );
  }
}
