import 'package:anandhasapp/BulkOrder.dart';
import 'package:anandhasapp/Dashboard.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Hall1.dart';

class HallBooking extends StatefulWidget {
  @override
  _HallBookingState createState() => _HallBookingState();
}

class _HallBookingState extends State<HallBooking> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();

  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist=["Select","7 AM","8 AM","9 AM"];

  bool visible=false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final List<String> imgList = [
      "https://www.shreeanandhaas.com/images/special-menu/2-in-1-Idiyappam.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Garlic-Kesari.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Wheat-Rava-Idly.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Podi-Idly.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Diet-Breakfast.jpg",
    ];
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: height/30,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Select Date"),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:
                        DateTime.now().subtract(new Duration(days: 23725)),
                        lastDate: DateTime.now().add(new Duration(days: 365)));

                    datefromcontroller.text = date.day.toString() +
                        '/' +
                        date.month.toString() +
                        '/' +
                        date.year.toString();
                  },
                  enabled: true,
                  controller: datefromcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    labelText: 'Date',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Select Slot"),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0, right: 24.0),
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  border: new Border.all(color: Colors.black38)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      dropdownValue1="Select";
                      if(dropdownValue=="Breakfast")
                      {
                        visible=true;
                      }
                      else if(dropdownValue=="Lunch")
                      {
                        visible=true;
                      }
                      else if(dropdownValue=="Dinner")
                      {
                        visible=true;
                      }
                    });
                  },
                  items: <String>[
                    'Select',
                    "Breakfast",
                    "Lunch",
                    "Dinner",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: height/40,),
            dropdownValue=="Lunch"?Column(
              children: [
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                    child: Column(
                      children: [
                        Image.asset("andhaashall.jpg",height: 200,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Hall Name : SVVV Hall"),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Count : 100/124 PAX"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Place : Vadavalli"),
                        ),
                        FlatButton(
                          onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                            },
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.only(left:24,right: 24),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                            child: Text(
                                "Book",
                                style: TextStyle(
                                    color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : MAHALIM Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Lakshmi mills"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : GUNA Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 10/456 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Sundharam"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
              ],
            ):dropdownValue=="Breakfast"?Column(
              children: [
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : MAHALIM Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Lakshmi mills"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : GUNA Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 10/456 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Sundharam"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : SVVV Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Vadavalli"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),

              ],
            ):dropdownValue=="Dinner"?Column(
              children: [

                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : GUNA Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 10/456 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Sundharam"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : SVVV Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Vadavalli"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : MAHALIM Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Lakshmi mills"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : SVVV Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Vadavalli"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    width: width,
                    height: 400,
                    child: Card(elevation: 3,
                      child: Column(
                        children: [
                          Image.asset("andhaashall.jpg",height: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Hall Name : MAHALIM Hall"),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Count : 100/124 PAX"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place : Lakshmi mills"),
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Hall1(title:dropdownValue)));

                              },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left:24,right: 24),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      160, 27, 37, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50))),
                              child: Text(
                                  "Book",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),),
                  ),
                ),
              ],
            ):Container()
          ])),
      appBar: AppBar(
          title: Text(
            "Hall Booking",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
       );
  }
}
