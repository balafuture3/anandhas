/*
import 'dart:convert';
import 'package:anandhasapp/Models/OrderDetail.dart';
import 'package:anandhasapp/Models/OrderIdemDetailModel.dart';
import 'package:anandhasapp/Models/OrderModelList.dart';
import 'package:anandhasapp/Screens/OrderDetails.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart' as xml;

import 'LoginPage.dart';
import 'NewOrder.dart';
import 'Order2 .dart';
import 'Order3.dart';

class OrderListGST extends StatefulWidget {
  OrderListGST({Key key, this.gst});
  bool gst;
  @override
  OrderListGSTState createState() => OrderListGSTState();
}

class OrderListGSTState extends State<OrderListGST> {
  bool loading = true;
  static int orderflagno;
  static var rowid = [0, 0, 0];
  static var lineid = [0, 0, 0];
  OrderListingslList li7;
  List<FilterList> li2 = new List();
  TextEditingController searchController = new TextEditingController();
  OrderDetaillListModel li8;

  OrderItemDetailModelList li9;

  double total;

  static String orderid;

  Future<http.Response> OrderRequest(id) async {
    setState(() {
      loading = true;
    });

    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${id}</OrderNo>
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

  Future<http.Response> OrderItemRequest(id) async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${id}</OrderNo>
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
        total = 0;
        for (int i = 0; i < li9.details.length; i++)
          total = total + li9.details[i].price;
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

  Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope;
    if(!widget.gst)
      envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_OrderList xmlns="http://tempuri.org/">
      <ScreenID>1</ScreenID>
      <BranchID>${LoginPageState.branchid}</BranchID>
    </IN_MOB_OrderList>
  </soap:Body>
</soap:Envelope>
''';
    else
      envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_OrderList xmlns="http://tempuri.org/">
      <ScreenID>2</ScreenID>
      <BranchID>${LoginPageState.branchid}</BranchID>
    </IN_MOB_OrderList>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_OrderList';
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

      print(decoded);
      li7 = OrderListingslList.fromJson(decoded);


      li2.clear();
      setState(() {

        for (int i = 0; i < li7.details.length; i++)
          li2.add(FilterList(li7.details[i].orderNum,i+1));


      });
      print(li2);
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

  @override
  void initState() {
    itemRequest();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 80,
                child: Row(children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 24.0, right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.grey,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            li2.clear();
                          });
                          for (int i = 0; i <= li7.details.length; i++)
                            if ((i+1).toString()
                                .toLowerCase()
                                .contains(searchController.text
                                .toLowerCase()) ) {
                              setState(() {
                                li2.add(
                                    FilterList(li7.details[i].orderNum,i+1));
                              });
                            }
                        },
                        controller: searchController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search Order here.....',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          prefix: Text("    "),
                          suffix: Text("    "),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            Container(
              height: height-160,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: li2.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: ListTile(
                        subtitle: Text("${DateFormat.jm().format(DateTime.parse("2020-12-12 "+li7.details[li2[i].iteration-1].Time.trim())) },${li7.details[li2[i].iteration-1].Date.trim()}"),
                        onTap: () {

                          orderid=li2[i].orderno;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetails(orderid: li2[i].orderno,gst:widget.gst,invoice: li7.details[i].branchId=="1"?"SPM-${li2[i].iteration.toString().padLeft(3, "0")}":"SPM-${li2[i].iteration.toString().padLeft(3, "0")}")));
                        },

                        //   trailing:IconButton(icon: Icon(Icons.edit_outlined,color: String_Values.primarycolor,), onPressed: ()
                        // {
                        //   OrderRequest(li7.details[i].orderNum).then((value) => OrderItemRequest(li7.details[i].orderNum)).then((value) {
                        //
                        //
                        //
                        //     if(li8.details[0].cateringService=="Y")
                        //       Order2State.catcheck=true;
                        //     else
                        //       Order2State.catcheck=false;
                        //     if(li8.details[0].vesselSet=="Y")
                        //       Order2State.vescheck=true;
                        //     else
                        //       Order2State.vescheck=false;
                        //     if(li8.details[0].vehicle=="Y")
                        //       Order2State.vehcheck=true;
                        //     else
                        //       Order2State.vehcheck=false;
                        //
                        //     Order2State.vehkmcontroller.text=li8.details[0].vehicleKM.toString();
                        //     Order2State.cnt=int.parse((li8.details[0].cateringAmount/100).round().toString());
                        //     Order2State.vehcostcontroller.text=li8.details[0].vehicleAmount.round().toString();
                        //     Order2State.vescontroller.text=li8.details[0].vesselSetAmount.round().toString();
                        //     Order2State.cntcontroller.text=(li8.details[0].cateringAmount/100).round().toString();
                        //     print(Order2State.cntcontroller.text);
                        //     NewOrderState.categoryid=li8.details[0].categoryID;
                        //        Order3State.cnt.clear();
                        //        Order3State.controllers.clear();
                        //        Order3State.total=0;
                        //        rowid.clear();
                        //        lineid.clear();
                        //        for(int i=0;i<li9.details.length;i++) {
                        //         rowid.add( li9.details[i].rowID);
                        //         lineid.add(li9.details[i].lineID);
                        //
                        //          Order3State.total=Order3State.total+li9.details[i].price;
                        //          Order3State.cnt.add(li9.details[i].qty.round());
                        //          Order3State.controllers.add(new TextEditingController());
                        //          Order3State.controllers[i].text=li9.details[i].qty.round().toString();
                        //        }
                        //
                        //     Navigator.push(context, MaterialPageRoute(
                        //         builder: (context) =>
                        //             Order3(id:int.parse(li8.details[0].categoryID.toString()),
                        //               edit: int.parse(li7.details[i].orderNum),)));
                        //   });
                        //   },
                        //   ),
                        leading: Icon(Icons.fastfood,color: String_Values.primarycolor,),
                        title:!widget.gst? Text(
                          "ORDRNO${li2[i].orderno.padLeft(3, "0")}",
                          style: TextStyle(
                              color: String_Values.primarycolor,
                              fontWeight: FontWeight.w800),
                        ):Text(
                          li7.details[i].branchId=="1"?"SPM-${li2[(i)].iteration.toString().padLeft(3, "0")}":Container(),
                          style: TextStyle(
                              color: String_Values.primarycolor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    );}),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Invoice List"),
      ),
    );
  }
}

class FilterList {
  String orderno;
  int iteration;
  FilterList(this.orderno,this.iteration);
}
*/


import 'dart:convert';
import 'package:anandhasapp/Models/OrderDetail.dart';
import 'package:anandhasapp/Models/OrderIdemDetailModel.dart';
import 'package:anandhasapp/Models/OrderModelList.dart';
import 'package:anandhasapp/Screens/OrderDetails.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart' as xml;

import 'LoginPage.dart';
import 'NewOrder.dart';
import 'Order2 .dart';
import 'Order3.dart';
import 'PendingPaymentDetails.dart';

class PendingPayments extends StatefulWidget {
  PendingPayments({Key key, this.gst});
  bool gst;
  @override
  PendingPaymentsState createState() => PendingPaymentsState();
}

class PendingPaymentsState extends State<PendingPayments> {
  bool loading = true;
  static int orderflagno;
  static var rowid = [0, 0, 0];
  static var lineid = [0, 0, 0];
  OrderListingslList li7;
  List<FilterList> li2 = new List();
  TextEditingController searchController = new TextEditingController();
  OrderDetaillListModel li8;

  OrderItemDetailModelList li9;

  double total;

  static String orderid;

  Future<http.Response> OrderRequest(id) async {
    setState(() {
      loading = true;
    });

    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${id}</OrderNo>
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

  Future<http.Response> OrderItemRequest(id) async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${id}</OrderNo>
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
        total = 0;
        for (int i = 0; i < li9.details.length; i++)
          total = total + li9.details[i].price;
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

  Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope;
    if(!widget.gst)
      envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_OrderList xmlns="http://tempuri.org/">
      <ScreenID>3</ScreenID>
      <BranchID>${LoginPageState.branchid}</BranchID>
    </IN_MOB_OrderList>
  </soap:Body>
</soap:Envelope>
''';
    else
      envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_OrderList xmlns="http://tempuri.org/">
      <ScreenID>3</ScreenID>
      <BranchID>${LoginPageState.branchid}</BranchID>
    </IN_MOB_OrderList>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_OrderList';
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

      print(decoded);
      li7 = OrderListingslList.fromJson(decoded);


      li2.clear();
      setState(() {

        for (int i = 0; i < li7.details.length; i++)
          if(li7.details[i].Invoice!="")
            li2.add(FilterList("ORDRNO${li7.details[i].orderNum}/${li7.details[i].Invoice}",li7.details[i].orderNum,"${(DateFormat("hh:mm a , dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(li7.details[i].Date.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }"));
          else
            li2.add(FilterList("ORDRNO${li7.details[i].orderNum}",li7.details[i].orderNum,"${(DateFormat("hh:mm a , dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(li7.details[i].Date.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }"));



      });
      print(li2);
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

  @override
  void initState() {
    itemRequest();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 80,
                child: Row(children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 24.0, right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.grey,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            li2.clear();
                          });
                          for (int i = 0; i <= li7.details.length; i++)
                            if (li7.details[i].Invoice.toString()
                                .toLowerCase()
                                .contains(searchController.text
                                .toLowerCase())||li7.details[i].orderNum.toString()
                                .toLowerCase()
                                .contains(searchController.text
                                .toLowerCase()) ) {
                              setState(() {
                                li7.details[i].Invoice!=""?
                                li2.add(
                                    FilterList("ORDRNO${li7.details[i].orderNum}/${li7.details[i].Invoice}",li7.details[i].orderNum,"${(DateFormat("hh:mm a , dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(li7.details[i].Date.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }")):
                                li2.add( FilterList("ORDRNO${li7.details[i].orderNum}",li7.details[i].orderNum,"${(DateFormat("hh:mm a , dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(li7.details[i].Date.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }"));
                              });
                            }
                        },
                        controller: searchController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search Order here.....',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          prefix: Text("    "),
                          suffix: Text("    "),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            Container(
              height: height-160,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: li2.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: ListTile(
                        subtitle: Text(li2[i].date),
                        onTap: () {

                          orderid=li2[i].InvoiceNo;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PendingPaymentDetails(orderid: li2[i].OrderNo,gst:widget.gst,invoice: li2[i].InvoiceNo)));
                        },


                        //   trailing:IconButton(icon: Icon(Icons.edit_outlined,color: String_Values.primarycolor,), onPressed: ()
                        // {
                        //   OrderRequest(li7.details[i].orderNum).then((value) => OrderItemRequest(li7.details[i].orderNum)).then((value) {
                        //
                        //
                        //
                        //     if(li8.details[0].cateringService=="Y")
                        //       Order2State.catcheck=true;
                        //     else
                        //       Order2State.catcheck=false;
                        //     if(li8.details[0].vesselSet=="Y")
                        //       Order2State.vescheck=true;
                        //     else
                        //       Order2State.vescheck=false;
                        //     if(li8.details[0].vehicle=="Y")
                        //       Order2State.vehcheck=true;
                        //     else
                        //       Order2State.vehcheck=false;
                        //
                        //     Order2State.vehkmcontroller.text=li8.details[0].vehicleKM.toString();
                        //     Order2State.cnt=int.parse((li8.details[0].cateringAmount/100).round().toString());
                        //     Order2State.vehcostcontroller.text=li8.details[0].vehicleAmount.round().toString();
                        //     Order2State.vescontroller.text=li8.details[0].vesselSetAmount.round().toString();
                        //     Order2State.cntcontroller.text=(li8.details[0].cateringAmount/100).round().toString();
                        //     print(Order2State.cntcontroller.text);
                        //     NewOrderState.categoryid=li8.details[0].categoryID;
                        //        Order3State.cnt.clear();
                        //        Order3State.controllers.clear();
                        //        Order3State.total=0;
                        //        rowid.clear();
                        //        lineid.clear();
                        //        for(int i=0;i<li9.details.length;i++) {
                        //         rowid.add( li9.details[i].rowID);
                        //         lineid.add(li9.details[i].lineID);
                        //
                        //          Order3State.total=Order3State.total+li9.details[i].price;
                        //          Order3State.cnt.add(li9.details[i].qty.round());
                        //          Order3State.controllers.add(new TextEditingController());
                        //          Order3State.controllers[i].text=li9.details[i].qty.round().toString();
                        //        }
                        //
                        //     Navigator.push(context, MaterialPageRoute(
                        //         builder: (context) =>
                        //             Order3(id:int.parse(li8.details[0].categoryID.toString()),
                        //               edit: int.parse(li7.details[i].orderNum),)));
                        //   });
                        //   },
                        //   ),
                        leading: Icon(Icons.fastfood,color: String_Values.primarycolor,),
                        title:!widget.gst? Text(
                          "ORDRNO${li2[i].InvoiceNo.padLeft(3, "0")}",
                          style: TextStyle(
                              color: String_Values.primarycolor,
                              fontWeight: FontWeight.w800),
                        ):Text(
                          li2[i].InvoiceNo,
                          style: TextStyle(
                              color: String_Values.primarycolor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    );}),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Pending Payments"),
      ),
    );
  }
}

class FilterList {
  String InvoiceNo;
  String OrderNo;
  String date;
  FilterList(this.InvoiceNo,this.OrderNo,this.date);
}




