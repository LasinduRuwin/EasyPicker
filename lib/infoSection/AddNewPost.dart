import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_pcbuildhelper/Services/DataBase.dart';
//import 'package:project_pcbuildhelper/Services/Storage.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({Key key}) : super(key: key);

  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  DatabaseService conn = DatabaseService();

  String category, title, author, description;
  File selectedImage;
  bool _isLoading = false;
  bool _isValid = true;
  String imgURL;
  final _picker = ImagePicker();

  Future getImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  final TextEditingController fieldText1 = TextEditingController();
  final TextEditingController fieldText2 = TextEditingController();
  final TextEditingController fieldText3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void clearText() {
      setState(() {
        fieldText1.clear();
        fieldText2.clear();
        fieldText3.clear();
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Add a new Article'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                color: Color.fromARGB(255, 4, 7, 50),
                child: GestureDetector(
                  onTap: () {
                    getImage();
                    //.whenComplete(() => uploadImage());
                  },
                  child: selectedImage != null
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              selectedImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 5, 80),
                              borderRadius: BorderRadius.circular(6)),
                          width: MediaQuery.of(context).size.width,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.blue,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                hint: Text(
                  'Choose a category',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                value: category,
                elevation: 8,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    category = newValue;
                  });
                },
                items: <String>[
                  'CPU',
                  'Motherboard',
                  'GPU',
                  'RAM',
                  'Storage',
                  'PSU',
                  'Casing & Cooling'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: fieldText1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Type your article Title',
                  hintStyle: TextStyle(color: Colors.blue),
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  title = value;
                },
              ),

              SizedBox(
                height: 10,
              ),
              TextField(
                controller: fieldText2,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Type your Name Here',
                  hintStyle: TextStyle(color: Colors.blue),
                  labelText: 'Author',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  author = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              //TODO
              TextField(
                controller: fieldText3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 50,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Type your article here',
                  hintStyle: TextStyle(color: Colors.blue),
                  labelText: 'Article',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  description = value;
                },
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),

              //post button
              TextButton.icon(
                  style: TextButton.styleFrom(
                      elevation: 8,
                      backgroundColor: Color.fromARGB(255, 30, 5, 80),
                      shadowColor: Colors.blue,
                      side: BorderSide(color: Colors.blue, width: 2)),
                  icon: Icon(
                    Icons.post_add,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    //uploadImage();
                    if (selectedImage == null ||
                        category == null ||
                        category == null ||
                        title == null ||
                        author == null ||
                        description == null) {
                      _isValid = false;
                    } else {
                      conn
                          .setData(selectedImage, 'MBIMG ', category, title,
                              author, description)
                          .whenComplete(() => setState(() {
                                _isLoading = true;
                                _isValid = true;
                                clearText();
                              }));
                      print('Post button');
                    }
                  },
                  label: Text(
                    'Post the Article',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  )),
              SizedBox(
                height: 16.0,
              ),
              _isLoading
                  ? Text(
                      'Upload Complete',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    )
                  : Text(''),
              _isValid
                  ? Text('')
                  : Text(
                      'Please fill all the fields',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
            ],
          ),
        ));
  }
}
