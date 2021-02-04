import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BulkOrder extends StatefulWidget {
  @override
  _BulkOrderState createState() => _BulkOrderState();
}

class _BulkOrderState extends State<BulkOrder> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();

  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist = ["Select", "7 AM", "8 AM", "9 AM"];
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 1, child: Image.asset("logo.jpg")),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Kesari"),
                      Text(
                        "Rs.30",
                        style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: true,
                          decoration: InputDecoration(
                            labelText: 'Enter Qty',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),),
                        keyboardType: TextInputType.number,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 1, child: Image.asset("logo.jpg")),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Idly(set"),
                      Text(
                        "Rs.30",
                        style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'Enter Qty',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),),
                        keyboardType: TextInputType.number,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 1, child: Image.asset("logo.jpg")),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Dosa"),
                      Text(
                        "Rs.30",
                        style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'Enter Qty',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),),
                        keyboardType: TextInputType.number,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 1, child: Image.asset("logo.jpg")),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Pongal"),
                      Text(
                        "Rs.30",
                        style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'Enter Qty',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),),
                        keyboardType: TextInputType.number,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 1, child: Image.asset("logo.jpg")),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Biriyani"),
                      Text(
                        "Rs.30",
                        style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'Enter Qty',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),),
                        keyboardType: TextInputType.number,
                      ),
                    )),

              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(160, 27, 37, 1),
            padding: const EdgeInsets.all(16.0),
            child: Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text("Item Total:"),
                ],
              ),
            ),
          ),


        ]),
      ),
      appBar: AppBar(
          title: Center(
              child: Text(
        "Bulk Order",
        style: TextStyle(fontWeight: FontWeight.w700),
      ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.navigate_next),
        label: Text("Next"),
      ),
    );
  }
}
