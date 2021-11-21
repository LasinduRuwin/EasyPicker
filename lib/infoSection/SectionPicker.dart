import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/infoSection/AddNewPost.dart';
import 'package:project_pcbuildhelper/infoSection/BlogView.dart';

class SectionPicker extends StatelessWidget {
  const SectionPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: Colors.blue, width: 1),
    );
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select a category'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddNewPost()));
              },
              iconSize: 30,
              padding: EdgeInsets.only(right: 20, left: 20),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        body: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          crossAxisCount: 2,
          children: [
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/processor.png',
                      height: 100,
                    ),
                    Text(
                      'Processor',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'Processor',
                        )));
                print('CPU');
              },
            ),
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/motherboard.png',
                      height: 100,
                    ),
                    Text(
                      'Motherboard',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'Motherboard',
                        )));
                print('Motherboard');
              },
            ),
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/gpu.png',
                      height: 100,
                    ),
                    Text(
                      'GPU',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'GPU',
                        )));
                print('gpu');
              },
            ),
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/ram.png',
                      height: 100,
                    ),
                    Text(
                      'RAM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'RAM',
                        )));
                print('RAM');
              },
            ),
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/harddisk.png',
                      height: 100,
                    ),
                    Text(
                      'Storage',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'Storage',
                        )));
                print('Storage');
              },
            ),
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/power-supply.png',
                      height: 100,
                    ),
                    Text(
                      'Power Supply',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'PSU',
                        )));
                print('PSU');
              },
            ),
            GestureDetector(
              child: Card(
                color: Color.fromARGB(255, 15, 0, 60),
                elevation: 20,
                shadowColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/computer-case.png',
                      height: 100,
                    ),
                    Text(
                      'Cooling & Casing',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 3,
                          shadows: [
                            Shadow(
                                color: Colors.blue[600],
                                offset: Offset(1, 10),
                                blurRadius: 10)
                          ]),
                    ),
                  ],
                ),
                shape: shape,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlogView(
                          category: 'Cooling & Casing',
                        )));
                print('Casing & Cooling');
              },
            ),
          ],
        ),
      ),
    );
  }
}
