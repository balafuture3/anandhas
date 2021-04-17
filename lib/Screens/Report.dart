
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment, Row;
import 'package:anandhasapp/Models/ReportsModel.dart';
import 'package:anandhasapp/Models/ResponseModelList1.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:connectivity/connectivity.dart';
// import 'package:excel/excel.dart';
import 'package:open_file/open_file.dart';
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

  Directory tempDir;

  Future<void> generateExcel() async {
    //Create a Excel document.

    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = false;





// Save the document.
//     final List<int> byte = workbook.saveAsStream();
    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();
// sheet.getRangeByName("B2").setValue(picture);
    //Set data in the worksheet.
    sheet.getRangeByName('A1').columnWidth = 10;
    sheet.getRangeByName('B1').columnWidth = 10;
    sheet.getRangeByName('C1').columnWidth = 10;
    sheet.getRangeByName('D1').columnWidth = 18;
    sheet.getRangeByName('E1').columnWidth = 10;
    sheet.getRangeByName('F1').columnWidth = 10;
    sheet.getRangeByName('G1').columnWidth = 10;
    sheet.getRangeByName('H1').columnWidth = 10;

    sheet.getRangeByName('A1:H1').cellStyle.backColor = '#333F4F';
    sheet.getRangeByName('A1:H1').merge();
    sheet.getRangeByName('B4:D6').merge();

    sheet.getRangeByName('B4').setText('Sales Report');
    sheet.getRangeByName('B4').cellStyle.fontSize = 24;

    // sheet.getRangeByName('B8').setText('BILL TO:');
    // sheet.getRangeByName('B8').cellStyle.fontSize = 9;
    // sheet.getRangeByName('B8').cellStyle.bold = true;
    //
    // sheet.getRangeByName('B9').setText('Abraham Swearegin');
    // sheet.getRangeByName('B9').cellStyle.fontSize = 12;
    //
    // sheet
    //     .getRangeByName('B10')
    //     .setText('United States, California, San Mateo,');
    // sheet.getRangeByName('B10').cellStyle.fontSize = 9;
    //
    // sheet.getRangeByName('B11').setText('9920 BridgePointe Parkway,');
    // sheet.getRangeByName('B11').cellStyle.fontSize = 9;
    //
    // sheet.getRangeByName('B12').setNumber(9365550136);
    // sheet.getRangeByName('B12').cellStyle.fontSize = 9;
    // sheet.getRangeByName('B12').cellStyle.hAlign = HAlignType.left;
    //
    // final Range range1 = sheet.getRangeByName('F8:G8');
    // final Range range2 = sheet.getRangeByName('F9:G9');
    // final Range range3 = sheet.getRangeByName('F10:G10');
    // final Range range4 = sheet.getRangeByName('F11:G11');
    // final Range range5 = sheet.getRangeByName('F12:G12');
    //
    // range1.merge();
    // range2.merge();
    // range3.merge();
    // range4.merge();
    // range5.merge();

    // sheet.getRangeByName('F8').setText('INVOICE#');
    // range1.cellStyle.fontSize = 8;
    // range1.cellStyle.bold = true;
    // range1.cellStyle.hAlign = HAlignType.right;
    //
    // sheet.getRangeByName('F9').setNumber(2058557939);
    // range2.cellStyle.fontSize = 9;
    // range2.cellStyle.hAlign = HAlignType.right;
    //
    // sheet.getRangeByName('F10').setText('DATE');
    // range3.cellStyle.fontSize = 8;
    // range3.cellStyle.bold = true;
    // range3.cellStyle.hAlign = HAlignType.right;
    //
    // sheet.getRangeByName('F11').dateTime = DateTime(2020, 08, 31);
    // sheet.getRangeByName('F11').numberFormat =
    // '[\$-x-sysdate]dddd, mmmm dd, yyyy';
    // range4.cellStyle.fontSize = 9;
    // range4.cellStyle.hAlign = HAlignType.right;
    //
    // range5.cellStyle.fontSize = 8;
    // range5.cellStyle.bold = true;
    // range5.cellStyle.hAlign = HAlignType.right;
    //
    // final Range range6 = sheet.getRangeByName('B15:G15');
    // range6.cellStyle.fontSize = 10;
    // range6.cellStyle.bold = true;
    //
    sheet.getRangeByIndex(8, 2).setText('Order No');
    for(int i=0;i<li6.details.length;i++)
    sheet.getRangeByIndex(9+i, 2).setText(li6.details[i].orderNo);

    sheet.getRangeByIndex(8, 3).setText('Name');
    for(int i=0;i<li6.details.length;i++)
      sheet.getRangeByIndex(9+i, 3).setText(li6.details[i].name);

    sheet.getRangeByIndex(8, 4).setText('Bill Date');
    for(int i=0;i<li6.details.length;i++)
      sheet.getRangeByIndex(9+i, 4).setText("${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(li6.details[i].docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}");

    sheet.getRangeByIndex(8, 5).setText('Bill Amount');
    for(int i=0;i<li6.details.length;i++)
      sheet.getRangeByIndex(9+i, 5).setText(li6.details[i].orderPrice.toString());

    sheet.getRangeByIndex(8, 6).setText('Advance');
    for(int i=0;i<li6.details.length;i++)
      sheet.getRangeByIndex(9+i, 6).setText(li6.details[i].advanceAmount.toString());

    sheet.getRangeByIndex(8, 7).setText('Discount');
    for(int i=0;i<li6.details.length;i++)
      sheet.getRangeByIndex(9+i, 7).setText(li6.details[i].disAmount.toString());

    sheet.getRangeByIndex(8, 8).setText('Balance Receivable');
    for(int i=0;i<li6.details.length;i++)
      sheet.getRangeByIndex(9+i, 8).setText("${li6.details[i].orderPrice-li6.details[i].advanceAmount-li6.details[i].disAmount}");

    // sheet.getRangeByIndex(16, 2).setText('CA-1098');
    // sheet.getRangeByIndex(17, 2).setText('LJ-0192');
    // sheet.getRangeByIndex(18, 2).setText('So-B909-M');
    // sheet.getRangeByIndex(19, 2).setText('FK-5136');
    // // sheet.getRangeByIndex(20, 2).setText('HL-U509');
    //
    // sheet.getRangeByIndex(15, 3).setText('Description');
    // sheet.getRangeByIndex(16, 3).setText('AWC Logo Cap');
    // sheet.getRangeByIndex(17, 3).setText('Long-Sleeve Logo Jersey, M');
    // sheet.getRangeByIndex(18, 3).setText('Mountain Bike Socks, M');
    // sheet.getRangeByIndex(19, 3).setText('ML Fork');
    // sheet.getRangeByIndex(20, 3).setText('Sports-100 Helmet, Black');
    //
    // sheet.getRangeByIndex(15, 3, 15, 4).merge();
    // sheet.getRangeByIndex(16, 3, 16, 4).merge();
    // sheet.getRangeByIndex(17, 3, 17, 4).merge();
    // sheet.getRangeByIndex(18, 3, 18, 4).merge();
    // sheet.getRangeByIndex(19, 3, 19, 4).merge();
    // sheet.getRangeByIndex(20, 3, 20, 4).merge();
    //
    // sheet.getRangeByIndex(15, 5).setText('Quantity');
    // sheet.getRangeByIndex(16, 5).setNumber(2);
    // sheet.getRangeByIndex(17, 5).setNumber(3);
    // sheet.getRangeByIndex(18, 5).setNumber(2);
    // sheet.getRangeByIndex(19, 5).setNumber(6);
    // sheet.getRangeByIndex(20, 5).setNumber(1);
    //
    // sheet.getRangeByIndex(15, 6).setText('Price');
    // sheet.getRangeByIndex(16, 6).setNumber(8.99);
    // sheet.getRangeByIndex(17, 6).setNumber(49.99);
    // sheet.getRangeByIndex(18, 6).setNumber(9.50);
    // sheet.getRangeByIndex(19, 6).setNumber(175.49);
    // sheet.getRangeByIndex(20, 6).setNumber(34.99);
    //
    // sheet.getRangeByIndex(15, 7).setText('Total');
    // sheet.getRangeByIndex(16, 7).setFormula('=E16*F16+(E16*F16)');
    // sheet.getRangeByIndex(17, 7).setFormula('=E17*F17+(E17*F17)');
    // sheet.getRangeByIndex(18, 7).setFormula('=E18*F18+(E18*F18)');
    // sheet.getRangeByIndex(19, 7).setFormula('=E19*F19+(E19*F19)');
    // sheet.getRangeByIndex(20, 7).setFormula('=E20*F20+(E20*F20)');
    // sheet.getRangeByIndex(15, 6, 20, 7).numberFormat = '\$#,##0.00';
    //
    // sheet.getRangeByName('E15:G15').cellStyle.hAlign = HAlignType.right;
    // sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
    // sheet.getRangeByName('B15:G15').cellStyle.bold = true;
    // sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;
    //
    // sheet.getRangeByName('E22:G22').merge();
    // sheet.getRangeByName('E22:G22').cellStyle.hAlign = HAlignType.right;
    // sheet.getRangeByName('E23:G24').merge();
    //
    // final Range range7 = sheet.getRangeByName('E22');
    // final Range range8 = sheet.getRangeByName('E23');
    // range7.setText('TOTAL');
    // range7.cellStyle.fontSize = 8;
    // range8.setFormula('=SUM(G16:G20)');
    // range8.numberFormat = '\$#,##0.00';
    // range8.cellStyle.fontSize = 24;
    // range8.cellStyle.hAlign = HAlignType.right;
    // range8.cellStyle.bold = true;
    //
    // sheet.getRangeByIndex(26, 1).text =
    // '800 Interchange Blvd, Suite 2501, Austin, TX 78721 | support@adventure-works.com';
    // sheet.getRangeByIndex(26, 1).cellStyle.fontSize = 8;
    //
    // final Range range9 = sheet.getRangeByName('A26:H27');
    // range9.cellStyle.backColor = '#ACB9CA';
    // range9.merge();
    // range9.cellStyle.hAlign = HAlignType.center;
    // range9.cellStyle.vAlign = VAlignType.center;
    ByteData data = await rootBundle.load("logo.png");
    List<int> byt = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // final byt = rootBundle.load("logo.png").readAsBytesSync();
    final Picture picture = sheet.pictures.addBase64(3, 4, base64.encode(byt));
    picture.lastRow = 7;
    picture.lastColumn = 8;
    picture.height=200;
    picture.width=200;
//
// //Adding a picture
//     final List<int> bytsafd = File('logo.png').readAsBytesSync();
//     final Picture picture = sheet.pictures.addStream(1, 1, bytsafd);
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    //Get the storage folder location using path_provider package.
    if (Platform.isAndroid) {
      tempDir = await getExternalStorageDirectory();
      // Android-specific code
    } else {
      tempDir = await getApplicationDocumentsDirectory();
      // iOS-specific code
    }
    final String path = tempDir.path;
    final File file = File('$path/output.xlsx');
    await file.writeAsBytes(bytes).then((value) async => await OpenFile.open('$path/output.xlsx'));

    //Launch the file (used open_file package)
    ;
  }


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
                    generateExcel();
     //                Excel excel;
     //                 excel = Excel.createExcel();
     //                Sheet sheetObject = excel['Sales Report'];
     //                sheetObject.appendRow([""]);
     //                sheetObject.appendRow([""]);
     //                sheetObject.appendRow(["OrderNo","Name", "GST No","Bill Date","Bill Amount","Advance","Discount", "Balance Receivable"]);
     //                for(int i=0;i<li6.details.length;i++)
     //                 sheetObject.appendRow([li6.details[i].orderNo, li6.details[i].name, li6.details[i].invNo,"${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(li6.details[i].docDate.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))}",li6.details[i].orderPrice,li6.details[i].advanceAmount,li6.details[i].disAmount,"${li6.details[i].orderPrice-li6.details[i].advanceAmount-li6.details[i].disAmount}"]);
     //
     //                CellStyle cellStyle = CellStyle(backgroundColorHex: "#1AFF1A", fontFamily : getFontFamily(FontFamily.Calibri));
     //
     //                cellStyle.underline = Underline.Single; // or Underline.Double
     //
     //
     //                var cell = sheetObject.cell(CellIndex.indexByString("A3"));
     //                // cell.value = 8; // dynamic values support provided;
     //                cell.cellStyle = cellStyle;
     //                 cell = sheetObject.cell(CellIndex.indexByString("B3"));
     //                cell.cellStyle = cellStyle;
     //                cell = sheetObject.cell(CellIndex.indexByString("C3"));
     //                cell.cellStyle = cellStyle;
     //                cell = sheetObject.cell(CellIndex.indexByString("D3"));
     //                cell.cellStyle = cellStyle;
     //                cell = sheetObject.cell(CellIndex.indexByString("E3"));
     //                cell.cellStyle = cellStyle;
     //                cell = sheetObject.cell(CellIndex.indexByString("F3"));
     //                cell.cellStyle = cellStyle;
     //                cell = sheetObject.cell(CellIndex.indexByString("G3"));
     //                cell.cellStyle = cellStyle;
     //                cell = sheetObject.cell(CellIndex.indexByString("H3"));
     //                cell.cellStyle = cellStyle;
     // //                 var sheet = excel['mySheet'];
     // //
     // //                 var cell = sheet.cell(CellIndex.indexByString("A1"));
     // //                 cell.value = "Heya How are you I am fine ok goood night";
     // //                 cell.cellStyle = cellStyle;
     // //
     // //                 var cell2 = sheet.cell(CellIndex.indexByString("E5"));
     // //                 cell2.value = "Heya How night";
     // //                 cell2.cellStyle = cellStyle;
     // //                 /*
     // // * sheetObject.appendRow(list-iterables);
     // // * sheetObject created by calling - // Sheet sheetObject = excel['SheetName'];
     // // * list-iterables === list of iterables
     // // */
     // //
     // //
     // //
     // //
     // //                 /// printing cell-type
     // //                 print("CellType: " + cell.cellType.toString());
     //
     //                 ///
     //                 ///
     //                 /// Iterating and changing values to desired type
     //                 ///
     //                 ///
     //                 // for (int row = 0; row < sheet.maxRows; row++) {
     //                 //   sheet.row(row).forEach((cell1) {
     //                 //     if (cell1 != null) {
     //                 //       cell1.value = ' My custom Value ';
     //                 //     }
     //                 //   });
     //                 // }
     //
     //                 var fileBytes = excel.save();
     //                 var tempDir;
     //                 if (Platform.isAndroid) {
     //                   tempDir = await getExternalStorageDirectory();
     //                   // Android-specific code
     //                 } else {
     //                   tempDir = await getApplicationDocumentsDirectory();
     //                   // iOS-specific code
     //                 }
     //                 String tempPath = tempDir.path;
     //                 print("$tempPath/text.xlsx");
     //                 File(join("$tempPath/text.xlsx"))
     //                   ..createSync(recursive: true)
     //                   ..writeAsBytesSync(fileBytes);

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

