import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/models/cart.dart';
import 'package:project_pcbuildhelper/userScreens/ListBuilderScreen.dart';
import 'package:project_pcbuildhelper/userScreens/item.dart';
import 'package:provider/provider.dart';

class PartDetailsScreen extends StatefulWidget {
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

  String storename, uid;
  int price;
  PartDetailsScreen({
    // Constructor parameters
    @required this.imageURL,
    @required this.brand,
    @required this.specs,
    @required this.model,
    @required this.category,
    @required this.storename,
    @required this.uid,
    @required this.price,
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
  });

  @override
  _PartDetailsScreenState createState() => _PartDetailsScreenState();
}

class _PartDetailsScreenState extends State<PartDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final hardwareItemsList = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brand),
        centerTitle: true,
        backgroundColor: Color.fromARGB(250, 10, 0, 20),
      ),
      backgroundColor: Color.fromARGB(255, 4, 7, 50),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 150,
              child: Image.network(
                widget.imageURL,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.brand,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              widget.model,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)),
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // alignment: ,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    // Displays the information depending on the selected category
                    child: widget.category == 'CPU'
                        ? cpu()
                        : widget.category == 'Motherboard'
                            ? motherboard()
                            : widget.category == 'GPU'
                                ? gpu()
                                : widget.category == 'RAM'
                                    ? ram()
                                    : widget.category == 'Storage'
                                        ? storage()
                                        : widget.category == 'PSU'
                                            ? psu()
                                            : widget.category == 'Casing'
                                                ? casing()
                                                : widget.category == 'Cooling'
                                                    ? cooling()
                                                    : Text(
                                                        'Error' +
                                                            widget.category,
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 16),
                                                      )),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Retailer :' + widget.storename,
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                Text('Price :' + widget.price.toString() + ' LKR',
                    style: TextStyle(color: Colors.blue, fontSize: 16))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Add to build button
            GestureDetector(
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue, width: 2)),
                child: Center(
                  child: Text(
                    'Add to Build',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              onTap: () {
                // update hardwareItems list with provider
                if (widget.category == 'CPU') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          cpusocket: widget.cpuSocket,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 0);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                } else if (widget.category == 'Motherboard') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          cpusocket: widget.cpuSocket,
                          ramtype: widget.ramType,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 1);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                } else if (widget.category == 'GPU') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 2);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                } else if (widget.category == 'RAM') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          ramtype: widget.ramType,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 3);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                } else if (widget.category == 'Storage') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 4);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                } else if (widget.category == 'PSU') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 5);

                  hardwareItemsList.addPricetoTotal(widget.price);
                } else if (widget.category == 'Casing') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          cpusocket: widget.cpuSocket,
                          ramtype: widget.ramType,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 6);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                } else if (widget.category == 'Cooling') {
                  hardwareItemsList.addToBuild(
                      item: Item(
                          brandNDmodel: widget.brand + ' ' + widget.model,
                          isSelected: true,
                          isExpanded: true,
                          price: widget.price,
                          retailer: widget.storename,
                          wattage: widget.wattageORpowerout,
                          imgData: widget.imageURL,
                          count: 1),
                      index: 7);

                  hardwareItemsList.addPricetoTotal(widget.price);
                  hardwareItemsList.addWattToWattage(widget.wattageORpowerout);
                }

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ListBuilderScreen()));
              },
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  Widget cpu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Socket ' + widget.cpuSocket,
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Cores: ' + widget.coreCount.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            Text(
              'Threads : ' + widget.threadCount.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Clock Speed: ' + widget.clockSpeed.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Power Consumption: ' +
              widget.wattageORpowerout.toString() +
              ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Additional Information : \n\t' + widget.specs,
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget motherboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'CPU Socket: ' + widget.cpuSocket.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            Text(
              'RAM Type : ' + widget.ramType.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Expantion Slots:- \n' + widget.expansionSlots.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Power Consumption: ' +
              widget.wattageORpowerout.toString() +
              ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget gpu() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Clock Speed: ' + widget.clockSpeed.toString() + 'MHz',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Memory Size : ' + widget.memorysize.toString() + ' GB',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Power Consumption: ' +
              widget.wattageORpowerout.toString() +
              ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget ram() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'RAM Type : ' + widget.ramType.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            Text(
              'RAM Speed : ' + widget.ramspeed.toString() + ' MHz',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'RAM Capacity:' + widget.ramORStorageCapacity.toString() + ' GB',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Power Consumption: ' +
              widget.wattageORpowerout.toString() +
              ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget storage() {
    return Column(
      children: [
        Text(
          'Storage Type :' + widget.storageType.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Connector : ' + widget.storageConnector.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Capacity : ' + widget.ramORStorageCapacity.toString() + ' GB',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Power Consumption: ' +
              widget.wattageORpowerout.toString() +
              ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget psu() {
    return Column(
      children: [
        Text(
          'Power Output : ' + widget.wattageORpowerout.toString() + ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget casing() {
    return Column(
      children: [
        Text(
          'Case Size : ' + widget.caseSize.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Built in Fans : ' + widget.numOfFans.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        widget.wattageORpowerout != 0
            ? Text(
                'Power Consumption: ' +
                    widget.wattageORpowerout.toString() +
                    ' watts',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              )
            : Text(
                'Power Consumption: No Power Consumption',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget cooling() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Cooler Type : ' + widget.coolingType.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            Text(
              'Fan RPM : ' + widget.fanRPM.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Airflow: ' + widget.fanAirflow.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Power Consumption: ' +
              widget.wattageORpowerout.toString() +
              ' watts',
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Additional Information : \n' + widget.specs.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }
}
