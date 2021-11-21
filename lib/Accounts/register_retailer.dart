import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Accounts/loginUI.dart';
import 'package:project_pcbuildhelper/Services/AuthServices.dart';

class Register_retailer extends StatelessWidget {
  const Register_retailer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registration';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        body: const RegistrationForm(),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
      ),
    );
  }
}

// Create a Form widget.
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key key}) : super(key: key);

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class RegistrationFormState extends State<RegistrationForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<RegistrationFormState>.
  final _formKey = GlobalKey<FormState>();
  String name, email, password, storeName, contact, delivery;

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService auth = FirebaseAuthService();
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Retailer Registration",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              height: 35,
            ),
            //name
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your name';
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Name",
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'name',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                name = value;
              },
            ),
            //email
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your email';
                }
                return null;
              },

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Email",
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                email = value;
              },
            ),
            //Password
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Password';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Create Password",
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                password = value;
              },
            ),
            //Store name
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Store Name';
                }
                return null;
              },

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Store Name",
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Store Name',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                storeName = value;
              },
            ),
            //Contact
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Store Contact';
                }
                return null;
              },

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Your Store's contact number",
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Contact',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                contact = value;
              },
            ),
            //Delivery
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Delivery Avalilability';
                }
                return null;
              },

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Delivery Availability--Yes/No & Area",
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Delivery Availability',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                delivery = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    print(name +
                        '\n' +
                        email +
                        '\n' +
                        password +
                        '\n' +
                        storeName +
                        '\n' +
                        contact +
                        '\n' +
                        delivery);
                    auth
                        .registerRetailer(
                            name, email, password, storeName, contact, delivery)
                        .then((value) => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login_user()))
                            });

                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                        duration: const Duration(milliseconds: 600),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
