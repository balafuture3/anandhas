
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/Order2 .dart';

class Hall1 extends StatefulWidget {
  Hall1({Key key, this.title});
  String title;
  @override
  _Hall1State createState() => _Hall1State();
}

class _Hall1State extends State<Hall1> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();

  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist=["Select","7 AM","8 AM","9 AM"];

  var val1=false;
  var val2=false;
  var val3=false;
  var val4=false;
  var val5=false;
  var val6=false;
  var val7=false;
  var val8=false;
  var val9=false;
  var val10=false;
  var val11=false;
  var val12=false;
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
            ExpansionTile(title: Text("${widget.title} Menu 1",style: TextStyle(color: Color.fromRGBO(51,155,111,1),fontWeight: FontWeight.w700),),
              children:
              [
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Sweets",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sweet Halwa"),
                      Checkbox(value: val1,   onChanged: (bool value) {
                        setState(() {
                          val1 = value;
                        });
                      },  ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ghee Kesari"),
                      Checkbox(value: val2,   onChanged: (bool value) {
                        setState(() {
                          val2 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Special Halwa"),
                      Checkbox(value: val3,   onChanged: (bool value) {
                        setState(() {
                          val3 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Starter",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vadai"),
                      Checkbox(value: val4,   onChanged: (bool value) {
                        setState(() {
                          val4 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Dosa",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Veg Dosa"),
                      Checkbox(value: val5,   onChanged: (bool value) {
                        setState(() {
                          val5 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Onion Dosa"),
                      Checkbox(value: val6,   onChanged: (bool value) {
                        setState(() {
                          val6 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Masal Dosa"),
                      Checkbox(value: val7,   onChanged: (bool value) {
                        setState(() {
                          val7 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Drinks",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tea"),
                      Checkbox(value: val8,   onChanged: (bool value) {
                        setState(() {
                          val8 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Coffee"),
                      Checkbox(value: val9,   onChanged: (bool value) {
                        setState(() {
                          val9 = value;
                        });
                      },  ),
                    ],
                  ),
                )


              ],),
            SizedBox(height: height/30,),
            ExpansionTile(title: Text("${widget.title} Menu 2",style: TextStyle(color: Color.fromRGBO(51,155,111,1),fontWeight: FontWeight.w700),),
              children:
              [
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Sweets",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sweet Halwa"),
                      Checkbox(value: val1,   onChanged: (bool value) {
                        setState(() {
                          val1 = value;
                        });
                      },  ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ghee Kesari"),
                      Checkbox(value: val2,   onChanged: (bool value) {
                        setState(() {
                          val2 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Special Halwa"),
                      Checkbox(value: val3,   onChanged: (bool value) {
                        setState(() {
                          val3 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Starter",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vadai"),
                      Checkbox(value: val4,   onChanged: (bool value) {
                        setState(() {
                          val4 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Dosa",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Veg Dosa"),
                      Checkbox(value: val5,   onChanged: (bool value) {
                        setState(() {
                          val5 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Onion Dosa"),
                      Checkbox(value: val6,   onChanged: (bool value) {
                        setState(() {
                          val6 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Masal Dosa"),
                      Checkbox(value: val7,   onChanged: (bool value) {
                        setState(() {
                          val7 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Drinks",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tea"),
                      Checkbox(value: val8,   onChanged: (bool value) {
                        setState(() {
                          val8 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Coffee"),
                      Checkbox(value: val9,   onChanged: (bool value) {
                        setState(() {
                          val9 = value;
                        });
                      },  ),
                    ],
                  ),
                )


              ],),
            SizedBox(height: height/30,),
            ExpansionTile(title: Text("${widget.title} Menu 3",style: TextStyle(color: Color.fromRGBO(51,155,111,1),fontWeight: FontWeight.w700),),
              children:
              [
                Container(
                  width: width,
                  color: Color.fromRGBO(51,155,111,1),
                  padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                  child: Text("Sweets",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sweet Halwa"),
                      Checkbox(value: val1,   onChanged: (bool value) {
                        setState(() {
                          val1 = value;
                        });
                      },  ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ghee Kesari"),
                      Checkbox(value: val2,   onChanged: (bool value) {
                        setState(() {
                          val2 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Special Halwa"),
                      Checkbox(value: val3,   onChanged: (bool value) {
                        setState(() {
                          val3 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Starter",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vadai"),
                      Checkbox(value: val4,   onChanged: (bool value) {
                        setState(() {
                          val4 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                    width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Dosa",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Veg Dosa"),
                      Checkbox(value: val5,   onChanged: (bool value) {
                        setState(() {
                          val5 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Onion Dosa"),
                      Checkbox(value: val6,   onChanged: (bool value) {
                        setState(() {
                          val6 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Masal Dosa"),
                      Checkbox(value: val7,   onChanged: (bool value) {
                        setState(() {
                          val7 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  width: width,
                    color: Color.fromRGBO(51,155,111,1),
                    padding: const EdgeInsets.only(left:24,right:8.0,top:8.0,bottom:8.0),
                    child: Text("Drinks",style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tea"),
                      Checkbox(value: val8,   onChanged: (bool value) {
                        setState(() {
                          val8 = value;
                        });
                      },  ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Coffee"),
                      Checkbox(value: val9,   onChanged: (bool value) {
                        setState(() {
                          val9 = value;
                        });
                      },  ),
                    ],
                  ),
                )


              ],),
SizedBox(height: height/2,)
          ])),
      appBar: AppBar(
          title: Text(
            "Hall Booking",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
      floatingActionButton: FloatingActionButton.extended(onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => Order3())); },icon: Icon(Icons.navigate_next),backgroundColor:Color.fromRGBO(
          160, 27, 37, 1) , label: Text("Next"),),
    );
  }
}

