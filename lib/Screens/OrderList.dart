import 'dart:convert';

import 'package:anandhasapp/Models/OrderModelList.dart';
import 'package:anandhasapp/Screens/OrderDetails.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart'as xml;


class OrderList extends StatefulWidget {
  @override
  OrderListState createState() => OrderListState();
}

class OrderListState extends State<OrderList> {
  bool loading= true;

  OrderListingslList li7;


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
              ListTile(onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(orderid:li7.details[i].orderNum)));

              },leading:CircleAvatar(backgroundImage: AssetImage("oie_6j1FQPSjyTuZ.png",),backgroundColor: Colors.white,),title: Text("ORDRNO${li7.details[i].orderNum.padLeft(3,"0")}",),)



          ],
        ),



      ),
      appBar: AppBar(
        title: Text("Order History"),
      ),
    );
  }
}
