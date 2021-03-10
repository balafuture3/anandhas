import 'dart:convert';

import 'package:anandhasapp/Models/InsertOrderResponse.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Models/OrderDetail.dart';
import 'package:anandhasapp/Models/OrderIdemDetailModel.dart';
import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/Screens/NewOrder.dart';
import 'package:anandhasapp/Screens/Order2 .dart';
import 'package:anandhasapp/Screens/Order3.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class OrderDetails extends StatefulWidget {
  OrderDetails({Key key, this.orderid});
  String orderid;
  @override
  OrderDetailsState createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetails> {
  bool loading = false;

  ItemModelList li5;

  var dropdownValue1="Advance Type";

  var stringlist=["Advance Type","Half Advance","Full Advance"];

  var dropdownValue2="Payment Mode";
  var stringlist2=["Payment Mode","Cash","Card","Net Banking"];

  SaveResponse li6;

  String vehtot;

  String vestot;

  String cattot;

  String bookingitem;

  static OrderDetaillListModel li8;

  OrderItemDetailModelList li9;

  double total=0;

  Future<http.Response> OrderRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${widget.orderid}</OrderNo>
       <FormId>1</FormId>
    </IN_MOB_GET_ORDER_NO>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_GET_ORDER_NO';
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
      li8 = OrderDetaillListModel.fromJson(decoded);
      // print(li5.details[0].itemName);
      setState(() {});

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
  Future<http.Response> OrderItemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${widget.orderid}</OrderNo>
       <FormId>2</FormId>
    </IN_MOB_GET_ORDER_NO>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_GET_ORDER_NO';
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
      li9 = OrderItemDetailModelList.fromJson(decoded);
      // print(li5.details[0].itemName);
      setState(() {
        total=0;
for(int i=0;i<li9.details.length;i++)
        total=total+ li9.details[i].price;


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
  Future<http.Response> postRequest() async {

    bookingitem = "";
    for (int i = 0; i < li5.details.length; i++)
      if (Order3State.cnt[i] != 0)
        bookingitem = "$bookingitem<Table1><RowID>0</RowID><LineID>0</LineID><ItemCode>${li5.details[i].itemCode}</ItemCode><ItemName>${li5.details[i].itemName}</ItemName><Qty>${Order3State.cnt[i]}</Qty><UOM></UOM><Price>${((Order3State.cnt[i]) * (((li5.details[i].price*10)/100)+li5.details[i].price)).toString()}</Price></Table1>";

    bookingitem = "<NewDataSet>$bookingitem</NewDataSet>";
    print(bookingitem);
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_INSERT_ORDER xmlns="http://tempuri.org/">
      <DocNo>0</DocNo>
      <OrderDate>${NewOrderState.datefromcontroller.text}</OrderDate>
      <OrderTime>${NewOrderState.timeupload}</OrderTime>      
      <CateringService>${Order2State.catcheck==true?"Y":"N"}</CateringService>
      <CateringAmount>${double.parse(cattot)}</CateringAmount>
      <VaselSet>${Order2State.vescheck==true?"Y":"N"}</VaselSet>
      <VaselAmount>${double.parse(vestot)}</VaselAmount>
      <Vehicle>${Order2State.vehcheck==true?"Y":"N"}</Vehicle>
      <VechicleAmount>${double.parse(vehtot)}</VechicleAmount>
      <OrderPrice>${(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total))}</OrderPrice>
      <AdvanceType>$dropdownValue1</AdvanceType>
      <AdvanceAmount>0</AdvanceAmount>
      <PaymentType>$dropdownValue2</PaymentType>
      <OrderStatus>Pending</OrderStatus>
      <Branch>${LoginPageState.branchid}</Branch>
      <Remarks></Remarks>
      <ItemDetailXML><![CDATA[${bookingitem.toString()}]]></ItemDetailXML>
      <ItemDetailXMLID>1</ItemDetailXMLID>
      <UserID>1</UserID>
    </IN_MOB_INSERT_ORDER>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);

    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_INSERT_ORDER';
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
      if (parsedXml.text != "[]")
      {


        final decoded = json.decode(parsedXml.text);
        li6 = SaveResponse.fromJson(decoded[0]);
        print(li6.sTATUSID);
        if(li6.sTATUSID==1) {
          NewOrderState.datefromcontroller.text="";
          NewOrderState.categoryid=0;
          Order2State.cntcontroller.text="";
          Order2State.vescontroller.text="";
          Order2State.vehcostcontroller.text="";
          Order2State.vehkmcontroller.text="";
          Fluttertoast.showToast(
              msg: "Order Placed Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: String_Values.primarycolor,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Dashboard()), (route) => false);
        }


      } else
        Fluttertoast.showToast(
            msg: "Please check your login details,No users found",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: String_Values.primarycolor,
            textColor: Colors.white,
            fontSize: 16.0);
    } else {

      Fluttertoast.showToast(
          msg: "Http error!, Response code${response.statusCode}, ${response.body} ",
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


  @override
  void initState() {
    OrderRequest().then((value) => OrderItemRequest());

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height / 50,
              ),

              // Container(
              //   margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              //   padding: const EdgeInsets.only(left:24,right: 24,top: 6,bottom: 6),
              //   decoration: new BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
              //       border: new Border.all(color: Colors.black38)),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton<String>(
              //       isExpanded: true,
              //       value: dropdownValue1,
              //       onChanged: (String newValue) {
              //         setState(() {
              //           dropdownValue1 = newValue;
              //
              //
              //
              //         });
              //       },
              //       items: stringlist
              //           .map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text("Select Payment Mode"),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              //   padding: const EdgeInsets.only(left:24,right: 24,top: 6,bottom: 6),
              //   decoration: new BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
              //       border: new Border.all(color: Colors.black38)),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton<String>(
              //       isExpanded: true,
              //       value: dropdownValue2,
              //       onChanged: (String newValue) {
              //         setState(() {
              //           dropdownValue2 = newValue;
              //
              //
              //
              //         });
              //       },
              //       items: stringlist2
              //           .map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: height / 50,
              ),
              ExpansionTile(
                title: Text("Order Summary"),
                initiallyExpanded: true,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text("Order Status",style: TextStyle(color: String_Values.primarycolor),),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  li8.details[0].orderStatus=="P"?"Pending":"Complete",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                      //     child: Column(
                      //       children: [
                      //         // Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         //     children: [
                      //         //       Expanded(flex:4,child: Container()),
                      //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                      //         //     ]),
                      //         // SizedBox(height: 10,),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //
                      //               Expanded(flex:4,child: Container(),),
                      //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                      //
                      //             ]),
                      //       ],
                      //     ))
                    ],
                  ),
                  ListTile(
                    title: Text("Item Details",style: TextStyle(color: String_Values.primarycolor),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Item",
                              textAlign: TextAlign.start,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Qty",
                              textAlign: TextAlign.start,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Amount",
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                  for (int i = 0; i < li9.details.length; i++)
                       Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8.0, bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      li9.details[i].itemName,
                                      textAlign: TextAlign.start,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      li9.details[i].qty.toString(),
                                      textAlign: TextAlign.start,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Rs.${( li9.details[i].price).toString()}",
                                      textAlign: TextAlign.start,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Subtotal",
                                  textAlign: TextAlign.start,
                                )),

                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Rs.${total}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container()),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "GST ( 2.5% CGST + 2.5% SGST )",
                                  textAlign: TextAlign.start,
                                )),

                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Rs.${(total*5)/100}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container()),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Item Total",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                )),

                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Rs.${((total*5)/100)+total}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  li8.details[0].cateringService == "Y"
                      ? Column(
                    children: [
                      ListTile(
                        title: Text("Catering Service",style: TextStyle(color: String_Values.primarycolor),),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8.0, bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Persons",
                                          textAlign: TextAlign.start,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Amount".toString(),
                                          textAlign: TextAlign.start,
                                        )),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "${li8.details[0].cateringAmount/100}",
                                          textAlign: TextAlign.start,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Rs.${li8.details[0].cateringAmount}",
                                          textAlign: TextAlign.start,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : Container(),
                    li8.details[0].vesselSet == "Y"
                      ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text("Vessel Set",style: TextStyle(color: String_Values.primarycolor),),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Rs.${(li8.details[0].vesselSetAmount)}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                      //     child: Column(
                      //       children: [
                      //         // Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         //     children: [
                      //         //       Expanded(flex:4,child: Container()),
                      //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                      //         //     ]),
                      //         // SizedBox(height: 10,),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //
                      //               Expanded(flex:4,child: Container(),),
                      //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                      //
                      //             ]),
                      //       ],
                      //     ))
                    ],
                  )
                      : Container(),
                  li8.details[0].vehicle == "Y"
                      ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text("Vehicle Drop",style: TextStyle(color: String_Values.primarycolor),),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Rs.${(li8.details[0].vehicleAmount)}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                      //     child: Column(
                      //       children: [
                      //         // Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         //     children: [
                      //         //       Expanded(flex:4,child: Container()),
                      //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                      //         //     ]),
                      //         // SizedBox(height: 10,),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //
                      //               Expanded(flex:4,child: Container(),),
                      //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                      //
                      //             ]),
                      //       ],
                      //     ))
                    ],
                  )
                      : Container(),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text("Amount Paid",style: TextStyle(color: String_Values.primarycolor),),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Rs.${(li8.details[0].advanceAmount)}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                      //     child: Column(
                      //       children: [
                      //         // Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         //     children: [
                      //         //       Expanded(flex:4,child: Container()),
                      //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                      //         //     ]),
                      //         // SizedBox(height: 10,),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //
                      //               Expanded(flex:4,child: Container(),),
                      //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                      //
                      //             ]),
                      //       ],
                      //     ))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text("Payment Mode",style: TextStyle(color: String_Values.primarycolor),),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "${(li8.details[0].paymentType)}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                      //     child: Column(
                      //       children: [
                      //         // Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         //     children: [
                      //         //       Expanded(flex:4,child: Container()),
                      //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                      //         //     ]),
                      //         // SizedBox(height: 10,),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //
                      //               Expanded(flex:4,child: Container(),),
                      //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                      //
                      //             ]),
                      //       ],
                      //     ))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text("Advance Type",style: TextStyle(color: String_Values.primarycolor),),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "${(li8.details[0].advanceType)}",
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                      //     child: Column(
                      //       children: [
                      //         // Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         //     children: [
                      //         //       Expanded(flex:4,child: Container()),
                      //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                      //         //     ]),
                      //         // SizedBox(height: 10,),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //
                      //               Expanded(flex:4,child: Container(),),
                      //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                      //
                      //             ]),
                      //       ],
                      //     ))
                    ],
                  ),
                  // li8.details[0].vehicle == "Y"
                  //     ? Column(
                  //   children: [
                  //     ListTile(
                  //       title: Text("Vehicle Drop",style: TextStyle(color: String_Values.primarycolor),),
                  //     ),
                  //     Padding(
                  //         padding: const EdgeInsets.only(
                  //             left: 24, right: 24, top: 8.0, bottom: 8),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //                 mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Expanded(
                  //                       flex: 4,
                  //                       child: Text(
                  //                         "Distance in Kms".toString(),
                  //                         textAlign: TextAlign.start,
                  //                       )),
                  //                   Expanded(
                  //                       flex: 1,
                  //                       child: Text(
                  //                         "Amount".toString(),
                  //                         textAlign: TextAlign.start,
                  //                       )),
                  //                 ]),
                  //             SizedBox(
                  //               height: 10,
                  //             ),
                  //             Row(
                  //                 mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Expanded(
                  //                       flex: 4,
                  //                       child: Text(
                  //                         (int.parse(Order2State
                  //                             .vehkmcontroller.text))
                  //                             .toString(),
                  //                         textAlign: TextAlign.start,
                  //                       )),
                  //                   Expanded(
                  //                       flex: 1,
                  //                       child: Text(
                  //                         "Rs.${(li8.details[0].vehicleAmount).toString()}",
                  //                         textAlign: TextAlign.start,
                  //                       )),
                  //                 ]),
                  //           ],
                  //         ))
                  //   ],
                  // )
                  //     : Container(),
                  SizedBox(height: 10,),
                  Container(
                    color: String_Values.primarycolor.withOpacity(1),
                    padding: const EdgeInsets.only(right:16.0),
                    child: Row(
                      children: [
                        Expanded(flex:4,child: ListTile(title: Text("Total",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),))),
                        Expanded(flex:1,child: Text("Rs.${li8.details[0].orderPrice}",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),)),

                      ],
                    ),
                  ),
                  SizedBox(height: height/6,),
                ],
              )
            ],
          )),
      appBar: AppBar(
          title: Text(
            "Order Summary",
          )),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     if((dropdownValue1!="Advance Type")&&(dropdownValue2!="Payment Mode"))
      //       postRequest();
      //     else
      //       Fluttertoast.showToast(
      //           msg: "Please choose Advance Type and Payment Mode",
      //           toastLength: Toast.LENGTH_SHORT,
      //           gravity: ToastGravity.SNACKBAR,
      //           timeInSecForIosWeb: 1,
      //           backgroundColor: Colors.red,
      //           textColor: Colors.white,
      //           fontSize: 16.0);
      //
      //   },
      //   icon: Icon(Icons.navigate_next),backgroundColor:String_Values.primarycolor,
      //   label: Text("Place Order"),
      // ),
    );
  }
}
