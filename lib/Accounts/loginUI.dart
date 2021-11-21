import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Accounts/register_retailer.dart';
import 'package:project_pcbuildhelper/Services/AuthServices.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';
import 'package:project_pcbuildhelper/main.dart';

class Login_user extends StatefulWidget {
  const Login_user({Key key}) : super(key: key);

  @override
  _Login_userState createState() => _Login_userState();
}

class _Login_userState extends State<Login_user> {
  String name, password;

  @override
  Widget build(BuildContext context) {
    // Sharedpref preferance = new Sharedpref();
    FirebaseAuthService auth = FirebaseAuthService();
    String email, password;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(250, 10, 0, 20),
      ),
      backgroundColor: Color.fromARGB(255, 4, 7, 50),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              // controller: fieldText1,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Type your user name',
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'UserName',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                email = value.trim();
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: fieldText1,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Your Password',
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                password = value.trim();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await Sharedpref.setEmail(email);

                  // Scaffold.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Processing Data'),
                  //     duration: const Duration(milliseconds: 600),
                  //   ),
                  // );
                  auth.signin(email, password).then((value) => {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => MainApp()))
                      });
                },
                child: const Text('Login'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'dont have an account ?',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Center(
                    child: Text('Register Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700)),
                  )),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Register_retailer()));
              },
            )
          ],
        ),
      ),
    );
  }
}
