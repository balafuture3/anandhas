import 'dart:convert';

import 'package:anandhasapp/Models/OrderDetail.dart';
import 'package:anandhasapp/Models/OrderIdemDetailModel.dart';
import 'package:anandhasapp/Models/OrderModelList.dart';
import 'package:anandhasapp/Screens/OrderDetails.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart'as xml;

import 'Order2 .dart';
import 'Order3.dart';


class OrderList extends StatefulWidget {
  @override
  OrderListState createState() => OrderListState();
}

class OrderListState extends State<OrderList> {
  bool loading= true;

  OrderListingslList li7;

  OrderDetaillListModel li8;

  OrderItemDetailModelList li9;

  double total;
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

  Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_OrderList xmlns="http://tempuri.org/">
      <ScreenID>1</ScreenID>
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
      li7 = OrderListingslList.fromJson(decoded);
      print(li7.details[0].orderNum);
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
    return Scaffold(
      body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<li7.details.length;i++)
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: ListTile
                  (
                  subtitle: Text("click to view details"),
                  onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(orderid:li7.details[i].orderNum)));

                },trailing:IconButton(icon: Icon(Icons.edit_outlined,color: String_Values.primarycolor,), onPressed: ()
                {
                  OrderRequest(li7.details[i].orderNum).then((value) => OrderItemRequest(li7.details[i].orderNum)).then((value) {

                    if(li8.details[0].cateringService=="Y")
                      Order2State.catcheck=true;
                    else
                      Order2State.catcheck=false;
                    if(li8.details[0].vesselSet=="Y")
                      Order2State.vescheck=true;
                    else
                      Order2State.vescheck=false;
                    if(li8.details[0].vehicle=="Y")
                      Order2State.vehcheck=true;
                    else
                      Order2State.vehcheck=false;
                    Order2State.vehkmcontroller.text=li8.details[0].vehicleKM.toString();
                    Order2State.cnt=int.parse((li8.details[0].cateringAmount/100).round().toString());
                    Order2State.vehcostcontroller.text=li8.details[0].vehicleAmount.round().toString();
                    Order2State.vescontroller.text=li8.details[0].vesselSetAmount.round().toString();
                    Order2State.cntcontroller.text=(li8.details[0].cateringAmount/100).round().toString();
                    print(Order2State.cntcontroller.text);
                    for(int i=0;i<li9.details.length;i++)
                     {
                       Order3State.cnt.clear();
                       Order3State.controllers.clear();
                       Order3State.total=0;
                       for(int i=0;i<li9.details.length;i++) {
                         Order3State.total=Order3State.total+li9.details[i].price;
                         Order3State.cnt.add(li9.details[i].qty.round());
                         Order3State.controllers.add(new TextEditingController());
                         Order3State.controllers[i].text=li9.details[i].qty.round().toString();
                       }
                     }
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            Order3(id:int.parse(li8.details[0].categoryID.toString()),
                              edit: int.parse(li7.details[i].orderNum),)));
                  });
                  },),leading:CircleAvatar(backgroundImage: AssetImage("oie_6j1FQPSjyTuZ.png",),backgroundColor: Colors.white,),title: Text("ORDRNO${li7.details[i].orderNum.padLeft(3,"0")}",style: TextStyle(color: String_Values.primarycolor,fontWeight: FontWeight.w800),),),
              )



          ],
        ),



      ),
      appBar: AppBar(
        title: Text("Order History"),
      ),
    );
  }
}
