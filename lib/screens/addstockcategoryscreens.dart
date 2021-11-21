import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Services/Add_components.dart';
import 'package:project_pcbuildhelper/screens/singlecomponentscreen.dart';

class ItemsListView extends StatefulWidget {
  final String category;
  const ItemsListView({Key key, @required this.category}) : super(key: key);

  @override
  _ItemsListViewState createState() => _ItemsListViewState();
}

class _ItemsListViewState extends State<ItemsListView> {
  Add_components dbconn = new Add_components();

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
      return Container(
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            cpuSocket: streamSnapshot.data.docs[index]
                                .data()['cpu_socket'],
                            clockSpeed: streamSnapshot.data.docs[index]
                                .data()['clock_speed'],
                            coreCount: streamSnapshot.data.docs[index]
                                .data()['core_count'],
                            threadCount: streamSnapshot.data.docs[index]
                                .data()['thread_count'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            cpuSocket: streamSnapshot.data.docs[index]
                                .data()['cpu_socket'],
                            expansionSlots: streamSnapshot.data.docs[index]
                                .data()['expansion_slots'],
                            ramType: streamSnapshot.data.docs[index]
                                .data()['ram_slot'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            clockSpeed: streamSnapshot.data.docs[index]
                                .data()['clock_speed'],
                            memorysize: streamSnapshot.data.docs[index]
                                .data()['memorysize'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            ramspeed: streamSnapshot.data.docs[index]
                                .data()['ram_speed'],
                            ramORStorageCapacity: streamSnapshot
                                .data.docs[index]
                                .data()['ram_str_capacity'],
                            ramType: streamSnapshot.data.docs[index]
                                .data()['ram_type'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            storageConnector: streamSnapshot.data.docs[index]
                                .data()['connector'],
                            ramORStorageCapacity: streamSnapshot
                                .data.docs[index]
                                .data()['ram_str_capacity'],
                            storageType: streamSnapshot.data.docs[index]
                                .data()['storage_type'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            caseSize: streamSnapshot.data.docs[index]
                                .data()['case_size'],
                            numOfFans: streamSnapshot.data.docs[index]
                                .data()['num_of_fans'],
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
                            model:
                                streamSnapshot.data.docs[index].data()['model'],
                            brand:
                                streamSnapshot.data.docs[index].data()["brand"],
                            specs:
                                streamSnapshot.data.docs[index].data()['specs'],
                            imageURL: streamSnapshot.data.docs[index]
                                .data()['imageURL'],
                            category: widget.category,
                            wattageORpowerout: streamSnapshot.data.docs[index]
                                .data()['wattage'],
                            fanAirflow: streamSnapshot.data.docs[index]
                                .data()['airflow'],
                            coolingType: streamSnapshot.data.docs[index]
                                .data()['cooling_type'],
                            fanRPM: streamSnapshot.data.docs[index]
                                .data()['fan_rpm'],
                          );
                        });
                  }
                }
              },
            )
          ],
        ),
      ]));
    }
  }

  @override
  void initState() {
    dbconn.getData(widget.category).then((result) {
      setState(() {
        itemsStream = result;
      });
    });
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
  int fanRPM, fanAirflow;

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
      this.fanRPM});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ArticleView(
        //           title: title,
        //           imageURL: imageURL,
        //           author: authorName,
        //           article: article,
        //         )));
        if (category == 'CPU') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
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
              ' watts' +
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
                    wattageORpowerout: wattageORpowerout,
                    specs: specs,
                  )));
          print(wattageORpowerout.toString() + ' watts' + ' ' + category + ' ');
        } else if (category == 'Casing') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SingleItemView(
                    brand: brand,
                    model: model,
                    imageURL: imageURL,
                    category: category,
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
                    brand,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      //background: ,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    model,
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
