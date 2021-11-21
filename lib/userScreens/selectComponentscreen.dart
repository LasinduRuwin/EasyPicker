import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Services/GetComponents.dart';
import 'package:project_pcbuildhelper/screens/singlecomponentscreen.dart';
import 'package:project_pcbuildhelper/userScreens/partDetails_screen.dart';

class SelectItemList extends StatefulWidget {
  final String category;
  final String cpusocket, ramtype;
  final int wattage;
  const SelectItemList(
      {Key key,
      @required this.category,
      this.cpusocket,
      this.ramtype,
      this.wattage})
      : super(key: key);

  @override
  _SelectItemListState createState() => _SelectItemListState();
}

class _SelectItemListState extends State<SelectItemList> {
  GetComponents dbconn = new GetComponents();

  Stream itemsStream;

  // ignore: non_constant_identifier_names
  Widget ItemsList() {
    ScrollController _controller = new ScrollController();
    if (itemsStream == null) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Select Your ' + widget.category),
          centerTitle: true,
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        body: Container(
            child: ListView(shrinkWrap: true, children: [
          Column(
            children: <Widget>[
              StreamBuilder(
                stream: itemsStream,
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.data == null) {
                    return CircularProgressIndicator();
                  } else {
                    if (widget.category == 'CPU') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()['brand'],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              cpuSocket: streamSnapshot.data.docs[index]
                                  .data()['cpusocket'],
                              clockSpeed: streamSnapshot.data.docs[index]
                                  .data()['clockspeed'],
                              coreCount: streamSnapshot.data.docs[index]
                                  .data()['corecount'],
                              threadCount: streamSnapshot.data.docs[index]
                                  .data()['threadcount'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'Motherboard') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              cpuSocket: streamSnapshot.data.docs[index]
                                  .data()['cpusocket'],
                              expansionSlots: streamSnapshot.data.docs[index]
                                  .data()['expansionslots'],
                              ramType: streamSnapshot.data.docs[index]
                                  .data()['ramslot'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'GPU') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              clockSpeed: streamSnapshot.data.docs[index]
                                  .data()['clockspeed'],
                              memorysize: streamSnapshot.data.docs[index]
                                  .data()['memorysize'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'RAM') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              ramspeed: streamSnapshot.data.docs[index]
                                  .data()['ramspeed'],
                              ramORStorageCapacity: streamSnapshot
                                  .data.docs[index]
                                  .data()['ramStrCapacity'],
                              ramType: streamSnapshot.data.docs[index]
                                  .data()['ramtype'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'Storage') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              storageConnector: streamSnapshot.data.docs[index]
                                  .data()['connector'],
                              ramORStorageCapacity: streamSnapshot
                                  .data.docs[index]
                                  .data()['ramStrCapacity'],
                              storageType: streamSnapshot.data.docs[index]
                                  .data()['storagetype'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'PSU') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'Casing') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              caseSize: streamSnapshot.data.docs[index]
                                  .data()['case_size'],
                              numOfFans: streamSnapshot.data.docs[index]
                                  .data()['numOfFans'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                    if (widget.category == 'Cooling') {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          controller: _controller,
                          itemCount: streamSnapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ComponetTiles(
                              model: streamSnapshot.data.docs[index]
                                  .data()['model'],
                              brand: streamSnapshot.data.docs[index]
                                  .data()["brand"],
                              specs: streamSnapshot.data.docs[index]
                                  .data()['specs'],
                              imageURL: streamSnapshot.data.docs[index]
                                  .data()['imageURL'],
                              category: widget.category,
                              wattageORpowerout: streamSnapshot.data.docs[index]
                                  .data()['wattage'],
                              fanAirflow: streamSnapshot.data.docs[index]
                                  .data()['airflow'],
                              coolingType: streamSnapshot.data.docs[index]
                                  .data()['coolingtype'],
                              fanRPM: streamSnapshot.data.docs[index]
                                  .data()['fanRpm'],
                              storename: streamSnapshot.data.docs[index]
                                  .data()['StoreName'],
                              uid:
                                  streamSnapshot.data.docs[index].data()['UID'],
                              price: streamSnapshot.data.docs[index]
                                  .data()['price'],
                            );
                          });
                    }
                  }
                },
              )
            ],
          ),
        ])),
      );
    }
  }

  @override
  void initState() {
    //TODO add the rest of the methods
    if (widget.category == 'CPU') {
      dbconn.getcpu(cpusocket: widget.cpusocket).then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'Motherboard') {
      dbconn
          .getmotherboard(cpusocket: widget.cpusocket, ramtype: widget.ramtype)
          .then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'GPU') {
      dbconn.getgpu().then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'RAM') {
      dbconn.getram(ramtype: widget.ramtype).then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'Storage') {
      dbconn.getstorage().then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'PSU') {
      dbconn.getpsu(wattage: widget.wattage).then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'Casing') {
      dbconn.getcasing().then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    } else if (widget.category == 'Cooling') {
      dbconn.getcooling().then((result) {
        print('result ' + result.toString());
        setState(() {
          itemsStream = result;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 7, 50),
      body: ItemsList(),
    );
  }
}

class ComponetTiles extends StatelessWidget {
  String imageURL, brand, specs, model, category;
  int wattageORpowerout;
  //CPU and Motherboard
  String cpuSocket;
//RAM and Motherboard
  String ramType;
//RAM and Storage
  int ramORStorageCapacity;

//CPU
  int clockSpeed, coreCount, threadCount;
//Motherboard
  String expansionSlots;
//GPU
  int memorysize, gpuClockSpeed;
//RAM
  int ramspeed;
//Storage
  String storageType, storageConnector;
//PSU
// possible int powerOut;
//Casing
  String caseSize;
  int numOfFans;
//Cooling
  String coolingType;
  int fanRPM, fanAirflow, price;
  String uid;
  String storename;

  ComponetTiles(
      {@required this.imageURL,
      @required this.brand,
      @required this.specs,
      @required this.model,
      @required this.category,
      this.wattageORpowerout,
      this.cpuSocket,
      this.ramType,
      this.ramORStorageCapacity,
      this.clockSpeed,
      this.coreCount,
      this.threadCount,
      this.expansionSlots,
      this.memorysize,
      this.gpuClockSpeed,
      this.ramspeed,
      this.storageType,
      this.storageConnector,
      this.caseSize,
      this.numOfFans,
      this.coolingType,
      this.fanAirflow,
      this.fanRPM,
      this.storename,
      this.uid,
      this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category == 'CPU') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    uid: uid,
                    storename: storename,
                    price: price,
                    imageURL: imageURL,
                    category: category,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    cpuSocket: cpuSocket,
                    clockSpeed: clockSpeed,
                    coreCount: coreCount,
                    threadCount: threadCount,
                  )));
          print(wattageORpowerout.toString() +
              ' watts\n' +
              ' ' +
              category +
              ' ' +
              cpuSocket +
              ' ' +
              clockSpeed.toString() +
              '\n ' +
              coreCount.toString() +
              ' ' +
              threadCount.toString());
        } else if (category == 'Motherboard') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    uid: uid,
                    storename: storename,
                    price: price,
                    imageURL: imageURL,
                    category: category,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    cpuSocket: cpuSocket,
                    ramType: ramType,
                    expansionSlots: expansionSlots,
                  )));
          print(wattageORpowerout.toString() +
              ' watts' +
              ' ' +
              category +
              ' ' +
              cpuSocket +
              ' ' +
              ramType +
              '\n ' +
              expansionSlots);
        } else if (category == 'GPU') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    uid: uid,
                    storename: storename,
                    price: price,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    clockSpeed: clockSpeed,
                    memorysize: memorysize,
                  )));
          print(wattageORpowerout.toString() +
              ' watts' +
              ' ' +
              category +
              ' ' +
              clockSpeed.toString() +
              '\n ' +
              memorysize.toString());
        } else if (category == 'RAM') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    uid: uid,
                    storename: storename,
                    price: price,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    ramType: ramType,
                    ramspeed: ramspeed,
                    ramORStorageCapacity: ramORStorageCapacity,
                  )));
          print(wattageORpowerout.toString() +
              ' watts' +
              ' ' +
              category +
              ' ' +
              ramType +
              ' ' +
              ramspeed.toString() +
              '\n ' +
              ramORStorageCapacity.toString());
        } else if (category == 'Storage') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    uid: uid,
                    storename: storename,
                    price: price,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    storageType: storageType,
                    storageConnector: storageConnector,
                    ramORStorageCapacity: ramORStorageCapacity,
                  )));
          print(wattageORpowerout.toString() +
              ' watts' +
              ' ' +
              category +
              ' ' +
              storageConnector +
              ' ' +
              ramORStorageCapacity.toString() +
              '\n ' +
              storageType);
        } else if (category == 'PSU') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    uid: uid,
                    storename: storename,
                    price: price,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                  )));
          print(wattageORpowerout.toString() + ' watts' + ' ' + category + ' ');
        } else if (category == 'Casing') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    uid: uid,
                    storename: storename,
                    price: price,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    caseSize: caseSize,
                    numOfFans: numOfFans,
                  )));
          print(wattageORpowerout.toString() +
              ' watts' +
              ' ' +
              category +
              ' ' +
              caseSize +
              ' ' +
              numOfFans.toString());
        } else if (category == 'Cooling') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PartDetailsScreen(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    uid: uid,
                    storename: storename,
                    price: price,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                    fanAirflow: fanAirflow,
                    coolingType: coolingType,
                    fanRPM: fanRPM,
                  )));
          print(wattageORpowerout.toString() +
              ' watts' +
              ' ' +
              category +
              ' ' +
              fanAirflow.toString() +
              ' ' +
              coolingType +
              '\n ' +
              fanRPM.toString());
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        height: 150,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageURL,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    brand + '\n' + model,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      //background: ,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    storename + '\n' + price.toString() + ' LKR',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        //background: ,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
