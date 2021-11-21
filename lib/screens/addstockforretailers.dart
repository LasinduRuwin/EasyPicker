import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/screens/addstockcategoryscreens.dart';

class AddStock extends StatefulWidget {
  const AddStock({Key key}) : super(key: key);

  @override
  _AddStockState createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add to Stock'),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(color: Colors.blue),
            isScrollable: true,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                text: 'CPU',
              ),
              Tab(
                text: 'Motherboard',
              ),
              Tab(
                text: 'GPU',
              ),
              Tab(
                text: 'RAM',
              ),
              Tab(
                text: 'Storage',
              ),
              Tab(
                text: 'PSU',
              ),
              Tab(
                text: 'Casing',
              ),
              Tab(
                text: 'Cooling',
              )
            ],
          ),
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        body: TabBarView(
          children: [
            ItemsListView(category: 'CPU'),
            ItemsListView(category: 'Motherboard'),
            ItemsListView(category: 'GPU'),
            ItemsListView(category: 'RAM'),
            ItemsListView(category: 'Storage'),
            ItemsListView(category: 'PSU'),
            ItemsListView(category: 'Casing'),
            ItemsListView(category: 'Cooling'),
          ],
        ),
      ),
    );
  }
}
