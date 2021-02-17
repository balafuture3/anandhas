import 'package:anandhasapp/BulkOrder.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Order3.dart';

class Order2 extends StatefulWidget {
  @override
  _Order2State createState() => _Order2State();
}

class _Order2State extends State<Order2> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();
  TextEditingController vescontroller = new TextEditingController();
  TextEditingController vehkmcontroller = new TextEditingController();
  TextEditingController vehcostcontroller = new TextEditingController();
  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist = ["Select", "7 AM", "8 AM", "9 AM"];

  var catcheck = false;

  var vescheck = false;

  var vehcheck = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: height / 30,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Catering Service",style: TextStyle(color: Color.fromRGBO(51,155,111,1)),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Need Catering Service person"),
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    catcheck = value;
                  });
                },
                value: catcheck,
                activeColor: Color.fromRGBO(51,155,111,1),
                activeTrackColor: Color.fromRGBO(160,27,37, 0.5),
                inactiveThumbColor: Color.fromRGBO(51,155,111,1),
                inactiveTrackColor: Colors.grey,
              )
            ],
          ),
        ),
        Visibility(
          visible: catcheck,
          child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextField(
                enabled: true,
                controller: datefromcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Enter Person',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: height / 30,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Vessel Set",style: TextStyle(color: Color.fromRGBO(51,155,111,1)),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Need Vessel Set"),
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    vescheck = value;
                  });
                },
                value: vescheck,
                activeColor: Color.fromRGBO(51,155,111,1),
                activeTrackColor: Color.fromRGBO(160,27,37, 0.5),
                inactiveThumbColor: Color.fromRGBO(51,155,111,1),
                inactiveTrackColor: Colors.grey,
              )
            ],
          ),
        ),
        Visibility(
          visible: vescheck,
          child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextField(
                enabled: true,
                controller: vescontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money),
                  labelText: 'Enter Cost',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              )),
        ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Vehicle Section",style: TextStyle(color: Color.fromRGBO(51,155,111,1)),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Need Vehicle Drop"),
                  ),
                  Switch(
                    onChanged: (bool value) {
                      setState(() {
                        vehcheck = value;
                      });
                    },
                    value: vehcheck,
                    activeColor: Color.fromRGBO(51,155,111,1),
                    activeTrackColor: Color.fromRGBO(160,27,37, 0.5),
                    inactiveThumbColor: Color.fromRGBO(51,155,111,1),
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
            ),
            Visibility(
              visible: vehcheck,
              child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    enabled: true,
                    controller: vehkmcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.bike_scooter),
                      labelText: 'Enter KM',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  )),
            ),
            SizedBox(height: height/30,),
            Visibility(
              visible: vehcheck,
              child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    enabled: true,
                    controller: vehcostcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.money),
                      labelText: 'Enter Cost',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  )),
            ),
      ])),
      appBar: AppBar(
          title: Text(
        "Order",
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Order3(title: "Order",)));
        },
        icon: Icon(Icons.navigate_next),backgroundColor:Color.fromRGBO(
          160, 27, 37, 1) ,
        label: Text("Next"),
      ),
    );
  }
}
