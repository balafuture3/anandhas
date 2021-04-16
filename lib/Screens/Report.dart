
import 'dart:convert';
import 'dart:io';

import 'package:anandhasapp/Models/ReportsModel.dart';
import 'package:anandhasapp/Models/ResponseModelList1.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:connectivity/connectivity.dart';
import 'package:excel/excel.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';



class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  bool loading=false;

  String dateupload;
  TextEditingController EndDateController = new TextEditingController();
  TextEditingController StartDateController = new TextEditingController();
  TextEditingController EndDateController1 = new TextEditingController();
  TextEditingController StartDateController1 = new TextEditingController();
  TextEditingController EndDateController2 = new TextEditingController();
  TextEditingController StartDateController2 = new TextEditingController();
  TextEditingController EndDateController3 = new TextEditingController();
  TextEditingController StartDateController3 = new TextEditingController();
  CalendarController calenderController = new CalendarController();
  String dateupload1;
  String dateupload2;
  String dateupload3;
  String dateupload4;
  String dateupload5;
  String dateupload6;
  String dateupload7;

  ReportsModelList li6;

  ReportsModelList li8;
  ResponseModelListings1 li7;

  ReportsModelList li9;

  ReportsModelList li10;

  double cashcount=0;

  double cardcount=0;

  ResponseModelListings1 li11;

  ReportsModelList li12;

  Excel excel;


  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
  Future<http.Response> SalesReportList() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload}</FromDate> 
  <ToDate>${dateupload1}</ToDate> 
  <FormId>1</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li6 = ReportsModelList.fromJson(decoded);


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
  Future<http.Response> PO_Advance() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload2}</FromDate> 
  <ToDate>${dateupload3}</ToDate> 
  <FormId>2</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li7 = ResponseModelListings1.fromJson(decoded);


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
  Future<http.Response> PO_Ondate_Sales_Settlement() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload2}</FromDate> 
  <ToDate>${dateupload3}</ToDate> 
  <FormId>6</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li11 = ResponseModelListings1.fromJson(decoded);


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
  Future<http.Response> PO_Advance_fullsettlement() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload2}</FromDate> 
  <ToDate>${dateupload3}</ToDate> 
  <FormId>3</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li8 = ReportsModelList.fromJson(decoded);


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
  Future<http.Response> BalanceOrderAmountFullPaid() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload2}</FromDate> 
  <ToDate>${dateupload3}</ToDate> 
  <FormId>4</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li9 = ReportsModelList.fromJson(decoded);


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
  Future<http.Response> ReceivebillsReport() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload4}</FromDate> 
  <ToDate>${dateupload5}</ToDate> 
  <FormId>5</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li10 = ReportsModelList.fromJson(decoded);


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
  Future<http.Response> DiscountReportList() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Body> <IN_MOB_GETREPORTS xmlns="http://tempuri.org/"> 
 <OrderNo>1</OrderNo>
  <FromDate>${dateupload6}</FromDate> 
  <ToDate>${dateupload7}</ToDate> 
  <FormId>7</FormId> 
  <BranchID>${LoginPageState.branchid}</BranchID> 
  </IN_MOB_GETREPORTS> 
  </soap:Body> </soap:Envelope>

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

      li12 = ReportsModelList.fromJson(decoded);


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
    dateupload=DateFormat("yyyy-MM-dd 00:00:00").format(DateTime.now());
    dateupload1=DateFormat("yyyy-MM-dd 23:59:59").format(DateTime.now());
    StartDateController.text=DateFormat("dd-MM-yyyy").format(DateTime.now());
    EndDateController.text=DateFormat("dd-MM-yyyy").format(DateTime.now());
    dateupload2=DateFormat("yyyy-MM-dd 00:00:00").format(DateTime.now());
    dateupload3=DateFormat("yyyy-MM-dd 23:59:59").format(DateTime.now());
    StartDateController1.text=DateFormat("dd-MM-yyyy").format(DateTime.now());
    EndDateController1.text=DateFormat("dd-MM-yyyy").format(DateTime.now());

    dateupload4=DateFormat("yyyy-MM-dd 00:00:00").format(DateTime.now());
    dateupload5=DateFormat("yyyy-MM-dd 23:59:59").format(DateTime.now());
    StartDateController2.text=DateFormat("dd-MM-yyyy").format(DateTime.now());
    EndDateController2.text=DateFormat("dd-MM-yyyy").format(DateTime.now());

    dateupload6=DateFormat("yyyy-MM-dd 00:00:00").format(DateTime.now());
    dateupload7=DateFormat("yyyy-MM-dd 23:59:59").format(DateTime.now());
    StartDateController3.text=DateFormat("dd-MM-yyyy").format(DateTime.now());
    EndDateController3.text=DateFormat("dd-MM-yyyy").format(DateTime.now());

    SalesReportList().then((value) =>
    PO_Advance()).then((value) =>
    PO_Advance_fullsettlement()).then((value) =>
    BalanceOrderAmountFullPaid()).then((value) =>
    ReceivebillsReport()).then((value)=>PO_Ondate_Sales_Settlement().then((value)=>DiscountReportList().then((value)
    {
      cashcount = 0;

      cardcount = 0;
      for (int i = 0; i < li7.details.length; i++) {
        if (li7.details[i].paymentType1.toString().trim() == "Cash")
          cashcount = cashcount + li7.details[i].advanceAmount1;
        else if (li7.details[i].paymentType1.toString().trim() == "Card")
          cardcount = cardcount + li7.details[i].advanceAmount1;
      }
      for (int i = 0; i < li8.details.length; i++) {
        if (li8.details[i].paymentType == "Cash")
          cashcount = cashcount + li8.details[i].advanceAmount;
        else if (li8.details[i].paymentType == "Card")
          cardcount = cardcount + li8.details[i].advanceAmount;
      }
      for (int i = 0; i < li9.details.length; i++) {
        if (li9.details[i].paymentType == "Cash")
          cashcount = cashcount + li9.details[i].advanceAmount;
        else if (li9.details[i].paymentType == "Card")
          cardcount = cardcount + li9.details[i].advanceAmount;
      }
      for (int i = 0; i < li11.details.length; i++) {
        if (li11.details[i].paymentType == "Cash")
          cashcount = cashcount + li11.details[i].advanceAmount;
        else if (li11.details[i].paymentType == "Card")
          cardcount = cardcount + li11.details[i].advanceAmount;
      }

    })));
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: TabBarView(


              children: [
                Scaffold(
      body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 55,
                    width: width/2.2,

                    child: TextField(
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context)
                            .requestFocus(new FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(new Duration(days: 365 * 120)),
                            lastDate: DateTime.now()
                                .add(new Duration(days: 365)));
                        dateupload=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+" 00:00:00";

                        StartDateController.text =date.day.toString().padLeft(2, "0") +
                                        '-' + date.month.toString().padLeft(2, "0") +
                                        '-' +date.year.toString();
                        check().then((value) {
                          if(value)
                            SalesReportList();
                          else
                            Fluttertoast.showToast(msg: "No Internet Connection");
                        });

                      },
                      enabled: true,
                      controller: StartDateController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                        labelText: 'Start Date',
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
                    height: 55,
                    width: width/2.2,

                    child: TextField(
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context)
                            .requestFocus(new FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(new Duration(days: 365 * 120)),
                            lastDate: DateTime.now()
                                .add(new Duration(days: 365)));

                        dateupload1=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+' 23:59:59';

                        EndDateController.text =
                            date.day.toString().padLeft(2, "0") +
                                '-' + date.month.toString().padLeft(2, "0") +
                                '-' +date.year.toString();
                        check().then((value) {
                          if(value)
                            SalesReportList();
                          else
                            Fluttertoast.showToast(msg: "No Internet Connection");
                        });
                      },
                      enabled: true,
                      controller: EndDateController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                        labelText: 'End Date',
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
SizedBox(height: height/40,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(

                sortColumnIndex: 0,
                columnSpacing: width / 20,
                columns: [
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              "Order No",
                              softWrap: true,
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("Name",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("GST No",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("Bill Date",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("Bill Amount",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),

                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("Advance",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("Discount",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),
                  DataColumn(
                    label: Center(
                        child: Wrap(
                          direction: Axis.vertical, //default
                          alignment: WrapAlignment.center,
                          children: [
                            Text("Balance Receivable",
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    numeric: false,

                    // onSort: (columnIndex, ascending) {
                    //   onSortColum(columnIndex, ascending);
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    // }
                  ),

                ],
                rows: li6.details
                    .map(
                      (list) => DataRow(cells: [
                    DataCell(Center(
                        child: Center(
                          child: Wrap(
                              direction: Axis.vertical, //default
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  list.orderNo.toString(),
                                  textAlign: TextAlign.center,
                                )
                              ]),
                        ))),
                        DataCell(Center(
                            child: Center(
                              child: Wrap(
                                  direction: Axis.vertical, //default
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(
                                      list.name.toString(),
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                            ))),
                    DataCell(Center(
                        child: Center(
                          child: Wrap(
                              direction: Axis.vertical, //default
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                    list.invNo.toString() ,
                                    textAlign: TextAlign.center)
                              ]),
                        ))),
                    DataCell(
                      Center(
                          child: Center(
                              child: Wrap(
                                  direction: Axis.vertical, //default
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                        textAlign: TextAlign.center)
                                  ]))),
                    ),

                    DataCell(
                      Center(
                          child: Center(
                              child: Wrap(
                                  direction: Axis.vertical, //default
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(list.orderPrice.toString(),
                                        textAlign: TextAlign.center)
                                  ]))),
                    ),

                        DataCell(
                          Center(
                              child: Center(
                                  child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("${list.advanceAmount}",
                                            textAlign: TextAlign.center)
                                      ]))),
                        ),
                        DataCell(
                          Center(
                              child: Center(
                                  child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("${list.disAmount}",
                                            textAlign: TextAlign.center)
                                      ]))),
                        ),
                        DataCell(
                          Center(
                              child: Center(
                                  child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                            textAlign: TextAlign.center)
                                      ]))),
                        ),

                  ]),
                )
                    .toList(),
              ),
            ),


          ],
        ),
      ),
                  floatingActionButton: FloatingActionButton.extended(onPressed: () async {

                     excel = Excel.createExcel();
                    Sheet sheetObject = excel['Sales Report'];

                     CellStyle cellStyle = CellStyle(
                       bold: true,
                       italic: true,
                       textWrapping: TextWrapping.WrapText,
                       fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
                       rotation: 0,
                     );

                     var sheet = excel['mySheet'];

                     var cell = sheet.cell(CellIndex.indexByString("A1"));
                     cell.value = "Heya How are you I am fine ok goood night";
                     cell.cellStyle = cellStyle;

                     var cell2 = sheet.cell(CellIndex.indexByString("E5"));
                     cell2.value = "Heya How night";
                     cell2.cellStyle = cellStyle;

                     /// printing cell-type
                     print("CellType: " + cell.cellType.toString());

                     ///
                     ///
                     /// Iterating and changing values to desired type
                     ///
                     ///
                     // for (int row = 0; row < sheet.maxRows; row++) {
                     //   sheet.row(row).forEach((cell1) {
                     //     if (cell1 != null) {
                     //       cell1.value = ' My custom Value ';
                     //     }
                     //   });
                     // }

                     var fileBytes = excel.save();
                     var tempDir;
                     if (Platform.isAndroid) {
                       tempDir = await getExternalStorageDirectory();
                       // Android-specific code
                     } else {
                       tempDir = await getApplicationDocumentsDirectory();
                       // iOS-specific code
                     }
                     String tempPath = tempDir.path;
                     print("$tempPath/text.xlsx");
                     File(join("$tempPath/text.xlsx"))
                       ..createSync(recursive: true)
                       ..writeAsBytesSync(fileBytes);

    },
    icon: Icon(Icons.download_outlined),
    backgroundColor: String_Values.primarycolor,
    label: Text("Download"))

     ),
                Scaffold(
                    body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
                      child: Column(
                        children: [

                          SizedBox(height: height/30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 55,
                                  width: width/2.2,

                                  child: TextField(
                                    onTap: () async {
                                      DateTime date = DateTime(1900);
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());

                                      date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now()
                                              .subtract(new Duration(days: 365 * 120)),
                                          lastDate: DateTime.now()
                                              .add(new Duration(days: 365)));
                                      dateupload2=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+" 00:00:00";

                                      StartDateController1.text =date.day.toString().padLeft(2, "0") +
                                          '-' + date.month.toString().padLeft(2, "0") +
                                          '-' +date.year.toString();
                                      check().then((value) {
                                        if(value)
                                          PO_Advance().then((value) => PO_Advance_fullsettlement() ).then((value) => BalanceOrderAmountFullPaid()).then((value)=>PO_Ondate_Sales_Settlement().then((value)
                                          {
                                            cashcount=0;

                                            cardcount=0;
                                            for(int i=0;i<li7.details.length;i++)
                                            {
                                              if(li7.details[i].paymentType1.toString().trim()=="Cash")
                                                cashcount=cashcount+li7.details[i].advanceAmount1;
                                              else if(li7.details[i].paymentType1.toString().trim()=="Card")
                                                cardcount=cardcount+li7.details[i].advanceAmount1;
                                            }
                                            for(int i=0;i<li8.details.length;i++)
                                            {
                                              if(li8.details[i].paymentType=="Cash")
                                                cashcount=cashcount+li8.details[i].advanceAmount;
                                              else if(li8.details[i].paymentType=="Card")
                                                cardcount=cardcount+li8.details[i].advanceAmount;
                                            }
                                            for(int i=0;i<li9.details.length;i++)
                                            {
                                              if(li9.details[i].paymentType=="Cash")
                                                cashcount=cashcount+li9.details[i].advanceAmount;
                                              else if(li9.details[i].paymentType=="Card")
                                                cardcount=cardcount+li9.details[i].advanceAmount;
                                            }
                                            for (int i = 0; i < li11.details.length; i++) {
                                              if (li11.details[i].paymentType == "Cash")
                                                cashcount = cashcount + li11.details[i].advanceAmount;
                                              else if (li11.details[i].paymentType == "Card")
                                                cardcount = cardcount + li11.details[i].advanceAmount;
                                            }
                                          }));
                                        else
                                          Fluttertoast.showToast(msg: "No Internet Connection");
                                      });

                                    },
                                    enabled: true,
                                    controller: StartDateController1,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_today_outlined),
                                      labelText: 'Start Date',
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
                                  height: 55,
                                  width: width/2.2,

                                  child: TextField(
                                    onTap: () async {
                                      DateTime date = DateTime(1900);
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());

                                      date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now()
                                              .subtract(new Duration(days: 365 * 120)),
                                          lastDate: DateTime.now()
                                              .add(new Duration(days: 365)));

                                      dateupload3=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+' 23:59:59';

                                      EndDateController1.text =
                                          date.day.toString().padLeft(2, "0") +
                                              '-' + date.month.toString().padLeft(2, "0") +
                                              '-' +date.year.toString();
                                      check().then((value) {
                                        if(value)
                                          PO_Advance().then((value) => PO_Advance_fullsettlement() ).then((value) => BalanceOrderAmountFullPaid()).then((value)=>PO_Ondate_Sales_Settlement().then((value)
                                          {
                                            cashcount=0;

                                            cardcount=0;
                                            for(int i=0;i<li7.details.length;i++)
                                            {
                                              if(li7.details[i].paymentType1.toString().trim()=="Cash")
                                                cashcount=cashcount+li7.details[i].advanceAmount1;
                                              else if(li7.details[i].paymentType1.toString().trim()=="Card")
                                                cardcount=cardcount+li7.details[i].advanceAmount1;
                                            }
                                            for(int i=0;i<li8.details.length;i++)
                                            {
                                              if(li8.details[i].paymentType=="Cash")
                                                cashcount=cashcount+li8.details[i].advanceAmount;
                                              else if(li8.details[i].paymentType=="Card")
                                                cardcount=cardcount+li8.details[i].advanceAmount;
                                            }
                                            for(int i=0;i<li9.details.length;i++)
                                            {
                                              if(li9.details[i].paymentType=="Cash")
                                                cashcount=cashcount+li9.details[i].advanceAmount;
                                              else if(li9.details[i].paymentType=="Card")
                                                cardcount=cardcount+li9.details[i].advanceAmount;
                                            }
                                            for (int i = 0; i < li11.details.length; i++) {
                                              if (li11.details[i].paymentType == "Cash")
                                                cashcount = cashcount + li11.details[i].advanceAmount;
                                              else if (li11.details[i].paymentType == "Card")
                                                cardcount = cardcount + li11.details[i].advanceAmount;
                                            }
                                          }));
                                        else
                                          Fluttertoast.showToast(msg: "No Internet Connection");
                                      });
                                    },
                                    enabled: true,
                                    controller: EndDateController1,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_today_outlined),
                                      labelText: 'End Date',
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
                          SizedBox(height: height/40,),
                          Container(
                            width: width,
                            color: String_Values.primarycolor,
                            padding: EdgeInsets.all(10),
                            child: Text("PO-Advance",style: TextStyle(color: Colors.white),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(

                              sortColumnIndex: 0,
                              columnSpacing: width / 20,
                              columns: [
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text(
                                            "Order No",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Name",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("GST No",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Delivery Date",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Bill Amount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Cash",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Card",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Advance",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Discount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Balance Receivable",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                              ],
                              rows: li7.details
                                  .map(
                                    (list) => DataRow(cells: [
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.orderNo.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.name.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  list.invNo.toString() ,
                                                  textAlign: TextAlign.center)
                                            ]),
                                      ))),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.orderPrice.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                      DataCell(
                                        Center(
                                            child: Center(
                                                child: Wrap(
                                                    direction: Axis.vertical, //default
                                                    alignment: WrapAlignment.center,
                                                    children: [
                                                      Text(list.paymentType1.toString().trim()=="Cash"?list.advanceAmount1.toString():"",
                                                          textAlign: TextAlign.center)
                                                    ]))),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Center(
                                                child: Wrap(
                                                    direction: Axis.vertical, //default
                                                    alignment: WrapAlignment.center,
                                                    children: [
                                                      Text(list.paymentType1.toString().trim()=="Card"?list.advanceAmount1.toString():"",
                                                          textAlign: TextAlign.center)
                                                    ]))),
                                      ),


                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.advanceAmount1}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                ]),
                              )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: height/40,),
                          Container(
                            width: width,
                            color: String_Values.primarycolor,
                            padding: EdgeInsets.all(10),
                            child: Text("PO-Fully Settlement as Advance",style: TextStyle(color: Colors.white),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(

                              sortColumnIndex: 0,
                              columnSpacing: width / 20,
                              columns: [
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text(
                                            "Order No",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Name",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("GST No",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Delivery Date",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Bill Amount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Cash",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Card",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Advance",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Discount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Balance Receivable",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                              ],
                              rows: li8.details
                                  .map(
                                    (list) => DataRow(cells: [
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.orderNo.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.name.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  list.invNo.toString() ,
                                                  textAlign: TextAlign.center)
                                            ]),
                                      ))),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.orderPrice.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.paymentType.toString()=="Cash"?list.advanceAmount.toString():"",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.paymentType.toString()=="Card"?list.advanceAmount.toString():"",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),


                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.advanceAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                ]),
                              )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: height/40,),
                          Container(
                            width: width,
                            color: String_Values.primarycolor,
                            padding: EdgeInsets.all(10),
                            child: Text("PO-Balance Amount Received",style: TextStyle(color: Colors.white),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(

                              sortColumnIndex: 0,
                              columnSpacing: width / 20,
                              columns: [
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text(
                                            "Order No",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Name",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("GST No",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Delivery Date",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Bill Amount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Cash",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Card",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Advance",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Discount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Balance Receivable",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                              ],
                              rows: li9.details
                                  .map(
                                    (list) => DataRow(cells: [
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.orderNo.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.name.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  list.invNo.toString() ,
                                                  textAlign: TextAlign.center)
                                            ]),
                                      ))),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.orderPrice.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.paymentType.toString()=="Cash"?list.advanceAmount.toString():"",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.paymentType.toString()=="Card"?list.advanceAmount.toString():"",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),


                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.advanceAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                ]),
                              )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: height/40,),
                          Container(
                            width: width,
                            color: String_Values.primarycolor,
                            padding: EdgeInsets.all(10),
                            child: Text("PO-Ondate Sales and Settlement",style: TextStyle(color: Colors.white),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(

                              sortColumnIndex: 0,
                              columnSpacing: width / 20,
                              columns: [
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text(
                                            "Order No",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Name",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("GST No",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Delivery Date",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Bill Amount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Cash",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Card",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Advance",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Discount",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Balance Receivable",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),

                              ],
                              rows: li11.details
                                  .map(
                                    (list) => DataRow(cells: [
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.orderNo.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.name.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  list.invNo.toString() ,
                                                  textAlign: TextAlign.center)
                                            ]),
                                      ))),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.orderPrice.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.paymentType.toString()=="Cash"?list.advanceAmount.toString():"",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.paymentType.toString()=="Card"?list.advanceAmount.toString():"",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),


                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.advanceAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),

                                ]),
                              )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: height/40,),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Card Total:",style: TextStyle(color: String_Values.primarycolor,fontWeight: FontWeight.w800),),
                                    Text("$cardcount",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Cash Total:",style: TextStyle(color: String_Values.primarycolor,fontWeight: FontWeight.w800),),
                                    Text("$cashcount",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),

                                  ],
                                ),
                              ),],
                          ),
                          SizedBox(height: height/40,),

                        ],
                      ),
                    ),
                    ),
                Scaffold(
                  body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height: height/30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 55,
                                width: width/2.2,

                                child: TextField(
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now()
                                            .subtract(new Duration(days: 365 * 120)),
                                        lastDate: DateTime.now()
                                            .add(new Duration(days: 365)));
                                    dateupload4=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+" 00:00:00";

                                    StartDateController2.text =date.day.toString().padLeft(2, "0") +
                                        '-' + date.month.toString().padLeft(2, "0") +
                                        '-' +date.year.toString();
                                    check().then((value) {
                                      if(value)
                                        ReceivebillsReport();
                                      else
                                        Fluttertoast.showToast(msg: "No Internet Connection");
                                    });

                                  },
                                  enabled: true,
                                  controller: StartDateController2,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today_outlined),
                                    labelText: 'Start Date',
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
                                height: 55,
                                width: width/2.2,

                                child: TextField(
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now()
                                            .subtract(new Duration(days: 365 * 120)),
                                        lastDate: DateTime.now()
                                            .add(new Duration(days: 365)));

                                    dateupload5=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+' 23:59:59';

                                    EndDateController2.text =
                                        date.day.toString().padLeft(2, "0") +
                                            '-' + date.month.toString().padLeft(2, "0") +
                                            '-' +date.year.toString();
                                    check().then((value) {
                                      if(value)
                                        ReceivebillsReport();
                                      else
                                        Fluttertoast.showToast(msg: "No Internet Connection");
                                    });
                                  },
                                  enabled: true,
                                  controller: EndDateController2,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today_outlined),
                                    labelText: 'End Date',
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
                        SizedBox(height: height/40,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(

                            sortColumnIndex: 0,
                            columnSpacing: width / 20,
                            columns: [
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Order No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Name",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("GST No",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Bill Date",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Bill Amount",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Advance",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Discount",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Balance Receivable",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                            ],
                            rows: li10.details
                                .map(
                                  (list) => DataRow(cells: [
                                DataCell(Center(
                                    child: Center(
                                      child: Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                              list.orderNo.toString(),
                                              textAlign: TextAlign.center,
                                            )
                                          ]),
                                    ))),
                                DataCell(Center(
                                    child: Center(
                                      child: Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                              list.name.toString(),
                                              textAlign: TextAlign.center,
                                            )
                                          ]),
                                    ))),
                                DataCell(Center(
                                    child: Center(
                                      child: Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                                list.invNo.toString() ,
                                                textAlign: TextAlign.center)
                                          ]),
                                    ))),
                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),

                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text(list.orderPrice.toString(),
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),

                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${list.advanceAmount}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),
                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${list.disAmount}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),
                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),

                              ]),
                            )
                                .toList(),
                          ),
                        ),


                      ],
                    ),
                  ),

                ),
                Scaffold(
                  body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height: height/30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 55,
                                width: width/2.2,

                                child: TextField(
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now()
                                            .subtract(new Duration(days: 365 * 120)),
                                        lastDate: DateTime.now()
                                            .add(new Duration(days: 365)));
                                    dateupload6=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+" 00:00:00";

                                    StartDateController3.text =date.day.toString().padLeft(2, "0") +
                                        '-' + date.month.toString().padLeft(2, "0") +
                                        '-' +date.year.toString();
                                    check().then((value) {
                                      if(value)
                                        DiscountReportList();
                                      else
                                        Fluttertoast.showToast(msg: "No Internet Connection");
                                    });

                                  },
                                  enabled: true,
                                  controller: StartDateController3,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today_outlined),
                                    labelText: 'Start Date',
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
                                height: 55,
                                width: width/2.2,

                                child: TextField(
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now()
                                            .subtract(new Duration(days: 365 * 120)),
                                        lastDate: DateTime.now()
                                            .add(new Duration(days: 365)));

                                    dateupload7=date.year.toString()+'-'+date.month.toString().padLeft(2, "0")+'-'+date.day.toString().padLeft(2, "0")+' 23:59:59';

                                    EndDateController3.text =
                                        date.day.toString().padLeft(2, "0") +
                                            '-' + date.month.toString().padLeft(2, "0") +
                                            '-' +date.year.toString();
                                    check().then((value) {
                                      if(value)
                                        DiscountReportList();
                                      else
                                        Fluttertoast.showToast(msg: "No Internet Connection");
                                    });
                                  },
                                  enabled: true,
                                  controller: EndDateController3,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today_outlined),
                                    labelText: 'End Date',
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
                        SizedBox(height: height/40,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(

                            sortColumnIndex: 0,
                            columnSpacing: width / 20,
                            columns: [
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Order No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Name",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("GST No",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Bill Date",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Bill Amount",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Advance",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Discount",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text("Balance Receivable",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                            ],
                            rows: li12.details
                                .map(
                                  (list) => DataRow(cells: [
                                DataCell(Center(
                                    child: Center(
                                      child: Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                              list.orderNo.toString(),
                                              textAlign: TextAlign.center,
                                            )
                                          ]),
                                    ))),
                                DataCell(Center(
                                    child: Center(
                                      child: Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                              list.name.toString(),
                                              textAlign: TextAlign.center,
                                            )
                                          ]),
                                    ))),
                                DataCell(Center(
                                    child: Center(
                                      child: Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                                list.invNo.toString() ,
                                                textAlign: TextAlign.center)
                                          ]),
                                    ))),
                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),

                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text(list.orderPrice.toString(),
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),

                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${list.advanceAmount}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),
                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${list.disAmount}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),
                                DataCell(
                                  Center(
                                      child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                                                    textAlign: TextAlign.center)
                                              ]))),
                                ),

                              ]),
                            )
                                .toList(),
                          ),
                        ),


                      ],
                    ),
                  ),

                ),
                Container()
                // Scaffold(
                //   body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
                //     child: Column(
                //       children: [
                //
                //         SizedBox(height: height/30,),
                //         TableCalendar(
                //           locale: 'en_US', calendarController: calenderController,
                //           onDaySelected: (DateTime day, List events, List holidays)
                //           {
                //
                //
                //           },
                //         ),
                //         SizedBox(height: height/40,),
                //         SingleChildScrollView(
                //           scrollDirection: Axis.horizontal,
                //           child: DataTable(
                //
                //             sortColumnIndex: 0,
                //             columnSpacing: width / 20,
                //             columns: [
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text(
                //                           "Order No",
                //                           softWrap: true,
                //                           style: TextStyle(fontSize: 12),
                //                           textAlign: TextAlign.center,
                //                         ),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("Name",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("GST No",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("Bill Date",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("Bill Amount",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("Advance",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("Discount",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //               DataColumn(
                //                 label: Center(
                //                     child: Wrap(
                //                       direction: Axis.vertical, //default
                //                       alignment: WrapAlignment.center,
                //                       children: [
                //                         Text("Balance Receivable",
                //                             softWrap: true,
                //                             style: TextStyle(fontSize: 12),
                //                             textAlign: TextAlign.center),
                //                       ],
                //                     )),
                //                 numeric: false,
                //
                //                 // onSort: (columnIndex, ascending) {
                //                 //   onSortColum(columnIndex, ascending);
                //                 //   setState(() {
                //                 //     sort = !sort;
                //                 //   });
                //                 // }
                //               ),
                //
                //             ],
                //             rows: li10.details
                //                 .map(
                //                   (list) => DataRow(cells: [
                //                 DataCell(Center(
                //                     child: Center(
                //                       child: Wrap(
                //                           direction: Axis.vertical, //default
                //                           alignment: WrapAlignment.center,
                //                           children: [
                //                             Text(
                //                               list.orderNo.toString(),
                //                               textAlign: TextAlign.center,
                //                             )
                //                           ]),
                //                     ))),
                //                 DataCell(Center(
                //                     child: Center(
                //                       child: Wrap(
                //                           direction: Axis.vertical, //default
                //                           alignment: WrapAlignment.center,
                //                           children: [
                //                             Text(
                //                               list.name.toString(),
                //                               textAlign: TextAlign.center,
                //                             )
                //                           ]),
                //                     ))),
                //                 DataCell(Center(
                //                     child: Center(
                //                       child: Wrap(
                //                           direction: Axis.vertical, //default
                //                           alignment: WrapAlignment.center,
                //                           children: [
                //                             Text(
                //                                 list.invNo.toString() ,
                //                                 textAlign: TextAlign.center)
                //                           ]),
                //                     ))),
                //                 DataCell(
                //                   Center(
                //                       child: Center(
                //                           child: Wrap(
                //                               direction: Axis.vertical, //default
                //                               alignment: WrapAlignment.center,
                //                               children: [
                //                                 Text("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",
                //                                     textAlign: TextAlign.center)
                //                               ]))),
                //                 ),
                //
                //                 DataCell(
                //                   Center(
                //                       child: Center(
                //                           child: Wrap(
                //                               direction: Axis.vertical, //default
                //                               alignment: WrapAlignment.center,
                //                               children: [
                //                                 Text(list.orderPrice.toString(),
                //                                     textAlign: TextAlign.center)
                //                               ]))),
                //                 ),
                //
                //                 DataCell(
                //                   Center(
                //                       child: Center(
                //                           child: Wrap(
                //                               direction: Axis.vertical, //default
                //                               alignment: WrapAlignment.center,
                //                               children: [
                //                                 Text("${list.advanceAmount}",
                //                                     textAlign: TextAlign.center)
                //                               ]))),
                //                 ),
                //                 DataCell(
                //                   Center(
                //                       child: Center(
                //                           child: Wrap(
                //                               direction: Axis.vertical, //default
                //                               alignment: WrapAlignment.center,
                //                               children: [
                //                                 Text("${list.disAmount}",
                //                                     textAlign: TextAlign.center)
                //                               ]))),
                //                 ),
                //                 DataCell(
                //                   Center(
                //                       child: Center(
                //                           child: Wrap(
                //                               direction: Axis.vertical, //default
                //                               alignment: WrapAlignment.center,
                //                               children: [
                //                                 Text("${list.orderPrice-list.advanceAmount-list.disAmount}",
                //                                     textAlign: TextAlign.center)
                //                               ]))),
                //                 ),
                //
                //               ]),
                //             )
                //                 .toList(),
                //           ),
                //         ),
                //
                //
                //       ],
                //     ),
                //   ),
                //
                // ),

              ]

          ),
        appBar: AppBar(title:Text("Reports"),
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),

        child: Material(
          color: Colors.white,
        // Set the background color of the tab here
        child:TabBar(
          indicatorColor: String_Values.primarycolor,
        indicatorWeight: 5,
        isScrollable: true,

        // indicator: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5), // Creates border
        //     color: Colors.deepOrange),
    tabs: [
      Tab(child: Text("Sales Report",style: TextStyle(color: String_Values.primarycolor),)), Tab(child: Text("Cash Settlement Sheet",style: TextStyle(color: String_Values.primarycolor)),),Tab(child: Text("Receivables",style: TextStyle(color: String_Values.primarycolor),)),Tab(child: Text("Discount Report",style: TextStyle(color: String_Values.primarycolor),)),Tab(child: Text("Order Report",style: TextStyle(color: String_Values.primarycolor),)),],
    ))))));
  }

}
