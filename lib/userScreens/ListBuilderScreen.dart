import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/models/cart.dart';
import 'package:project_pcbuildhelper/userScreens/selectComponentscreen.dart';
import 'package:provider/provider.dart';

class ListBuilderScreen extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Cart>(context);

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        appBar: AppBar(
          title: Text('Create a build'),
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Wattage :' + item.wattage.toString(),
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Price :' + item.total.toString(),
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListBuilderScreenHome(),
            ],
          ),
        ));
  }
}

class ListBuilderScreenHome extends StatefulWidget {
  const ListBuilderScreenHome({Key key}) : super(key: key);

  @override
  _ListBuilderScreenHomeState createState() => _ListBuilderScreenHomeState();
}

class _ListBuilderScreenHomeState extends State<ListBuilderScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (BuildContext context, Cart item, _) {
        final hardwareItemsList = Provider.of<Cart>(context);
        return SingleChildScrollView(
          child: Container(
            child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    item.hardwareItems[index].isExpanded = !isExpanded;
                  });
                },
                children: [
                  !item.hardwareItems[0].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'CPU',
                                              cpusocket: item
                                                  .hardwareItems[1].cpusocket,
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK CPU',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a CPU',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'CPU',
                                              cpusocket: item
                                                  .hardwareItems[1].cpusocket,
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[0].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[0].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[0].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            item.hardwareItems[0].cpusocket,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[0].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[0].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[0]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[0].count =
                                                      --item.hardwareItems[0]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[0].price);

                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[0]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[0].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[0].count =
                                                    ++item
                                                        .hardwareItems[0].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[0].price);

                                                item.addWattToWattage(item
                                                    .hardwareItems[0].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[0].price *
                                                  item.hardwareItems[0].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[0].wattage *
                                                  item.hardwareItems[0].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 0);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[0].isExpanded,
                        ),
                  !item.hardwareItems[1].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Motherboard',
                                              cpusocket: item
                                                  .hardwareItems[0].cpusocket,
                                              ramtype:
                                                  item.hardwareItems[3].ramtype,
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK Motherboard',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a Motherboard',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Motherboard',
                                              cpusocket: item
                                                  .hardwareItems[0].cpusocket,
                                              ramtype:
                                                  item.hardwareItems[3].ramtype,
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[1].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[1].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[1].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[1].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[1].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[1]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[1].count =
                                                      --item.hardwareItems[1]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[1].price);
                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[1]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[1].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[1].count =
                                                    ++item
                                                        .hardwareItems[1].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[1].price);

                                                item.addWattToWattage(item
                                                    .hardwareItems[1].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[1].price *
                                                  item.hardwareItems[1].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[1].wattage *
                                                  item.hardwareItems[1].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 1);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[1].isExpanded,
                        ),
                  //TODO GPU
                  !item.hardwareItems[2].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'GPU',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK GPU',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a GPU',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'GPU',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[2].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[2].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[2].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[2].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[2].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[2]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[2].count =
                                                      --item.hardwareItems[2]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[2].price);
                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[2]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[2].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[2].count =
                                                    ++item
                                                        .hardwareItems[2].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[2].price);

                                                item.addWattToWattage(item
                                                    .hardwareItems[2].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[2].price *
                                                  item.hardwareItems[2].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[2].wattage *
                                                  item.hardwareItems[2].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 2);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[2].isExpanded,
                        ),

                  //TODO RAM
                  !item.hardwareItems[3].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'RAM',
                                              cpusocket: '',
                                              ramtype:
                                                  item.hardwareItems[1].ramtype,
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK RAM',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a RAM',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'RAM',
                                              cpusocket: '',
                                              ramtype:
                                                  item.hardwareItems[1].ramtype,
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[3].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[3].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[3].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            item.hardwareItems[3].ramtype,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[3].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[3].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[3]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[3].count =
                                                      --item.hardwareItems[3]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[3].price);
                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[3]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[3].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[3].count =
                                                    ++item
                                                        .hardwareItems[3].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[3].price);

                                                item.addWattToWattage(item
                                                    .hardwareItems[3].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[3].price *
                                                  item.hardwareItems[3].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[3].wattage *
                                                  item.hardwareItems[3].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 3);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[3].isExpanded,
                        ),

                  //TODO STORAGE
                  !item.hardwareItems[4].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Storage',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK Storage',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a Storage',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Storage',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[4].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[4].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[4].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[4].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[4].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[4]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[4].count =
                                                      --item.hardwareItems[4]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[4].price);
                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[4]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[4].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[4].count =
                                                    ++item
                                                        .hardwareItems[4].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[4].price);

                                                item.addWattToWattage(item
                                                    .hardwareItems[4].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[4].price *
                                                  item.hardwareItems[4].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[4].wattage *
                                                  item.hardwareItems[4].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 4);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[4].isExpanded,
                        ),

                  //TODO PSU
                  !item.hardwareItems[5].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                            category: 'PSU',
                                            cpusocket: '',
                                            ramtype: '',
                                            wattage: item
                                                .wattage //TODO add real wattage,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK PSU',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a PSU',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'PSU',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: item.wattage,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[5].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[5].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[5].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[5].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            'Power Out: ' +
                                                item.hardwareItems[5].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[5]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[5].count =
                                                      --item.hardwareItems[5]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[5].price);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[5].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[5].count =
                                                    ++item
                                                        .hardwareItems[5].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[5].price);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[5].price *
                                                  item.hardwareItems[5].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 5);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[5].isExpanded,
                        ),
                  //TODO CASING
                  !item.hardwareItems[6].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Casing',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK Casing',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a Casing',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Casing',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[6].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[6].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[6].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[6].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[6].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[6]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[6].count =
                                                      --item.hardwareItems[6]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[6].price);
                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[6]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[6].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[6].count =
                                                    ++item
                                                        .hardwareItems[6].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[6].price);
                                                item.addWattToWattage(item
                                                    .hardwareItems[6].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[6].price *
                                                  item.hardwareItems[6].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[6].wattage *
                                                  item.hardwareItems[6].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 6);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[6].isExpanded,
                        ),
                  //TODO COOLING
                  !item.hardwareItems[7].isSelected
                      ? ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Cooling',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    'PICK Cooling',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Container(
                                child: Column(children: <Widget>[
                                  Text(
                                    'Select a Cooler (Optional)',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ]),
                              )))
                      : ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return InkWell(
                              onTap: () {
                                print(item);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SelectItemList(
                                              category: 'Cooling',
                                              cpusocket: '',
                                              ramtype: '',
                                              wattage: null,
                                            )));
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    item.hardwareItems[7].brandNDmodel,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Image.network(
                                          item.hardwareItems[7].imgData,
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Store: ' +
                                                item.hardwareItems[7].retailer,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            item.hardwareItems[7].price
                                                    .toString() +
                                                ' LKR',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            item.hardwareItems[7].wattage
                                                    .toString() +
                                                ' watts',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (item.hardwareItems[7]
                                                        .count !=
                                                    1) {
                                                  item.hardwareItems[7].count =
                                                      --item.hardwareItems[7]
                                                          .count;

                                                  // deduct changed price according to count
                                                  item.deductPriceFromTotal(item
                                                      .hardwareItems[7].price);

                                                  item.deductWattFromWattage(
                                                      item.hardwareItems[7]
                                                          .wattage);
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            item.hardwareItems[7].count
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                item.hardwareItems[7].count =
                                                    ++item
                                                        .hardwareItems[7].count;

                                                // add changed price according to count
                                                item.addPricetoTotal(item
                                                    .hardwareItems[7].price);
                                                item.addWattToWattage(item
                                                    .hardwareItems[7].wattage);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          item.deductPriceFromTotal(
                                              item.hardwareItems[7].price *
                                                  item.hardwareItems[7].count);

                                          item.deductWattFromWattage(
                                              item.hardwareItems[7].wattage *
                                                  item.hardwareItems[7].count);

                                          setState(() {
                                            hardwareItemsList.removeFromBuild(
                                                index: 7);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isExpanded: item.hardwareItems[7].isExpanded,
                        ),
                ]),
          ),
        );
      },
    );
  }
}
