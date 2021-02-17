import 'package:anandhasapp/BulkOrder.dart';
import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class Order3 extends StatefulWidget {
  Order3({Key key,this.title});
  String title;
  @override
  _Order3State createState() => _Order3State();
}

class _Order3State extends State<Order3> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist = ["Select", "Card", "Cash", "Cheque"];
  @override
  void initState() {
    // TODO: implement initState
    datefromcontroller.text = "A000123";
    super.initState();
  }

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
        SizedBox(
          height: height / 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left:16,right:8.0,top:8.0,bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Order Code"),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: TextField(
              enabled: true,
              controller: datefromcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today_outlined),
                labelText: 'Order Code',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            )),
        SizedBox(
          height: height / 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left:16,right:8.0,top:8.0,bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Order Price"),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: TextField(
              enabled: true,
              controller: pricecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.money),
                labelText: 'Order Price',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            )),
        SizedBox(
          height: height / 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left:16,right:8.0,top:8.0,bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Advance Type"),
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
                  dropdownValue1 = "Select";
                });
              },
              items: <String>[
                "Select",
                "Advance",
                "Half Advance",
                "Full Advance",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left:16,right:8.0,top:8.0,bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Payment Type"),
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
              value: dropdownValue1,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue1 = newValue;
                });
              },
              items: stringlist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left:16,right:8.0,top:8.0,bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sign here for conformation"),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
          color: Colors.yellow.shade100,
          height: height / 6,
          width: width,
          child: Signature(
            color: Colors.black, // Color of the drawing path
            strokeWidth: 5.0, // with
            backgroundPainter:
                null, // Additional custom painter to draw stuff like watermark
            onSign: null, // Callback called on user pan drawing
            key:
                null, // key that allow you to provide a GlobalKey that'll let you retrieve the image once user has signed
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(160, 27, 37, 1),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: FlatButton(
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white.withOpacity(0),
                            title: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(160, 27, 37, 1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.asset(
                                      "logo.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Text(
                                    "Order Confirmation",
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Are you sure want to confirm your order",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Dashboard()),
                                                    (Route<dynamic> route) => false,
                                              );
                                              // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Dashboard()));

                                            },
                                            child: Text(
                                              "Confirm",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 27, 37, 1)),
                                            ),
                                          )),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Confirm Order",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: FlatButton(
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white.withOpacity(0),
                            title: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(160, 27, 37, 1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.asset(
                                      "logo.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Text(
                                    "Order Cancellation",
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Are you sure want to cancel your order",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Dashboard()),
                                                    (Route<dynamic> route) => false,
                                              );
                                              // Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard()));

                                            },
                                            child: Text(
                                              "Confirm",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 27, 37, 1)),
                                            ),
                                          )),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });

                  },
                  child: Text(
                    "Cancel Order",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ])),
      appBar: AppBar(
          title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
    );
  }
}
