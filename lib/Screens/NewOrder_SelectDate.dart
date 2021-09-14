import 'dart:convert';
import 'package:anandhasapp/Models/Category.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/Screens/NewOrderItemChoose .dart';
import 'package:anandhasapp/Screens/NewOrderItemSearch.dart';
import 'package:anandhasapp/Screens/Order4.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

import 'NewOrderChooseCatering.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart' as xml;
class NewOrder extends StatefulWidget {
  @override
  NewOrderState createState() => NewOrderState();
}

class NewOrderState extends State<NewOrder> {
  bool loading = false;
  CategoryModelList li4;
  static int categoryid;
  static String timeupload;
  static String dateupload;
  Future<http.Response> categoryRequest() async
  {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_CATEGORYMASTER xmlns="http://tempuri.org/">
      <BranchID>${LoginPageState.branchid}</BranchID>
      <UserID>${LoginPageState.roleid}</UserID>
    </IN_MOB_CATEGORYMASTER>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_CATEGORYMASTER';
    // Map data = {
    //   "username": EmailController.text,
    //   "password": PasswordController.text
    // };
//    print("data: ${data}");
//    print(String_values.base_url);

    var response = await http.post(url,
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
        },
        body: envelope);
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });

      xml.XmlDocument parsedXml = xml.XmlDocument.parse(response.body);
      print(parsedXml.text);
      final decoded = json.decode(parsedXml.text);
      li4 = CategoryModelList.fromJson(decoded);
      print(li4.details[0].categoryName);
      setState(() {
        stringlist.clear();
        stringlist.add("Select Category");
        for (int i = 0; i < li4.details.length; i++)
          stringlist.add(li4.details[i].categoryName);
      });

      // if ("li2.name" != null) {
      //   Fluttertoast.showToast(
      //       msg:"",
      //       toastLength: Toast.LENGTH_LONG,
      //       gravity: ToastGravity.SNACKBAR,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: String_Values.primarycolor,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // } else
      //   Fluttertoast.showToast(
      //       msg: "Please check your login details,No users found",
      //       toastLength: Toast.LENGTH_LONG,
      //       gravity: ToastGravity.SNACKBAR,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: String_Values.primarycolor,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Http error!, Response code ${response.statusCode}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: String_Values.primarycolor,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        loading = false;
      });
      print("Retry");
    }
    // print("response: ${response.statusCode}");
    // print("response: ${response.body}");
    return response;
  }
  int _current = 0;
  static TextEditingController datefromcontroller = new TextEditingController();
  static TextEditingController timecontroller = new TextEditingController();
  var dropdownValue = "Select Category";
  static var dropdownValue1 = "Select Category";
  var stringlist = ["Select Category"];
  TimeOfDay time;

  int hour;
  String amrpm;

  @override
  void initState() {
    dropdownValue1 = "Select Category";
    NewOrderState.datefromcontroller.text="";
    NewOrderState.categoryid=0;
    Order2State.cntcontroller.text="0";
    Order2State.vescontroller.text="";
    Order2State.vehcostcontroller.text="";
    Order2State.vehkmcontroller.text="";

    Order4State.Addresscontroller.text="";
    Order4State.Mobilecontroller.text="";
    Order4State.Emailcontroller.text="";
    Order4State.Whatsappcontroller.text="";
    Order4State.Pincodecontroller.text="";
    Order4State.GSTcontroller.text="";
    // Order4State.Emailcontroller.text="";
    timecontroller.text="";
    Order2State.cnt=0;
    categoryRequest();
    time = TimeOfDay.now();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

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
              SizedBox(height: height / 30,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Delivery Date"),
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
                          DateTime.now(),
                          lastDate: DateTime.now().add(
                              new Duration(days: 365)));
                      dateupload=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0");

                      datefromcontroller.text =
                          date.day.toString().padLeft(2, "0") +
                              '-' +
                              date.month.toString().padLeft(2, "0") +
                              '-' +
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
                    Text("Delivery Time"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      time = await showCustomTimePicker(
                        context: context, initialTime: TimeOfDay.now(),);

                      // context: context;,
                      // initialDate: DateTime.now(),
                      // firstDate:
                      // DateTime.now().subtract(new Duration(days: 23725)),
                      // lastDate: DateTime.now().add(new Duration(days: 365)));

                      if (time.hour >= 12) {
                        hour = time.hour - 12;
                        amrpm = 'PM';
                        if (time.hour == 12) {
                          hour = time.hour;
                        }
                      } else {
                        if (time.hour != 0) {
                          hour = time.hour;
                          amrpm = 'AM';
                        } else {
                          hour = 12;
                          amrpm = 'AM';
                        }
                      }
                      timeupload = time.hour.toString().padLeft(2, '0') + ':' +
                          time.minute.toString().padLeft(2, "0")+':00';
                      timecontroller.text = hour.toString().padLeft(2, '0') +
                          ':' +
                          time.minute.toString().padLeft(2, '0') +
                          ' ' +
                          amrpm;
                    },
                    enabled: true,
                    controller: timecontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                      labelText: 'Time',
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
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Category"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24.0, right: 24.0),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 6, bottom: 6),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    border: new Border.all(color: Colors.black38)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue1,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue1 = newValue;

                        for (int i = 0; i < li4.details.length; i++)
                          if (li4.details[i].categoryName == newValue) {
                            categoryid = li4.details[i].categoryID;
                          }
                      });
                    },
                    items: stringlist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 24.0, right: 24.0),
              //   padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              //   decoration: new BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(2.0)),
              //       border: new Border.all(color: Colors.black38)),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton<String>(
              //       isExpanded: true,
              //       value: dropdownValue,
              //       onChanged: (String newValue) {
              //         setState(() {
              //           dropdownValue = newValue;
              //           dropdownValue1="Select";
              //           if(dropdownValue=="Breakfast")
              //           stringlist=["Select","7 AM","8 AM","9 AM"];
              //           else if(dropdownValue=="Lunch")
              //             stringlist=["Select","12 PM","1 PM","2 PM"];
              //           else if(dropdownValue=="Dinner")
              //             stringlist=["Select","7 PM","8 PM","9 PM"];
              //         });
              //       },
              //       items: <String>[
              //         'Select',
              //         "Breakfast",
              //         "Lunch",
              //         "Dinner",
              //       ].map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),


            ])),
        appBar: AppBar(
            title: Text(
              "Order",
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
          if (datefromcontroller.text.length != 0 &&
              timecontroller.text.length != 0 &&
              dropdownValue1 != "Select Category")
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Order3(id: categoryid,edit: 0,)));
          else
            Fluttertoast.showToast(
                msg: "Please fill Date, Time and Category",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
        },
            icon: Icon(Icons.navigate_next),
            backgroundColor: String_Values.primarycolor,
            label: Text("Next")));
  }
}