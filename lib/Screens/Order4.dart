import 'dart:convert';

import 'package:anandhasapp/Models/Category.dart';
import 'package:anandhasapp/Screens/NewOrderItemChoose .dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'NewOrderChooseCatering.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart' as xml;

import 'OrderSummary.dart';
class Order4 extends StatefulWidget {
  Order4({Key key,this.edit,this.payment,this.id});
  int edit;
  int payment;
  int id;
  @override
  Order4State createState() => Order4State();
}

class Order4State extends State<Order4> {
  bool loading = false;

  CategoryModelList li4;

  static int categoryid;

  static String timeupload;

  var whatapp= true;


  Future<http.Response> categoryRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_CATEGORYMASTER xmlns="http://tempuri.org/">
      <BranchID>1</BranchID>
      <UserID>1</UserID>
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

  static TextEditingController Namecontroller = new TextEditingController();
  static TextEditingController Emailcontroller = new TextEditingController();
  static TextEditingController Mobilecontroller = new TextEditingController();
  static TextEditingController Addresscontroller = new TextEditingController();
  static TextEditingController GSTcontroller = new TextEditingController();
  static TextEditingController Whatsappcontroller = new TextEditingController();
  static TextEditingController Pincodecontroller = new TextEditingController();
  var dropdownValue = "Select Category";
  var dropdownValue1 = "Select Category";
  var stringlist = ["Select Category", "Coimbatore", "Chennai"];


  TimeOfDay time;

  int hour;
  String amrpm;

  @override
  void initState() {
Namecontroller.text="";
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
                    Text("Enter Name *"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
    
                    enabled: true,
                    controller: Namecontroller,
                    textCapitalization:
                    TextCapitalization.sentences,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
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
                    Text("Enter Email"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(

                    enabled: true,
                    controller: Emailcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
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
                    Text("Enter Mobile *"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
maxLength: 10,
                    keyboardType: TextInputType.number,
                    enabled: true,
                    controller: Mobilecontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Mobile',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: whatapp,
                        onChanged: (value) {
                          setState(() {
                            whatapp = value;
                          });
                        }),
                    Text("Whatsapp Same as Mobile")
                  ],
                ),
              ),
              Visibility(
                visible: !whatapp,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter Whatsapp Number"),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: TextField(
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          controller: Whatsappcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Whatsapp Number',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        )),
                  ],
                ),
              ),


              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text("Enter Phone"),
              //     ],
              //   ),
              // ),
              // Padding(
              //     padding: const EdgeInsets.only(left: 24, right: 24),
              //     child: TextField(
              //
              //       enabled: true,
              //       controller: Namecontroller,
              //       decoration: InputDecoration(
              //         prefixIcon: Icon(Icons.calendar_today_outlined),
              //         labelText: 'Phone',
              //         hintStyle: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 16.0,
              //         ),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25.0),
              //         ),
              //       ),
              //     )),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Enter Address"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
minLines: 3,
                    maxLines: 25,
                    enabled: true,
                    controller: Addresscontroller,
                    textCapitalization:
                    TextCapitalization.sentences,
                    decoration: InputDecoration(

                      prefixIcon: Icon(Icons.place),
                      labelText: 'Address *',
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
                    Text("Enter Pincode"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    enabled: true,
                    controller: Pincodecontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.confirmation_num),
                      labelText: 'Pincode *',
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
                    Text("Enter GST Number"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    textCapitalization:
                    TextCapitalization.characters,
                    enabled: true,
                    controller: GSTcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.money),
                      labelText: 'GSTIN',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  )),
              SizedBox(height: height/6,)


            ])),
        appBar: AppBar(
            title: Text(
              "Order",
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {

          if(whatapp)
            Whatsappcontroller.text=Mobilecontroller.text;
          if (Namecontroller.text.length != 0 &&
              Mobilecontroller.text.length != 0 &&
              Addresscontroller.text.length != 0 &&
                Pincodecontroller.text.length != 0 )
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => OrderSummary(edit: widget.edit,payment: 1,id:widget.id)));
          else
            Fluttertoast.showToast(
                msg: "Please Enter Details",
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