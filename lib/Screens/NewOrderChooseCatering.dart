import 'dart:convert';
import 'package:anandhasapp/Models/Category.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Screens/OrderSummary.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart' as xml;
import 'Confirmation fooditems screen.dart';
import 'NewOrderItemChoose .dart';
import 'Order4.dart';

class Order2 extends StatefulWidget {
  Order2({Key key, this.id,this.edit});
  int id;
  int edit;
  @override
  Order2State createState() => Order2State();
}

class Order2State extends State<Order2> {
  bool loading=false;

  CategoryModelList li4;

  ItemModelList li5;

  Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GETITEMMASTER xmlns="http://tempuri.org/">
      <BranchID>1</BranchID>
      <CategoryID>1</CategoryID>
      <UserID>1</UserID>
    </IN_MOB_GETITEMMASTER>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_GETITEMMASTER';
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
      li5 = ItemModelList.fromJson(decoded);
      print(li5.details[0].itemName);
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
  TextEditingController datefromcontroller = new TextEditingController();
  static TextEditingController vescontroller = new TextEditingController();
  static TextEditingController controller = new TextEditingController(text: "0");
  static  TextEditingController vehkmcontroller = new TextEditingController();
  static TextEditingController vehcostcontroller = new TextEditingController();
  static TextEditingController cntcontroller = new TextEditingController();
  static var dropdowntype = "Select Delivery Type";
  static var dropdowndelcharge = "Select Delivery Charge";
  var stringlist = ["Select", "7 AM", "8 AM", "9 AM"];
  static int cnt=0;
  static var catcheck = false;

  static var vescheck = false;

  static var vehcheck = false;

  static int personamt=100;
  @override
  void initState() {

    // itemRequest();
    if(widget.edit==0)
    cntcontroller.text="0";
    // TODO: implement initState
    super.initState();
  }
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
                child: Text("Catering Service person"),
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    catcheck = value;
                  });
                },
                value: catcheck,
                activeColor: Color.fromRGBO(51,155,111,1),
                activeTrackColor: Color.fromRGBO(51,155,111, 0.5),
                inactiveThumbColor: Color.fromRGBO(51,155,111,1),
                inactiveTrackColor: Colors.grey,
              )
            ],
          ),
        ),
        Visibility(child:   Card(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Flexible(flex: 3, child: Image.asset("logo.png")),
                  Expanded(
                    flex: 2,
                    child: Column(

                        children: [

                          Column(

                            children: [
                              Container(child: Text("Persons"),height: 30,padding: EdgeInsets.only(top:4),),
                              SizedBox(height: height/50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: InkWell( child: Icon(Icons.remove,color: Colors.red,),onTap: ()
                                    {
                                      setState(()
                                      {
                                        if(cnt!=0)
                                        cnt--;
                                        cntcontroller.text=cnt.toString();
                                      }
                                      );
                                    },),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      height: 30,

                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration
                                          (

                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                        onChanged: (value){
                                          setState(() {
                                            cnt=int.parse(cntcontroller.text);
                                          });
                                        },
                                        onSubmitted: (value)
                                        {
                                          setState(() {
                                            cnt=int.parse(cntcontroller.text);
                                          });
                                        },
                                        enabled:true,
                                        controller: cntcontroller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: InkWell( child: Icon(Icons.add,color: Colors.teal,),onTap: ()
                                    {
                                      setState(() {
                                        cnt++;
                                        cntcontroller.text=cnt.toString();

                                      });

                                    },),
                                  ),

                                ],
                              ),
                            ],
                          )
                        ]
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Enter Amount"),
                        SizedBox(height: height/30,),
                        Container(
                          height: 30,
                          width: width/6,
                          child: TextField(
                            decoration: InputDecoration
                              (

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius
                                    .circular(5.0),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType
                                .number,
                            onChanged: (value) {
                              setState(() {

                              });
                            },
                            enabled: true,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text("Amount"),
                        SizedBox(height: height/30,),
                        Text(
                          "Rs.${(int.parse(cntcontroller.text)*double.parse(controller.text))}",
                          style: TextStyle(color: String_Values.primarycolor,fontWeight: FontWeight.w700,fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ) ,visible: catcheck,),
        // Visibility(
        //   visible: catcheck,
        //   child: Padding(
        //       padding: const EdgeInsets.only(left: 24, right: 24),
        //       child: TextField(
        //         enabled: true,
        //         controller: datefromcontroller,
        //         decoration: InputDecoration(
        //           prefixIcon: Icon(Icons.person),
        //           labelText: 'Enter Person',
        //           hintStyle: TextStyle(
        //             color: Colors.grey,
        //             fontSize: 16.0,
        //           ),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(25.0),
        //           ),
        //         ),
        //       )),
        // ),
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
                child: Text("Vessel Set"),
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    vescheck = value;
                  });
                },
                value: vescheck,
                activeColor: Color.fromRGBO(51,155,111,1),
                activeTrackColor: Color.fromRGBO(51,155,111, 0.5),
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
                keyboardType: TextInputType.number,
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
                  Text("Transport Section",style: TextStyle(color: Color.fromRGBO(51,155,111,1)),),
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
                    child: Text("Transport"),
                  ),
                  Switch(
                    onChanged: (bool value) {
                      setState(() {
                        vehcheck = value;
                      });
                    },
                    value: vehcheck,
                    activeColor: Color.fromRGBO(51,155,111,1),
                    activeTrackColor: Color.fromRGBO(51,155,111, 0.5),
                    inactiveThumbColor: Color.fromRGBO(51,155,111,1),
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
            ),
            Visibility(
              visible: vehcheck,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Delivery Charge",style: TextStyle(color: Color.fromRGBO(51,155,111,1)),),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: vehcheck,
              child: Container(
                height: 80,
                margin: const EdgeInsets.only(left: 24.0, right: 24.0,bottom: 24),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 6, bottom: 6),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    border: new Border.all(color: Colors.black38)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdowndelcharge,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdowndelcharge = newValue;
                        if(newValue=="Free")
                          vehcostcontroller.text="0";
                        else
                          vehcostcontroller.text="";
                        //
                        // for (int i = 0; i < li4.details.length; i++)
                        //   if (li4.details[i].categoryName == newValue) {
                        //     categoryid = li4.details[i].categoryID;
                        //   }
                      });
                    },
                    items: <String>["Select Delivery Charge","Free","Paid"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            // Visibility(
            //   visible: vehcheck,
            //   child: Padding(
            //       padding: const EdgeInsets.only(left: 24, right: 24),
            //       child: TextField(
            //         enabled: true,
            //         controller: vehkmcontroller,
            //         keyboardType: TextInputType.number,
            //         decoration: InputDecoration(
            //           prefixIcon: Icon(Icons.bike_scooter),
            //           labelText: 'Enter KM',
            //           hintStyle: TextStyle(
            //             color: Colors.grey,
            //             fontSize: 16.0,
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(25.0),
            //           ),
            //         ),
            //       )),
            // ),
            Visibility(
              visible: vehcheck,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Delivery Type",style: TextStyle(color: Color.fromRGBO(51,155,111,1)),),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: vehcheck,
              child: Container(
                height: 80,
                margin: const EdgeInsets.only(left: 24.0, right: 24.0,bottom: 24),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 6, bottom: 6),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    border: new Border.all(color: Colors.black38)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdowntype,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdowntype = newValue;
                        //
                        // for (int i = 0; i < li4.details.length; i++)
                        //   if (li4.details[i].categoryName == newValue) {
                        //     categoryid = li4.details[i].categoryID;
                        //   }
                      });
                    },
                    items: <String>["Select Delivery Type","Only Delivery","Delivery and Collection"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            // Visibility(
            //   visible: vehcheck,
            //   child: Padding(
            //       padding: const EdgeInsets.only(left: 24, right: 24),
            //       child: TextField(
            //         enabled: true,
            //         controller: vehkmcontroller,
            //         keyboardType: TextInputType.number,
            //         decoration: InputDecoration(
            //           prefixIcon: Icon(Icons.bike_scooter),
            //           labelText: 'Enter KM',
            //           hintStyle: TextStyle(
            //             color: Colors.grey,
            //             fontSize: 16.0,
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(25.0),
            //           ),
            //         ),
            //       )),
            // ),
            // SizedBox(height: height/30,),
            Visibility(
              visible: vehcheck,
              child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: TextField(
                    enabled: true,
                    keyboardType: TextInputType.number,
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
            SizedBox(height: height/6,)
      ])),
      appBar: AppBar(
          title: Text(
        "Order",
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
if((!catcheck||(cnt!=0))&&((!vescheck||vescontroller.text.length!=0)&&(!vehcheck||((vehcostcontroller.text.length!=0)&&dropdowntype!="Select Delivery Type"&&dropdowndelcharge!="Select Delivery Charge"))))
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderSummary1 (edit: widget.edit,payment: 1,id:widget.id)));
else {
  if(vehcheck) {
    if (dropdowndelcharge == "Select Delivery Charge")
      Fluttertoast.showToast(
          msg: "Please Select Delivery Charge",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    else if (dropdowntype == "Select Delivery Type")
      Fluttertoast.showToast(
          msg: "Please Select Delivery Type",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    else
      Fluttertoast.showToast(
          msg: "Please fill details",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
  }
  else
    Fluttertoast.showToast(
        msg: "Please fill details",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
}
        },
        icon: Icon(Icons.navigate_next),backgroundColor:String_Values.primarycolor,
        label: Text("Next"),
      ),
    );
  }
}
