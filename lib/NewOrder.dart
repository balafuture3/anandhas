import 'package:anandhasapp/BulkOrder.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();

  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist=["Select","7 AM","8 AM","9 AM"];
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
                  stringlist=["Select","7 AM","8 AM","9 AM"];
                  else if(dropdownValue=="Lunch")
                    stringlist=["Select","12 PM","1 PM","2 PM"];
                  else if(dropdownValue=="Dinner")
                    stringlist=["Select","7 PM","8 PM","9 PM"];
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Select Time"),
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
      ])),
      appBar: AppBar(
          title: Text(
        "Order",
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
      floatingActionButton: FloatingActionButton.extended(onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => BulkOrder(food: dropdownValue,))); },icon: Icon(Icons.navigate_next),backgroundColor:Color.fromRGBO(
          160, 27, 37, 1) ,label: Text("Next"),),
    );
  }
}
