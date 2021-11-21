import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_pcbuildhelper/Services/Add_components.dart';

class Add_componentdata extends StatefulWidget {
  const Add_componentdata({Key key}) : super(key: key);

  @override
  _Add_componentdataState createState() => _Add_componentdataState();
}

class _Add_componentdataState extends State<Add_componentdata> {
  final _formKey = GlobalKey<FormState>();
  Add_components addComponents = Add_components();
  String model, brand, imgURL, category;
  String cpu_socket,
      specs,
      ram_slot,
      expansion_slots,
      ram_type,
      storage_type,
      connector,
      cooling_type,
      case_size;

  int wattage,
      clock_speed,
      core_count,
      thread_count,
      memorysize,
      ram_str_capacity,
      ram_speed,
      power_out,
      num_of_fans,
      airflow,
      fan_rpm;

  File selectedImage;
  final _picker = ImagePicker();

  Future getImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Component Data'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(250, 10, 0, 20),
        ),
        backgroundColor: Color.fromARGB(255, 4, 7, 50),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                      _formKey.currentState.reset();
                    });
                  },
                  items: <String>[
                    'CPU',
                    'Motherboard',
                    'GPU',
                    'RAM',
                    'Storage',
                    'PSU',
                    'Casing',
                    'Cooling'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: fieldText1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field is Required';
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
                    hintText: 'Component Brand',
                    hintStyle: TextStyle(color: Colors.blue),
                    labelText: 'Brand',
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    brand = value;
                  },
                ),

                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: fieldText2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field is Required';
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
                    hintText: 'Type the Model here',
                    hintStyle: TextStyle(color: Colors.blue),
                    labelText: 'Model',
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    model = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                //TODO category CPU
                category == 'CPU'
                    ? Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            //controller: fieldText3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Power Usage',
                              hintStyle: TextStyle(color: Colors.blue),
                              labelText: 'Wattage',
                              labelStyle: TextStyle(color: Colors.blue),
                            ),
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              wattage = int.parse(value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            //controller: fieldText3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            // keyboardType: TextInputType.multiline,
                            // textInputAction: TextInputAction.newline,
                            // minLines: 1,
                            // maxLines: 50,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'CPU Socket type',
                              hintStyle: TextStyle(color: Colors.blue),
                              labelText: 'Socket',
                              labelStyle: TextStyle(color: Colors.blue),
                            ),
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) {
                              cpu_socket = value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            //controller: fieldText3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Base Clock Speed',
                              hintStyle: TextStyle(color: Colors.blue),
                              labelText: 'Clock Speed',
                              labelStyle: TextStyle(color: Colors.blue),
                            ),
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              clock_speed = int.parse(value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            //controller: fieldText3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Core count',
                              hintStyle: TextStyle(color: Colors.blue),
                              labelText: 'Core Count',
                              labelStyle: TextStyle(color: Colors.blue),
                            ),
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              core_count = int.parse(value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            //controller: fieldText3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Thread Count',
                              hintStyle: TextStyle(color: Colors.blue),
                              labelText: 'Thread Count',
                              labelStyle: TextStyle(color: Colors.blue),
                            ),
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              thread_count = int.parse(value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            //controller: fieldText3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 50,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Other specs',
                              hintStyle: TextStyle(color: Colors.blue),
                              labelText: 'Other Specs',
                              labelStyle: TextStyle(color: Colors.blue),
                            ),
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) {
                              specs = value;
                            },
                          ),
                        ],
                      )
                    //TODO category gpu
                    : category == 'GPU'
                        ? Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                //controller: fieldText3,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This Field is Required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Power Usage',
                                  hintStyle: TextStyle(color: Colors.blue),
                                  labelText: 'Wattage',
                                  labelStyle: TextStyle(color: Colors.blue),
                                ),
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  wattage = int.parse(value);
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                //controller: fieldText3,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This Field is Required';
                                  }
                                  return null;
                                },

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Memory Size',
                                  hintStyle: TextStyle(color: Colors.blue),
                                  labelText: 'Memory Size',
                                  labelStyle: TextStyle(color: Colors.blue),
                                ),
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  memorysize = int.parse(value);
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                //controller: fieldText3,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This Field is Required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'core Clock Speed',
                                  hintStyle: TextStyle(color: Colors.blue),
                                  labelText: 'GPU Clock Speed',
                                  labelStyle: TextStyle(color: Colors.blue),
                                ),
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  clock_speed = int.parse(value);
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                //controller: fieldText3,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This Field is Required';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 50,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Other Specs',
                                  hintStyle: TextStyle(color: Colors.blue),
                                  labelText: 'Other Specs',
                                  labelStyle: TextStyle(color: Colors.blue),
                                ),
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {
                                  specs = value;
                                },
                              ),
                            ],
                          )
                        //category motherboard fields
                        : category == 'Motherboard'
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    //controller: fieldText3,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This Field is Required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Power Usage',
                                      hintStyle: TextStyle(color: Colors.blue),
                                      labelText: 'Wattage',
                                      labelStyle: TextStyle(color: Colors.blue),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (value) {
                                      wattage = int.parse(value);
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    //controller: fieldText3,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This Field is Required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'CPU socket',
                                      hintStyle: TextStyle(color: Colors.blue),
                                      labelText: 'CPU socket',
                                      labelStyle: TextStyle(color: Colors.blue),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      cpu_socket = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    //controller: fieldText3,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This Field is Required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'RAM slot',
                                      hintStyle: TextStyle(color: Colors.blue),
                                      labelText: 'RAM slot',
                                      labelStyle: TextStyle(color: Colors.blue),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      ram_slot = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    //controller: fieldText3,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This Field is Required';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    minLines: 1,
                                    maxLines: 50,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Expansion Slots',
                                      hintStyle: TextStyle(color: Colors.blue),
                                      labelText: 'Expasion Slots',
                                      labelStyle: TextStyle(color: Colors.blue),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      expansion_slots = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    //controller: fieldText3,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This Field is Required';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    minLines: 1,
                                    maxLines: 50,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Other Specs',
                                      hintStyle: TextStyle(color: Colors.blue),
                                      labelText: 'Other Specs',
                                      labelStyle: TextStyle(color: Colors.blue),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      specs = value;
                                    },
                                  ),
                                ],
                              )

                            //TODO category RAM
                            : category == 'RAM'
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        //controller: fieldText3,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field is Required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'Power Usage',
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          labelText: 'Wattage',
                                          labelStyle:
                                              TextStyle(color: Colors.blue),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          wattage = int.parse(value);
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        //controller: fieldText3,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field is Required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'RAM Type',
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          labelText: 'RAM Type',
                                          labelStyle:
                                              TextStyle(color: Colors.blue),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        onChanged: (value) {
                                          ram_type = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        //controller: fieldText3,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field is Required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'Capacity',
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          labelText: 'Capacity',
                                          labelStyle:
                                              TextStyle(color: Colors.blue),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          ram_str_capacity = int.parse(value);
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        //controller: fieldText3,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field is Required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'Memory Speed',
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          labelText: 'Memory Speed',
                                          labelStyle:
                                              TextStyle(color: Colors.blue),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          ram_speed = int.parse(value);
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        //controller: fieldText3,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field is Required';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.multiline,
                                        textInputAction:
                                            TextInputAction.newline,
                                        minLines: 1,
                                        maxLines: 50,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'Other Specs',
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          labelText: 'Other Specs',
                                          labelStyle:
                                              TextStyle(color: Colors.blue),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        onChanged: (value) {
                                          specs = value;
                                        },
                                      ),
                                    ],
                                  )
                                :
                                //TODO category Storage
                                category == 'Storage'
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            //controller: fieldText3,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This Field is Required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Power Usage',
                                              hintStyle:
                                                  TextStyle(color: Colors.blue),
                                              labelText: 'Wattage',
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            style:
                                                TextStyle(color: Colors.white),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            onChanged: (value) {
                                              wattage = int.parse(value);
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            //controller: fieldText3,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This Field is Required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Storage Type',
                                              hintStyle:
                                                  TextStyle(color: Colors.blue),
                                              labelText: 'Storage Type',
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            style:
                                                TextStyle(color: Colors.white),
                                            onChanged: (value) {
                                              storage_type = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            //controller: fieldText3,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This Field is Required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Connector',
                                              hintStyle:
                                                  TextStyle(color: Colors.blue),
                                              labelText: 'Connector',
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            style:
                                                TextStyle(color: Colors.white),
                                            onChanged: (value) {
                                              connector = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            //controller: fieldText3,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This Field is Required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Storage Capacity',
                                              hintStyle:
                                                  TextStyle(color: Colors.blue),
                                              labelText: 'Capacity',
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            style:
                                                TextStyle(color: Colors.white),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            onChanged: (value) {
                                              ram_str_capacity =
                                                  int.parse(value);
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            //controller: fieldText3,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This Field is Required';
                                              }
                                              return null;
                                            },
                                            keyboardType:
                                                TextInputType.multiline,
                                            textInputAction:
                                                TextInputAction.newline,
                                            minLines: 1,
                                            maxLines: 50,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Other Specs',
                                              hintStyle:
                                                  TextStyle(color: Colors.blue),
                                              labelText: 'Other Specs',
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            style:
                                                TextStyle(color: Colors.white),
                                            onChanged: (value) {
                                              specs = value;
                                            },
                                          ),
                                        ],
                                      )
                                    :
                                    //TODO category PSU
                                    category == 'PSU'
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextFormField(
                                                //controller: fieldText3,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This Field is Required';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  hintText:
                                                      'Maximum Power Output',
                                                  hintStyle: TextStyle(
                                                      color: Colors.blue),
                                                  labelText: 'Wattage',
                                                  labelStyle: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                onChanged: (value) {
                                                  power_out = int.parse(value);
                                                },
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextFormField(
                                                //controller: fieldText3,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This Field is Required';
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.multiline,
                                                textInputAction:
                                                    TextInputAction.newline,
                                                minLines: 1,
                                                maxLines: 50,
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  hintText: 'Other Specs',
                                                  hintStyle: TextStyle(
                                                      color: Colors.blue),
                                                  labelText: 'Other Specs',
                                                  labelStyle: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                                onChanged: (value) {
                                                  specs = value;
                                                },
                                              ),
                                            ],
                                          )
                                        :
                                        //TODO category Casing
                                        category == 'Casing'
                                            ? Column(
                                                children: [
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    //controller: fieldText3,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'This Field is Required';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText: 'Power Usage',
                                                      hintStyle: TextStyle(
                                                          color: Colors.blue),
                                                      labelText: 'Wattage',
                                                      labelStyle: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    onChanged: (value) {
                                                      wattage =
                                                          int.parse(value);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    //controller: fieldText3,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'This Field is Required';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText: 'Case Size',
                                                      hintStyle: TextStyle(
                                                          color: Colors.blue),
                                                      labelText: 'Case Size',
                                                      labelStyle: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),

                                                    onChanged: (value) {
                                                      case_size = value;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    //controller: fieldText3,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'This Field is Required';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText:
                                                          'Number of Fans',
                                                      hintStyle: TextStyle(
                                                          color: Colors.blue),
                                                      labelText:
                                                          'Number of Fans',
                                                      labelStyle: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    onChanged: (value) {
                                                      num_of_fans =
                                                          int.parse(value);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    //controller: fieldText3,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'This Field is Required';
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    textInputAction:
                                                        TextInputAction.newline,
                                                    minLines: 1,
                                                    maxLines: 50,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText: 'Other Specs',
                                                      hintStyle: TextStyle(
                                                          color: Colors.blue),
                                                      labelText: 'Other Specs',
                                                      labelStyle: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    onChanged: (value) {
                                                      specs = value;
                                                    },
                                                  ),
                                                ],
                                              )
                                            //TODO category Casing
                                            : category == 'Cooling'
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        //controller: fieldText3,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'This Field is Required';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          hintText:
                                                              'Power Usage',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                          labelText: 'Wattage',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        onChanged: (value) {
                                                          wattage =
                                                              int.parse(value);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        //controller: fieldText3,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'This Field is Required';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          hintText:
                                                              'Cooling Type',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                          labelText:
                                                              'Cooling Type',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        onChanged: (value) {
                                                          cooling_type = value;
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        //controller: fieldText3,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'This Field is Required';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          hintText: 'Fan RPM',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                          labelText: 'Fan RPM',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        onChanged: (value) {
                                                          fan_rpm =
                                                              int.parse(value);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        //controller: fieldText3,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'This Field is Required';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          hintText:
                                                              'Air Flow in CFM',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                          labelText: 'Air Flow',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        onChanged: (value) {
                                                          airflow =
                                                              int.parse(value);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        //controller: fieldText3,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'This Field is Required';
                                                          }
                                                          return null;
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        textInputAction:
                                                            TextInputAction
                                                                .newline,
                                                        minLines: 1,
                                                        maxLines: 50,
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          hintText:
                                                              'Other Specs',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                          labelText:
                                                              'Other Specs',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        onChanged: (value) {
                                                          specs = value;
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : Text(''),
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

                      if (_formKey.currentState.validate()) {
                        // If the form is valid, send the data to the forestore
                        if (category == 'CPU') {
                          addComponents.addCPU(
                              selectedImage,
                              brand,
                              model,
                              wattage,
                              cpu_socket,
                              clock_speed,
                              core_count,
                              thread_count,
                              specs);
                        } else if (category == 'Motherboard') {
                          addComponents.addMotherboard(
                              selectedImage,
                              brand,
                              model,
                              wattage,
                              cpu_socket,
                              ram_slot,
                              expansion_slots,
                              specs);
                        } else if (category == 'GPU') {
                          addComponents.addGPU(selectedImage, brand, model,
                              wattage, memorysize, clock_speed, specs);
                        } else if (category == 'RAM') {
                          addComponents.addRAM(
                              selectedImage,
                              brand,
                              model,
                              wattage,
                              ram_type,
                              ram_str_capacity,
                              ram_speed,
                              specs);
                        } else if (category == 'Storage') {
                          addComponents.addStorage(
                              selectedImage,
                              brand,
                              model,
                              wattage,
                              storage_type,
                              connector,
                              ram_str_capacity,
                              specs);
                        } else if (category == 'PSU') {
                          addComponents.addPSU(
                              selectedImage, brand, model, power_out, specs);
                        } else if (category == 'Casing') {
                          addComponents.addCasing(selectedImage, brand, model,
                              wattage, case_size, num_of_fans, specs);
                        } else if (category == 'Cooling') {
                          addComponents.addCooling(selectedImage, brand, model,
                              wattage, cooling_type, fan_rpm, airflow, specs);
                        }
                      }

                      ;
                      print('Post button' + category);
                      _formKey.currentState.reset();
                    },
                    label: Text(
                      'Add component',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )),
              ],
            ),
          ),
        ));
  }
}
