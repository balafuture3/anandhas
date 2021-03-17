import 'dart:convert';
import 'dart:math';

import 'package:anandhasapp/Models/BranchModel.dart';
import 'package:anandhasapp/Models/Category.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Models/Login.dart';
import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:anandhasapp/Widgets/AllWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // LoginResponse li;
  bool loading = false;

  static String rolename;
  static String roleid;
  static String token;

  var dropdownValue1= "Select Branch";

  var stringlist =["Select Branch","Coimbatore","Chennai"];

  BranchModelList li2;

  static int branchid=0;

  LoginModel li3;

  CategoryModelList li4;

  ItemModelList li5;

  Future<http.Response> postRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GETUSERLOGIN xmlns="http://tempuri.org/">
      <UserName>${EmailController.text}</UserName>
      <Password>${PasswordController.text}</Password>
      <BranchID>${branchid}</BranchID>
    </IN_MOB_GETUSERLOGIN>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_GETUSERLOGIN';
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
      li3 = LoginModel.fromJson(decoded[0]);
      print(li3.name);

        Fluttertoast.showToast(
            msg:"Login Success",
           toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: String_Values.primarycolor,
            textColor: Colors.white,
            fontSize: 16.0);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Dashboard()),
      );

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

  Future<http.Response> getOrderRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>string</OrderNo>
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

  Future<http.Response> branchRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_LOCATIONMASTER xmlns="http://tempuri.org/">
      <FormID>1</FormID>
      <UserID>1</UserID>
      <LocationID>string</LocationID>
    </IN_MOB_LOCATIONMASTER>
  </soap:Body>
</soap:Envelope>''';
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_LOCATIONMASTER';

    var response = await http.post(url,
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
        },
        body: envelope);
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });

      xml.XmlDocument parsedXml = xml.XmlDocument.parse(response.body);
      print(parsedXml.text);
      final decoded = json.decode(parsedXml.text);
      li2 = BranchModelList.fromJson(decoded);

      setState(() {
        stringlist.clear();
        stringlist.add("Select Branch");
        for(int i=0;i<li2.details.length;i++)
          stringlist.add(li2.details[i].branchName);
      });

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
  Future<bool> setRegistered(rolename, roleid, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rolename', rolename);
    await prefs.setString('token', token);
    await prefs.setString('roleid', roleid);
    await prefs.setBool('seen', true);
    return true;
  }

  TextEditingController EmailController = new TextEditingController();
  static TextEditingController PasswordController = new TextEditingController();

  static IconData toggle = Icons.visibility_off;


  @override
  void initState() {
    branchRequest();
    categoryRequest();
    itemRequest();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [
                    //       String_Values.primarycolor,
                    //       Colors.white70,
                    //       Colors.white70,
                    //       Colors.white70,
                    //       String_Values.primarycolor,
                    //     ]),
                    // borderRadius: BorderRadius.only(
                    //     bottomRight: Radius.circular(width / 3),)
                ),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: height / 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: width / 4, right: width / 4),
                              child: Widgetsfield().myImageAsset("logo.png",
                                  () {}, context, height / 4, width/2)),
                          SizedBox(
                            height: height / 50,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: String_Values.primarycolor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(width/2))),
                      
                    ),     SizedBox(
                      height: height / 50,
                    ),

                    Widgetsfield().myTextField(Icon(Icons.person),
                        EmailController, "User Name", () {}, null),
                    Widgetsfield().myTextField(
                        Icon(Icons.lock),
                        PasswordController,
                        "Password",
                        () {},
                        IconButton(
                          icon: Icon(toggle),
                          onPressed: () {
                            togglestate();
                          },
                        )),
                    SizedBox(
                      height: height / 50,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      padding: const EdgeInsets.only(left:24,right: 24,top: 6,bottom: 6),
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

                              for(int i=0;i<li2.details.length;i++)
                                if(li2.details[i].branchName==newValue)
                                {
                                 branchid=li2.details[i].branchID;
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            padding: EdgeInsets.all(24),
                            child: InkWell(
                                onTap: () {}, child: Text("Forgot Password"))),
                      ],
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Widgetsfield().myButton("Login", () {
                      if(EmailController.text.length!=0&&PasswordController.text.length!=0&&dropdownValue1!="Select Branch")
                      postRequest();
                      else
                        {
                          if(EmailController.text.length==0)
                          Fluttertoast.showToast(
                              msg: "User Name cannot be empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          else if(PasswordController.text.length==0)
                            Fluttertoast.showToast(
                                msg: "Password cannot be empty",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          else
                            Fluttertoast.showToast(
                                msg: "Please select Branch",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                        }
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                    }, width / 2)
                  ],
                ),
              ),
            ),
    );
  }

  void togglestate() {
    setState(() {
      if (toggle == Icons.visibility)
        toggle = Icons.visibility_off;
      else
        toggle = Icons.visibility;
    });
  }

  void action() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}




