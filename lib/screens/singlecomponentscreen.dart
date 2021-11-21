import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_pcbuildhelper/Services/Add_stockforRetailersService.dart';
import 'package:project_pcbuildhelper/Services/SharedPref.dart';
import 'package:project_pcbuildhelper/screens/addstockforretailers.dart';

class SingleItemView extends StatefulWidget {
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

  SingleItemView({
    @required this.imageURL,
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
  });

  @override
  _SingleItemViewState createState() => _SingleItemViewState();
}

class _SingleItemViewState extends State<SingleItemView> {
  final _formKey = GlobalKey<FormState>();
  AddstockforRetailersService addstock = AddstockforRetailersService();
  int price;
  String availability = 'empty';
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    String email;
    if (Sharedpref.getIsLoggedIn() != null) {
      isLoggedIn = Sharedpref.getIsLoggedIn();
    }
    email = Sharedpref.getEmail();
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // alignment: ,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                                                      'Error' + widget.category,
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 16),
                                                    )),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: fieldText2,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Stock availability ',
                        hintStyle: TextStyle(color: Colors.blue),
                        labelText: 'Availability',
                        labelStyle: TextStyle(color: Colors.blue),
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        availability = value.trim();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: fieldText2,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(color: Colors.blue),
                        labelText: 'Price',
                        labelStyle: TextStyle(color: Colors.blue),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        price = int.parse(value);
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            //Change Button to login or add According to the logged in status
            isLoggedIn == false
                ? GestureDetector(
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    onTap: () {
                      print(Sharedpref.getEmail());
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) => path));
                    },
                  )
                : GestureDetector(
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    onTap: () {
                      //send data to firestore
                      print(Sharedpref.getEmail() +
                          '\n' +
                          Sharedpref.getUserID());
                      if (widget.category == 'CPU') {
                        addstock
                            .addCPU(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.cpuSocket,
                                widget.clockSpeed,
                                widget.coreCount,
                                widget.threadCount,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.clockSpeed.toString() +
                            '\n' +
                            widget.cpuSocket +
                            '\n' +
                            widget.coreCount.toString() +
                            '\n' +
                            widget.threadCount.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'Motherboard') {
                        addstock
                            .addMotherboard(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.cpuSocket,
                                widget.ramType,
                                widget.expansionSlots,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.cpuSocket +
                            '\n' +
                            widget.ramType.toString() +
                            '\n' +
                            widget.expansionSlots.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'GPU') {
                        addstock
                            .addGPU(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.memorysize,
                                widget.clockSpeed,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.clockSpeed.toString() +
                            '\n' +
                            widget.memorysize.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'RAM') {
                        addstock
                            .addRAM(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.ramType,
                                widget.ramORStorageCapacity,
                                widget.ramspeed,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.ramType +
                            '\n' +
                            widget.ramspeed.toString() +
                            '\n' +
                            widget.ramORStorageCapacity.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'Storage') {
                        addstock
                            .addStorage(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.storageType,
                                widget.storageConnector,
                                widget.ramORStorageCapacity,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.storageType +
                            '\n' +
                            widget.storageConnector +
                            '\n' +
                            widget.ramORStorageCapacity.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'PSU') {
                        addstock
                            .addPSU(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'Casing') {
                        addstock
                            .addCasing(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.caseSize,
                                widget.numOfFans,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.caseSize +
                            '\n' +
                            widget.numOfFans.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      } else if (widget.category == 'Cooling') {
                        addstock
                            .addCooling(
                                Sharedpref.getUserID(),
                                widget.brand,
                                widget.model,
                                widget.wattageORpowerout,
                                widget.imageURL,
                                widget.coolingType,
                                widget.fanRPM,
                                widget.fanAirflow,
                                widget.specs,
                                availability,
                                price)
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AddStock())));

                        print(widget.category +
                            '\n' +
                            widget.brand +
                            '\n' +
                            widget.model +
                            '\n' +
                            availability +
                            '\n' +
                            price.toString() +
                            '\n' +
                            widget.imageURL +
                            '\n' +
                            widget.coolingType +
                            '\n' +
                            widget.fanRPM.toString() +
                            '\n' +
                            widget.fanAirflow.toString() +
                            '\n' +
                            widget.wattageORpowerout.toString() +
                            '\n' +
                            widget.specs.toString());
                      }

                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) => path));
                    },
                  )
          ],
        ),
      ),
    );
  }

  //  widget.cpuSocket,
  //                         widget.specs,
  //                         widget.coreCount,
  //                         widget.threadCount,
  //                         widget.clockSpeed,
  //                         widget.wattageORpowerout

  // String cpuSocket, specs, int coreCount, threadCount, clockSpeed,
  //     wattageORpowerout

  Widget cpu() {
    return Column(
      children: [
        Text(
          'Socket ' + widget.cpuSocket,
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cores: ' + widget.coreCount.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            SizedBox(
              width: 10,
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
          'Additional Information : \n' + widget.specs,
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget motherboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CPU Socket: ' + widget.cpuSocket.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'RAM Type : ' + widget.ramType.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Expantion Slots: \n' + widget.expansionSlots.toString(),
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

  Widget gpu() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Clock Speed: ' + widget.clockSpeed.toString(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RAM Type : ' + widget.ramType.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'RAM Speed : ' + widget.ramspeed.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'RAM Capacity:' + widget.ramORStorageCapacity.toString() + ' GB',
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

  Widget storage() {
    return Column(
      children: [
        Text(
          'Storage Type :' + widget.storageType.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Connector : ' + widget.storageConnector.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Capacity : ' + widget.ramORStorageCapacity.toString() + ' GB',
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
          'Number of Built in Fans :\n ' + widget.numOfFans.toString(),
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          //TODO check this
          'Power Consumption: ' + widget.wattageORpowerout.toString() == '0'
              ? 'none'
              : widget.wattageORpowerout.toString() + ' watts',
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

  Widget cooling() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cooler Type : ' + widget.coolingType.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            SizedBox(
              width: 10,
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
