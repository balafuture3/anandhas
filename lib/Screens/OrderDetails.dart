import 'dart:convert';
import 'dart:io';

import 'package:anandhasapp/Models/AdvanceHistoryModel.dart';
import 'package:anandhasapp/Models/InsertOrderResponse.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Models/OrderDetail.dart';
import 'package:anandhasapp/Models/OrderIdemDetailModel.dart';
import 'package:anandhasapp/Models/SaveModel.dart';
import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/Screens/NewOrder.dart';
import 'package:anandhasapp/Screens/Order2 .dart';
import 'package:anandhasapp/Screens/Order3.dart';
import 'package:anandhasapp/Screens/OrderSummary.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';
import 'package:printing/printing.dart';
import 'package:printing/printing.dart';
import 'package:printing/printing.dart';
import 'package:time_picker_widget/time_picker_widget.dart';
import 'package:xml/xml.dart' as xml;

import 'Order4.dart';
import 'OrderList.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key key, this.orderid, this.gst, this.invoice});
  String orderid;
  bool gst;
  String invoice;
  @override
  OrderDetailsState createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetails> {
  bool loading = false;

  ItemModelList li5;

  var dropdownValue1 = "Advance Type";

  TimeOfDay time;

  int hour;
  String amrpm;
  var stringlist = ["Advance Type", "Half Advance", "Full Advance"];

  var dropdownValue2 = "Payment Mode";
  var stringlist2 = ["Payment Mode", "Cash", "Card", "Net Banking"];

  SaveResponse li6;
  static String timeupload;
  static TextEditingController datefromcontroller = new TextEditingController();
  TextEditingController discountcontroller = new TextEditingController();
  static TextEditingController timecontroller = new TextEditingController();
  static String dateupload;
  String vehtot;

  String vestot;

  String cattot;

  String bookingitem;

  static OrderDetaillListModel li8;

  OrderItemDetailModelList li9;

  double total = 0;

  OrderAdvanceHistoryList li10;

  SaveResponse li11;

  SaveModel li18;


  Future<void> generateInvoice() async {
    final pdf = pw.Document();

    var data = await rootBundle.load("open-sans.ttf");

    final ttf = pw.Font.ttf(data.buffer.asByteData());
    const imageProvider = const AssetImage('logo.png');
    final image = await flutterImageProvider(imageProvider);
    // final image = await imageFromAssetBundle('logo.png');
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return  [
            pw.Header(
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [

                        pw.Image(image, width: 150),
                        pw.Text("Taste of Life",
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.right),
                        pw.SizedBox(width: 10, height: 10),
                      ]),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text("Ratnaa Shree Anandhaas Hotels Private Limited",
                            style: pw.TextStyle(
                                fontSize: 14,
                                color: PdfColor.fromHex("339B6F"))),
                        pw.Text("747,Puliakulam Road, P.N. Palayam,",
                            style: pw.TextStyle(fontSize: 12)),
                        pw.Text("Coimbatore 641 037, Tamilnadu,+91 9597210033,",
                            style: pw.TextStyle(fontSize: 12)),
                        pw.Text("GSTIN:33AADCR4127R1Z2  HSN/SAC : 996334,",
                            style: pw.TextStyle(fontSize: 12)),
                        pw.SizedBox(width: 10, height: 10),
                      ]),
                  pw.SizedBox(width: 10, height: 10),
                ])),
            pw.Container(
                padding: pw.EdgeInsets.only(top:10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text("Invoice No : ${widget.invoice}")),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          color: PdfColor.fromHex("339B6F"),
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text("TAX INVOICE",
                                    style: pw.TextStyle(
                                        color: PdfColor.fromHex("FFFFFF")),
                                    textAlign: pw.TextAlign.center)
                              ]),
                        ),
                      ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Container())
                    ])),
            pw.Row(),
            pw.Row(children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Name: ${OrderDetailsState.li8.details[0].name.toString()}",
                  softWrap: true,

                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Date: ${datefromcontroller.text}",
                  softWrap: true,

                ),
              ),

            ],
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween),
            pw.Row(children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Mobile: ${OrderDetailsState.li8.details[0].mobile.toString()}",
                  softWrap: true,

                ),
              ),

              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Time:  ${timecontroller.text}",
                  softWrap: true,

                ),
              ),

            ], mainAxisAlignment: pw.MainAxisAlignment.spaceBetween),
            pw.Divider(thickness: 0.5),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              child:   pw.Text("Order Details",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
          

            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Row(
                mainAxisAlignment:
                pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                      flex: 3,
                      child: pw.Text(
                        "Item",
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text(
                        "Qty",
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text(
                        "Amount",
                        textAlign: pw.TextAlign.center,
                      )),
                ],
              ),
            ),
            pw.Divider(
              thickness: 0.5,
            ),
            for (int j = 0;
            j <= OrderListState.orderflagno;
            j++)
              pw.Column(
                children: [
                  // if(OrderListState.orderflagno!=0)
                  //   Divider(thickness: 2,),
                  if (OrderListState.orderflagno != 0 && j != 0)
                    pw.Column(
                      children: [
                        pw.SizedBox(
                          height: 50,
                        ),
                         pw.Text("Additional Order $j",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 8.0,
                              bottom: 8),
                          child: pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Expanded(
                                  flex: 3,
                                  child: pw.Text(
                                    "Item",
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Qty",
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Amount",
                                    textAlign: pw.TextAlign.center,
                                  )),
                            ],
                          ),
                        ),
                        pw.Divider(
                          thickness: 0.5,
                        ),
                      ],
                    ),

                  for (int i = 0; i < li9.details.length; i++)
                    if (li9.details[i].orderFlagNo == j)
                      pw.Column(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 8.0,
                                bottom: 8),
                            child: pw.Column(
                              children: [
                                pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 3,
                                        child: pw.Text(
                                          li9.details[i]
                                              .itemName,
                                          textAlign:
                                          pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          li9.details[i].qty
                                              .round()
                                              .toString(),
                                          textAlign:
                                          pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${(li9.details[i].price).toString()}",
                                          textAlign:
                                          pw.TextAlign.center,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment:
                    pw. MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(),
                      ),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            "Subtotal",
                            textAlign: pw.TextAlign.center,
                          )),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${total}",
                            textAlign: pw.TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment:
                    pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(flex: 1, child: pw.Container()),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            "GST ( 2.5% CGST + 2.5% SGST )",
                            textAlign: pw.TextAlign.center,
                          )),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${(total * 5) / 100}",
                            textAlign: pw.TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment:
                    pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(flex: 1, child: pw.Container()),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            "Item Total",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold),
                          )),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${((total * 5) / 100) + total}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),

            if(li8.details[0].cateringService == "Y")

                pw.Column(
                  children: [
                    pw.Container(
                      margin: pw.EdgeInsets.only(right: 16),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "Catering Service",
                              style: pw.TextStyle(
                                color: PdfColor.fromHex("339B6F"),
                              ),
                            ),
                          ),
                          pw.Expanded(
                              flex: 1,
                              child: pw.Container()),
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
                    //             children: [
                    //
                    //               Expanded(flex:4,child: Container(),),
                    //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                    //
                    //             ]),
                    //       ],
                    //     ))



                pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 8.0,
                        bottom: 8),
                    child: pw.Column(
                      children: [
                        pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment
                                .spaceBetween,
                            children: [
                              pw.Expanded(
                                  flex: 4,
                                  child: pw.Text(
                                    "Persons",
                                    textAlign:
                                    pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Amount".toString(),
                                    textAlign:
                                    pw.TextAlign.center,
                                  )),
                            ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment
                                .spaceBetween,
                            children: [
                              pw.Expanded(
                                  flex: 4,
                                  child: pw.Text(
                                    "${li8.details[0].cateringAmount / 100}",
                                    textAlign:
                                    pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Rs.${li8.details[0].cateringAmount}",
                                    textAlign:
                                    pw.TextAlign.center,
                                  )),
                            ]),
                      ],
                    ))
              ],
            ),
            if(li8.details[0].vesselSet == "Y")
                 pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(right: 16,top: 10),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                          flex: 4,
                          child: pw.Text(
                              "Vessel Set",
                              style: pw.TextStyle(
                                color: PdfColor.fromHex("339B6F"),
                              ),
                            ),
                          ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${(li8.details[0].vesselSetAmount)}",
                            textAlign: pw.TextAlign.center,
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
            if(li8.details[0].vehicle == "Y")
                 pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(right: 16,top:10),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                          flex: 4,
          child:pw. Text(
                              "Vehicle Drop",
                              style: pw.TextStyle(
                                color: PdfColor.fromHex("339B6F"),
                              ),
                            ),
                          ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${(li8.details[0].vehicleAmount)}",
                            textAlign: pw.TextAlign.center,
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
               ,
            pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(right: 16,top:10),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 4,
                        child:  pw.Text(
                          "Payment Mode",
                          style: pw.TextStyle(
                              color: PdfColor.fromHex("339B6F")),
                        ),
                      ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "${(li8.details[0].paymentType)}",
                            textAlign: pw.TextAlign.center,
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

            pw.Divider(
              thickness: 0.1,
            ),
            pw.Text("Advance Details"),
            for (int i = 0; i < li10.details.length; i++)
              pw.Container(
                margin: pw.EdgeInsets.only(right: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 4,
                        child:  pw.Text(
                              "Advance ${i + 1} (${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(li10.details[i].date.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))})"),
                        ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Rs.${(li10.details[i].advanceAmount)}",
                          textAlign: pw.TextAlign.left,
                        )),
                  ],
                ),
              ),
            if((li8.details[0].disApplied.replaceAll(" ", "")=="Y")&&(li8.details[0].disApproval.replaceAll(" ", "")=="Y"))
              pw.Container(
                padding: const pw.EdgeInsets.only(right: 16.0),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 4,
                        child:  pw.Text(
                          "Discount Amount",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromHex("339B6F")),
                        )),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Rs.${(li8.details[0].disAmount).toStringAsFixed(2)}",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,),
                        )),
                  ],
                ),
              ),
            pw.Divider(
              thickness: 0.5,
            ),

            if(li8.details[0].paymentType.trim()=="Receive Later")
            pw.Container(
              padding: const pw.EdgeInsets.only(right: 16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(
                      flex: 4,
                      child:  pw.Text(
                        "Amount Receivable",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromHex("339B6F")),
                      )),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text(
                        "Rs.${(li8.details[0].orderPrice-(li8.details[0].disAmount+li8.details[0].advanceAmount)).toStringAsFixed(2)}",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,),
                      )),
                ],
              ),
            ),
            if(li8.details[0].paymentType.trim()=="Receive Later")
            pw.Divider(
              thickness: 0.5,
            ),

            pw.Container(
              child:
              pw.Container(
                padding: pw.EdgeInsets.only(right:16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 4,
                      child: pw. Text(
                        "Total Amount",
                        style: pw. TextStyle(
                            color: PdfColor.fromHex("339B6F"),fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Rs.${(li8.details[0].orderPrice)}",
                          style: pw. TextStyle(
                              color: PdfColor.fromHex("339B6F"),fontWeight: pw.FontWeight.bold),
                          textAlign: pw.TextAlign.center,
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

            ),


          ];
          // Center
        })); // Pa
    Directory tempDir; // g
    if (Platform.isAndroid) {
      tempDir = await getExternalStorageDirectory();
      // Android-specific code
    } else {
      tempDir = await getApplicationDocumentsDirectory();
      // iOS-specific code
    }

    String tempPath = tempDir.path;
    print(tempPath);
    File file = File('$tempPath/example.pdf');
    // await Printing.sharePdf(
    //     bytes: await pdf.save(), filename: 'my-document.pdf');
    // PdfPreview(
    //   initialPageFormat: PdfPageFormat.a4,
    //
    //   build: (format) => pdf.save(),
    // );
     await Printing.layoutPdf(
       format: PdfPageFormat.a4,
         onLayout: (PdfPageFormat format) async => pdf.save(),

     );
  }
  Future<void> shareInvoice() async {
    final pdf = pw.Document();

    var data = await rootBundle.load("open-sans.ttf");

    final ttf = pw.Font.ttf(data.buffer.asByteData());
    const imageProvider = const AssetImage('logo.png');
    final image = await flutterImageProvider(imageProvider);
    // final image = await imageFromAssetBundle('logo.png');
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return  [
            pw.Header(
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [

                            pw.Image(image, width: 150),
                            pw.Text("Taste of Life",
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right),
                            pw.SizedBox(width: 10, height: 10),
                          ]),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text("Ratnaa Shree Anandhaas Hotels Private Limited",
                                style: pw.TextStyle(
                                    fontSize: 14,
                                    color: PdfColor.fromHex("339B6F"))),
                            pw.Text("747,Puliakulam Road, P.N. Palayam,",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("Coimbatore 641 037, Tamilnadu,+91 9597210033,",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("GSTIN:33AADCR4127R1Z2  HSN/SAC : 996334,",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.SizedBox(width: 10, height: 10),
                          ]),
                      pw.SizedBox(width: 10, height: 10),
                    ])),
            pw.Container(
                padding: pw.EdgeInsets.only(top:10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text("Invoice No : ${li8.details[0].inVoiceNo}")),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          color: PdfColor.fromHex("339B6F"),
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text("TAX INVOICE",
                                    style: pw.TextStyle(
                                        color: PdfColor.fromHex("FFFFFF")),
                                    textAlign: pw.TextAlign.center)
                              ]),
                        ),
                      ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Container())
                    ])),
            pw.Row(),
            pw.Row(children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Name: ${li8.details[0].name.toString()}",
                  softWrap: true,

                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Date: ${datefromcontroller.text}",
                  softWrap: true,

                ),
              ),

            ],
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween),
            pw.Row(children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Mobile: ${li8.details[0].mobile.toString()}",
                  softWrap: true,

                ),
              ),

              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Time:  ${timecontroller.text}",
                  softWrap: true,

                ),
              ),

            ], mainAxisAlignment: pw.MainAxisAlignment.spaceBetween),
            pw.Divider(thickness: 0.5),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              child:   pw.Text("Order Details",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),


            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Row(
                mainAxisAlignment:
                pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                      flex: 3,
                      child: pw.Text(
                        "Item",
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text(
                        "Qty",
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text(
                        "Amount",
                        textAlign: pw.TextAlign.center,
                      )),
                ],
              ),
            ),
            pw.Divider(
              thickness: 0.5,
            ),
            for (int j = 0;
            j <= OrderListState.orderflagno;
            j++)
              pw.Column(
                children: [
                  // if(OrderListState.orderflagno!=0)
                  //   Divider(thickness: 2,),
                  if (OrderListState.orderflagno != 0 && j != 0)
                    pw.Column(
                      children: [
                        pw.SizedBox(
                          height: 50,
                        ),
                        pw.Text("Additional Order $j",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold)),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 8.0,
                              bottom: 8),
                          child: pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Expanded(
                                  flex: 3,
                                  child: pw.Text(
                                    "Item",
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Qty",
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Amount",
                                    textAlign: pw.TextAlign.center,
                                  )),
                            ],
                          ),
                        ),
                        pw.Divider(
                          thickness: 0.5,
                        ),
                      ],
                    ),

                  for (int i = 0; i < li9.details.length; i++)
                    if (li9.details[i].orderFlagNo == j)
                      pw.Column(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 8.0,
                                bottom: 8),
                            child: pw.Column(
                              children: [
                                pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 3,
                                        child: pw.Text(
                                          li9.details[i]
                                              .itemName,
                                          textAlign:
                                          pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          li9.details[i].qty
                                              .round()
                                              .toString(),
                                          textAlign:
                                          pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${(li9.details[i].price).toString()}",
                                          textAlign:
                                          pw.TextAlign.center,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment:
                    pw. MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(),
                      ),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            "Subtotal",
                            textAlign: pw.TextAlign.center,
                          )),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${total}",
                            textAlign: pw.TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment:
                    pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(flex: 1, child: pw.Container()),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            "GST ( 2.5% CGST + 2.5% SGST )",
                            textAlign: pw.TextAlign.center,
                          )),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${(total * 5) / 100}",
                            textAlign: pw.TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                  left: 24, right: 24, top: 8.0, bottom: 8),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment:
                    pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(flex: 1, child: pw.Container()),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            "Item Total",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold),
                          )),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${((total * 5) / 100) + total}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),

            if(li8.details[0].cateringService == "Y")

              pw.Column(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 16),
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 4,
                          child: pw.Text(
                            "Catering Service",
                            style: pw.TextStyle(
                              color: PdfColor.fromHex("339B6F"),
                            ),
                          ),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Container()),
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
                  //             children: [
                  //
                  //               Expanded(flex:4,child: Container(),),
                  //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                  //
                  //             ]),
                  //       ],
                  //     ))



                  pw.Padding(
                      padding: const pw.EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 8.0,
                          bottom: 8),
                      child: pw.Column(
                        children: [
                          pw.Row(
                              mainAxisAlignment:
                              pw.MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                pw.Expanded(
                                    flex: 4,
                                    child: pw.Text(
                                      "Persons",
                                      textAlign:
                                      pw.TextAlign.center,
                                    )),
                                pw.Expanded(
                                    flex: 1,
                                    child: pw.Text(
                                      "Amount".toString(),
                                      textAlign:
                                      pw.TextAlign.center,
                                    )),
                              ]),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                              mainAxisAlignment:
                              pw.MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                pw.Expanded(
                                    flex: 4,
                                    child: pw.Text(
                                      "${li8.details[0].cateringAmount / 100}",
                                      textAlign:
                                      pw.TextAlign.center,
                                    )),
                                pw.Expanded(
                                    flex: 1,
                                    child: pw.Text(
                                      "Rs.${li8.details[0].cateringAmount}",
                                      textAlign:
                                      pw.TextAlign.center,
                                    )),
                              ]),
                        ],
                      ))
                ],
              ),
            if(li8.details[0].vesselSet == "Y")
              pw.Column(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 16,top: 10),
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 4,
                          child: pw.Text(
                            "Vessel Set",
                            style: pw.TextStyle(
                              color: PdfColor.fromHex("339B6F"),
                            ),
                          ),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "Rs.${(li8.details[0].vesselSetAmount)}",
                              textAlign: pw.TextAlign.center,
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
            if(li8.details[0].vehicle == "Y")
              pw.Column(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 16,top:10),
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 4,
                          child:pw. Text(
                            "Vehicle Drop",
                            style: pw.TextStyle(
                              color: PdfColor.fromHex("339B6F"),
                            ),
                          ),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "Rs.${(li8.details[0].vehicleAmount)}",
                              textAlign: pw.TextAlign.center,
                            )),
                      ],
                    ),
                  ),

                  pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16,top:10),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child:  pw.Text(
                                "Payment Mode",
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex("339B6F")),
                              ),
                            ),
                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "${(li8.details[0].paymentType)}",
                                  textAlign: pw.TextAlign.center,
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
            ,

            pw.Divider(
              thickness: 0.1,
            ),
            pw.Text("Advance Details"),
            for (int i = 0; i < li10.details.length; i++)
              pw.Container(
                margin: pw.EdgeInsets.only(right: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 4,
                      child:  pw.Text(
                          "Advance ${i + 1} (${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(li10.details[i].date.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))})"),
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Rs.${(li10.details[i].advanceAmount)}",
                          textAlign: pw.TextAlign.left,
                        )),
                  ],
                ),
              ),

              pw.Container(
                padding: const pw.EdgeInsets.only(right: 16.0),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 4,
                        child:  pw.Text(
                          "Discount Amount",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromHex("339B6F")),
                        )),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Rs.${(discountcontroller.text)}",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,),
                        )),
                  ],
                ),
              ),
            pw.Divider(
              thickness: 0.5,
            ),
            pw.Container(
              child:
              pw.Container(
                padding: pw.EdgeInsets.only(right:16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 4,
                      child: pw. Text(
                        "Total Amount",
                        style: pw. TextStyle(
                            color: PdfColor.fromHex("339B6F"),fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Rs.${(li8.details[0].orderPrice)}",
                          style: pw. TextStyle(
                              color: PdfColor.fromHex("339B6F"),fontWeight: pw.FontWeight.bold),
                          textAlign: pw.TextAlign.center,
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

            ),


          ];
          // Center
        })); // Pa
    Directory tempDir; // g
    if (Platform.isAndroid) {
      tempDir = await getExternalStorageDirectory();
      // Android-specific code
    } else {
      tempDir = await getApplicationDocumentsDirectory();
      // iOS-specific code
    }

    String tempPath = tempDir.path;
    print(tempPath);
    File file = File('$tempPath/example.pdf');
    // await Printing.sharePdf(
    //     bytes: await pdf.save(), filename: 'my-document.pdf');
    // PdfPreview(
    //   initialPageFormat: PdfPageFormat.a4,
    //
    //   build: (format) => pdf.save(),
    // );
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'Discount ${li8.details[0].inVoiceNo}.pdf');
    // await Printing.layoutPdf(
    //   format: PdfPageFormat.a4,
    //   onLayout: (PdfPageFormat format) async => pdf.save(),
    //
    // );
  }

  Future<http.Response> DiscountRequest() async {
    int discount=0;
    if(double.parse(discountcontroller.text)==(li8.details[0].orderPrice - li8.details[0].advanceAmount)) {
      discount = 0;
    }
    else {
      discount = 1;
    }
    print("DISCOUNT:$discount");
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_INSERT_ORDER xmlns="http://tempuri.org/">
      <DocNo>${widget.orderid}</DocNo>
      <OrderDate>10-12-2021</OrderDate>
      <OrderTime>10:30</OrderTime>      
      <CateringService>N</CateringService>
      <CateringAmount>0</CateringAmount>
      <VaselSet>N</VaselSet>
      <VaselAmount>0</VaselAmount>
      <Vehicle>N</Vehicle>
      <VechicleAmount>0</VechicleAmount>
      <OrderPrice>0</OrderPrice>
      <AdvanceType>full</AdvanceType>
      <AdvanceAmount>0</AdvanceAmount>
      <PaymentType>Y</PaymentType>
      <OrderStatus>P</OrderStatus>
      <Branch>1</Branch>
      <Remarks></Remarks>
      <ItemDetailXML><![CDATA[<NewDataSet><Table1><RowID>0</RowID><LineID>0</LineID><ItemCode>Idly</ItemCode><ItemName>Idly</ItemName><Qty>5</Qty><UOM></UOM><Price>140.0</Price><OrderFlag>N</OrderFlag><OrderFlagNo>0</OrderFlagNo></Table1></NewDataSet>]]></ItemDetailXML>
      <ItemDetailXMLID>1</ItemDetailXMLID>
      <UserID>1</UserID>
      <CategoryID>1</CategoryID>
      <Name>sdsa</Name>
      <Mobile>432234</Mobile>
      <Email>23dfh4</Email>
      <Address>324</Address>
      <GST>324</GST>
      <WhatsappNumber>342343223</WhatsappNumber>
      <Pincode>323423</Pincode>
      <DisAmount>${discountcontroller.text}</DisAmount>
      <DisApproval>Y</DisApproval>
      <DisApplied>Y</DisApplied>
      <DisApprovedBy>$discount</DisApprovedBy>
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
        shareInvoice();

        final decoded = json.decode(parsedXml.text);
        li6 = SaveResponse.fromJson(decoded[0]);
        print(li6.sTATUSID);



          Fluttertoast.showToast(
              msg: "Discount applied Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: String_Values.primarycolor,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Dashboard()), (route) => false);



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
  Future<http.Response> AdvanceHistoryRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${widget.orderid}</OrderNo>
      <BranchID>${LoginPageState.branchid}</BranchID>
       <FormId>3</FormId>
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

      li10 = OrderAdvanceHistoryList.fromJson(decoded);
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
  Future<http.Response> CancelRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${widget.orderid}</OrderNo>
      <BranchID>${LoginPageState.branchid}</BranchID>
       <FormId>4</FormId>
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

      li18 = SaveModel.fromJson(decoded[0]);
      print(li18.sTATUSID);
      if(li18.sTATUSID==1) {


        Fluttertoast.showToast(
            msg: "Order Cancelled Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: String_Values.primarycolor,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Dashboard()), (route) => false);

      }
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
  Future<http.Response> itemRequest(id) async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GETITEMMASTER xmlns="http://tempuri.org/">
      <BranchID>1</BranchID>
      <CategoryID>${id}</CategoryID>
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
  Future<http.Response> updateDeliveryDate() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> 
    <soap:Body> <IN_MOB_DELIVERYDATEUPDATE xmlns="http://tempuri.org/"> 
    <OrderNo>${widget.orderid}</OrderNo> 
    <DeliveryDate>${dateupload+' '+ timeupload}</DeliveryDate> 
    <DeliveryTime>${timeupload}</DeliveryTime> 
    <FormId>1</FormId> 
    </IN_MOB_DELIVERYDATEUPDATE> 
    </soap:Body>
    </soap:Envelope>
''';
    print(envelope);
    var url =
        'http://103.252.117.204:90/Aananadhaas/service.asmx?op=IN_MOB_DELIVERYDATEUPDATE';
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
      li11 = SaveResponse.fromJson(decoded[0]);
      print(li11.sTATUSMSG);

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
       <BranchID>${LoginPageState.branchid}</BranchID>
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
      print("Invoice No: ${li8.details[0].inVoiceNo}");
      setState(() {
       datefromcontroller.text= "${(DateFormat("dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }";
       timecontroller.text= "${(DateFormat("hh:mm a")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }";
       timeupload="${(DateFormat("hh:mm:ss")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }";
       dateupload ="${(DateFormat("yyyy-MM-dd")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }";
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
       <BranchID>${LoginPageState.branchid}</BranchID>
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
        for (int i = 0; i < li9.details.length; i++) {
          total = total + li9.details[i].price;
          print("Order Flag ${li9.details[i].orderFlagNo}");
          print("Order Flag ${li9.details[i].orderFlag}");
        }
        OrderListState.orderflagno =
            li9.details[li9.details.length - 1].orderFlagNo;
        print(OrderListState.orderflagno =
            li9.details[li9.details.length - 1].orderFlagNo);
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
        bookingitem =
            "$bookingitem<Table1><RowID>0</RowID><LineID>0</LineID><ItemCode>${li5.details[i].itemCode}</ItemCode><ItemName>${li5.details[i].itemName}</ItemName><Qty>${Order3State.cnt[i]}</Qty><UOM></UOM><Price>${((Order3State.cnt[i]) * (((li5.details[i].price * 10) / 100) + li5.details[i].price)).toString()}</Price></Table1>";

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
      <CateringService>${Order2State.catcheck == true ? "Y" : "N"}</CateringService>
      <CateringAmount>${double.parse(cattot)}</CateringAmount>
      <VaselSet>${Order2State.vescheck == true ? "Y" : "N"}</VaselSet>
      <VaselAmount>${double.parse(vestot)}</VaselAmount>
      <Vehicle>${Order2State.vehcheck == true ? "Y" : "N"}</Vehicle>
      <VechicleAmount>${double.parse(vehtot)}</VechicleAmount>
      <OrderPrice>${(int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) + ((Order3State.total * 5) / 100) + Order3State.total))}</OrderPrice>
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
      if (parsedXml.text != "[]") {
        final decoded = json.decode(parsedXml.text);
        li6 = SaveResponse.fromJson(decoded[0]);
        print(li6.sTATUSID);
        if (li6.sTATUSID == 1) {
          NewOrderState.datefromcontroller.text = "";
          NewOrderState.categoryid = 0;
          Order2State.cntcontroller.text = "";
          Order2State.vescontroller.text = "";
          Order2State.vehcostcontroller.text = "";
          Order2State.vehkmcontroller.text = "";
          Fluttertoast.showToast(
              msg: "Order Placed Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: String_Values.primarycolor,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
              (route) => false);
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
          msg:
              "Http error!, Response code${response.statusCode}, ${response.body} ",
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
    OrderRequest()
        .then((value) => OrderItemRequest())
        .then((value) => AdvanceHistoryRequest());

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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

                SizedBox(
                  height: height / 50,
                ),
                Container(
                  color: Colors.blue.shade50,
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    title: Text("Order Summary"),
                    initiallyExpanded: true,
                    children: [
                      Column(
                        children: [
                          widget.gst
                              ? Container(
                                  margin: EdgeInsets.only(right: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: ListTile(
                                            title: Text("GST Invoice No"),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            widget.invoice,
                                            textAlign: TextAlign.start,
                                          )),
                                    ],
                                  ),
                                )
                              : Container(),

                          Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: ListTile(
                                      title: Text("Order Status"),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      li8.details[0].orderStatus == "P"
                                          ? "Pending"
                                          : "Complete",
                                      textAlign: TextAlign.start,
                                    )),
                              ],
                            ),
                          ),
                          ListTile(
                            title: Text("Order Time and Date"),
                            trailing: Text("${(DateFormat("hh:mm a , dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }")
                          )

                          //   Text(
                          //       "${DateFormat.jm().format(DateTime.parse("2020-12-12 " + OrderDetailsState.li8.details[0].bookingTime))},${OrderDetailsState.li8.details[0].bookingDate}"),
                          // ),

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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade50,
                        ),
                        child: ExpansionTile(
                          title: Text("Name and Address"),
                          leading: Icon(Icons.group),
                          children: [
                            Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 24,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Name:",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 24.0),
                                            child: Text(
                                              li8.details[0].name.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontWeight: FontWeight.w600),
                                            ))
                                      ]),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween),
                            Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 24,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Mobile:",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 24.0),
                                            child: Text(
                                              li8.details[0].mobile.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontWeight: FontWeight.w600),
                                            ))
                                      ]),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween),
                            li8.details[0].whatsappNumber !=
                                    li8.details[0].mobile
                                ? Row(
                                    children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24.0,
                                              right: 24,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            "Whatsapp:",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24.0),
                                                  child: Text(
                                                    li8.details[0]
                                                        .whatsappNumber
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.indigo,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                            ]),
                                      ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween)
                                : Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Checkbox(value: true, onChanged: null),
                                        Text("Whatsapp Same as Mobile")
                                      ],
                                    ),
                                  ),
                            Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 24,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Address:",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 24.0),
                                            child: Text(
                                              li8.details[0].address.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontWeight: FontWeight.w600),
                                            ))
                                      ]),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween),
                            Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 24,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Pincode:",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 24.0),
                                            child: Text(
                                              li8.details[0].pincode.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontWeight: FontWeight.w600),
                                            ))
                                      ]),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween),
                            li8.details[0].email != ""
                                ? Row(
                                    children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24.0,
                                              right: 24,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            "Email:",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24.0),
                                                  child: Text(
                                                    li8.details[0].email
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.indigo,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                            ]),
                                      ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween)
                                : Container(),
                            li8.details[0].gSTno != ""
                                ? Row(
                                    children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24.0,
                                              right: 24,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            "GST No:",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24.0),
                                                  child: Text(
                                                    li8.details[0].gSTno
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.indigo,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                            ]),
                                      ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween)
                                : Container(),
                          ],
                        ),
                      ),
                      // ListTile(title: Text("Name"),trailing: Text("${li8.details[0].name}"),),

                      Container(
                        color: Colors.purple.shade50,
                        child: ExpansionTile(
                          title: Text("Item Details"),
                          leading: Icon(Icons.fastfood),
                          initiallyExpanded: true,
                          backgroundColor: Colors.white,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 8.0, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            Divider(
                              thickness: 2,
                            ),
                            for (int j = 0;
                                j <= OrderListState.orderflagno;
                                j++)
                              Column(
                                children: [
                                  // if(OrderListState.orderflagno!=0)
                                  //   Divider(thickness: 2,),
                                  if (OrderListState.orderflagno != 0 && j != 0)
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: height / 50,
                                        ),
                                        ListTile(
                                          leading: Text("Additional Order $j",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24,
                                              right: 24,
                                              top: 8.0,
                                              bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                        Divider(
                                          thickness: 2,
                                        ),
                                      ],
                                    ),

                                  for (int i = 0; i < li9.details.length; i++)
                                    if (li9.details[i].orderFlagNo == j)
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                                top: 8.0,
                                                bottom: 8),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          li9.details[i]
                                                              .itemName,
                                                          textAlign:
                                                              TextAlign.start,
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          li9.details[i].qty
                                                              .round()
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          "Rs.${(li9.details[i].price).toString()}",
                                                          textAlign:
                                                              TextAlign.start,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                ],
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(flex: 1, child: Container()),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "GST ( 2.5% CGST + 2.5% SGST )",
                                            textAlign: TextAlign.start,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${(total * 5) / 100}",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(flex: 1, child: Container()),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Item Total",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${((total * 5) / 100) + total}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
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
                                        leading: Icon(
                                          Icons.follow_the_signs,
                                          color: Colors.deepOrange,
                                        ),
                                        title: Text(
                                          "Catering Service",
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24,
                                              right: 24,
                                              top: 8.0,
                                              bottom: 8),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "Persons",
                                                          textAlign:
                                                              TextAlign.start,
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          "Amount".toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                        )),
                                                  ]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          "${li8.details[0].cateringAmount / 100}",
                                                          textAlign:
                                                              TextAlign.start,
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          "Rs.${li8.details[0].cateringAmount}",
                                                          textAlign:
                                                              TextAlign.start,
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
                                                  leading: Icon(
                                                    Icons
                                                        .emoji_food_beverage_sharp,
                                                    color: Colors.deepOrange,
                                                  ),
                                                  title: Text(
                                                    "Vessel Set",
                                                    style: TextStyle(
                                                      color: Colors.deepOrange,
                                                    ),
                                                  ),
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
                                                  leading: Icon(
                                                    Icons.motorcycle_sharp,
                                                    color: Colors.deepOrange,
                                                  ),
                                                  title: Text(
                                                    "Vehicle Drop",
                                                    style: TextStyle(
                                                      color: Colors.deepOrange,
                                                    ),
                                                  ),
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
                          ],
                        ),
                      ),

                      // Divider(thickness: 2,),

                      Container(
                        color: Colors.red.withOpacity(0.2),
                        child: ExpansionTile(
                          backgroundColor: Colors.white,
                          leading: Icon(Icons.money),
                          title: Text("Advance Details"),
                          children: [
                            for (int i = 0; i < li10.details.length; i++)
                              Container(
                                margin: EdgeInsets.only(right: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: ListTile(
                                          title: Text(
                                              "Advance ${i + 1} (${DateFormat("hh:mm a, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(li10.details[i].date.toString().replaceAll("/Date(", "").replaceAll(")/", ""))))})"),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Rs.${(li10.details[i].advanceAmount)}",
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
                      ),
                      widget.gst
                          ? Container()
                          : Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: ListTile(
                                            title: Text(
                                              "Amount Paid",
                                              style: TextStyle(
                                                  color:
                                                      String_Values.primarycolor),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${(li8.details[0].advanceAmount)}",
                                            textAlign: TextAlign.start,
                                          )),
                                    ],
                                  ),

                                ],
                              ),
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
                                      title: Text(
                                        "Payment Mode",
                                        style: TextStyle(
                                            color: String_Values.primarycolor),
                                      ),
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
                                      title: Text(
                                        "Total Amount",
                                        style: TextStyle(
                                            color: String_Values.primarycolor),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Rs.${(li8.details[0].orderPrice)}",
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
                      widget.gst
                          ? Column(
                              children: [
                                if(li8.details[0].disApplied.toString().replaceAll(" ", "")=="Y")
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                  child:
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: ListTile(
                                            title: Text(
                                              "Discount Amount",
                                              style: TextStyle(
                                                  color:
                                                  String_Values.primarycolor),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${(li8.details[0].disAmount)}",
                                            textAlign: TextAlign.start,
                                          )),
                                    ],
                                  ),),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    RaisedButton(
                                      child: Text(
                                        "Generate DC",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      onPressed: () {

                                      },
                                      color: String_Values.primarycolor,
                                    ),
                                    RaisedButton(
                                      child: Text(
                                        "Generate Invoice",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      onPressed: () {
                                        showDialog<void>(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white.withOpacity(0),
                                                title: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(50))),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height: height / 30,
                                                        ),
                                                        Container(

                                                          child: Image.asset(
                                                            "logo.png",width: width/2,

                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 30,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:8.0,right:8.0),
                                                          child: Text(
                                                              "Order Ready to dispatch..Please Confirm the Order to generate Invoice",
                                                            style: TextStyle(
                                                                color: Colors.amber, fontSize: 16),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 30,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(16.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text("Confirm Delivery Date",style: TextStyle(fontSize: 12),),
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
                                                              Text("Confirm Delivery Time",style: TextStyle(fontSize: 12),),
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
                                                        SizedBox(height: height/50,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Container(
                                                                width: width/4,

                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(50))),
                                                                child: FlatButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    updateDeliveryDate().then((value) =>  generateInvoice())
                                                                   ;
                                                                  },
                                                                  child: Text(
                                                                    "Confirm",
                                                                    style: TextStyle(
                                                                        color: String_Values.primarycolor),
                                                                  ),
                                                                )),
                                                            Container(
                                                                width: width/4,

                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(50))),
                                                                child: FlatButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(context);

                                                                  },
                                                                  child: Text(
                                                                    "Back",
                                                                    style: TextStyle(
                                                                        color: String_Values.primarycolor),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),



                                                        SizedBox(
                                                          height: height / 50,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });

                                      },
                                      color: String_Values.primarycolor,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 6,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: ListTile(
                                            title: Text(
                                              "Advance Type",
                                              style: TextStyle(
                                                  color: String_Values
                                                      .primarycolor),
                                            ),
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
                      widget.gst
                          ? Container()
                          : Column(
                              children: [
                                if((li8.details[0].disApplied.replaceAll(" ", "")=="Y")&&(li8.details[0].disApproval.replaceAll(" ", "")=="Y"))
                                Container(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: ListTile(
                                              title: Text(
                                                "Discount Amount",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.purple),
                                              ))),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${(li8.details[0].disAmount).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.purple),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                if(!((li8.details[0].disApplied.replaceAll(" ", "")=="Y")&&(li8.details[0].disApproval.replaceAll(" ", "")=="Y")))

                                  Container(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: ListTile(
                                              title: Text(
                                            "Amount Receivable",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.purple),
                                          ))),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${(li8.details[0].orderPrice - li8.details[0].advanceAmount).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.purple),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                  Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    if(!((li8.details[0].disApplied.replaceAll(" ", "")=="Y")&&(li8.details[0].disApproval.replaceAll(" ", "")=="Y")))

                                      RaisedButton(
                                      child: Text(
                                        "Update",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      onPressed: () {
                                        OrderRequest()
                                            .then((value) => OrderItemRequest())
                                            .then((value) {
                                          //
                                          //
                                          // if(li8.details[0].cateringService=="Y")
                                          //   Order2State.catcheck=true;
                                          // else
                                          //   Order2State.catcheck=false;
                                          // if(li8.details[0].vesselSet=="Y")
                                          //   Order2State.vescheck=true;
                                          // else
                                          //   Order2State.vescheck=false;
                                          // if(li8.details[0].vehicle=="Y")
                                          //   Order2State.vehcheck=true;
                                          // else
                                          //   Order2State.vehcheck=false;
                                          //
                                          // Order2State.vehkmcontroller.text=li8.details[0].vehicleKM.toString();
                                          // Order2State.cnt=int.parse((li8.details[0].cateringAmount/100).round().toString());
                                          // Order2State.vehcostcontroller.text=li8.details[0].vehicleAmount.round().toString();
                                          // Order2State.vescontroller.text=li8.details[0].vesselSetAmount.round().toString();
                                          // Order2State.cntcontroller.text=(li8.details[0].cateringAmount/100).round().toString();
                                          // print(Order2State.cntcontroller.text);
                                          NewOrderState.categoryid =
                                              li8.details[0].categoryID;
                                          // Order3State.cnt.clear();
                                          // Order3State.controllers.clear();
                                          // Order3State.total=0;
                                          // OrderListState.rowid.clear();
                                          // OrderListState.lineid.clear();
                                          // for(int i=0;i<li9.details.length;i++) {
                                          //   OrderListState.rowid.add( li9.details[i].rowID);
                                          //   OrderListState.lineid.add(li9.details[i].lineID);
                                          //
                                          //   Order3State.total=Order3State.total+li9.details[i].price;
                                          //   Order3State.cnt.add(li9.details[i].qty.round());
                                          //   Order3State.controllers.add(new TextEditingController());
                                          //   Order3State.controllers[i].text=li9.details[i].qty.round().toString();
                                          // }

                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Order3(
                                                        id: int.parse(li8
                                                            .details[0]
                                                            .categoryID
                                                            .toString()),
                                                        edit: int.parse(
                                                            widget.orderid),
                                                      )));
                                        });
                                      },
                                      color: String_Values.primarycolor,
                                    ),
                                    if((li8.details[0].orderPrice - li8.details[0].advanceAmount)>0)
                                    RaisedButton(
                                      child: Text(
                                        "Payment",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      onPressed: () {
                                        OrderRequest()
                                            .then((value) => OrderItemRequest())
                                            .then((value) {
                                          if (li8.details[0].cateringService ==
                                              "Y")
                                            Order2State.catcheck = true;
                                          else
                                            Order2State.catcheck = false;
                                          if (li8.details[0].vesselSet == "Y")
                                            Order2State.vescheck = true;
                                          else
                                            Order2State.vescheck = false;
                                          if (li8.details[0].vehicle == "Y")
                                            Order2State.vehcheck = true;
                                          else
                                            Order2State.vehcheck = false;

                                          Order2State.vehkmcontroller.text = li8
                                              .details[0].vehicleKM
                                              .toString();
                                          Order2State.cnt = int.parse(
                                              (li8.details[0].cateringAmount /
                                                      100)
                                                  .round()
                                                  .toString());
                                          Order2State.vehcostcontroller.text =
                                              li8.details[0].vehicleAmount
                                                  .round()
                                                  .toString();
                                          Order2State.vescontroller.text = li8
                                              .details[0].vesselSetAmount
                                              .round()
                                              .toString();
                                          Order2State.cntcontroller.text =
                                              (li8.details[0].cateringAmount /
                                                      100)
                                                  .round()
                                                  .toString();
                                          print(Order2State.cntcontroller.text);
                                          NewOrderState.categoryid =
                                              li8.details[0].categoryID;
                                          Order3State.cnt.clear();
                                          Order3State.controllers.clear();
                                          Order3State.total = 0;
                                          OrderListState.rowid.clear();
                                          OrderListState.lineid.clear();
                                          for (int i = 0;
                                              i < li9.details.length;
                                              i++) {
                                            OrderListState.rowid
                                                .add(li9.details[i].rowID);
                                            OrderListState.lineid
                                                .add(li9.details[i].lineID);

                                            Order3State.total =
                                                Order3State.total +
                                                    li9.details[i].price;
                                            Order3State.cnt.add(
                                                li9.details[i].qty.round());
                                            Order3State.controllers.add(
                                                new TextEditingController());
                                            Order3State.controllers[i].text =
                                                li9.details[i].qty
                                                    .round()
                                                    .toString();
                                          }
                                          itemRequest(li8.details[0].categoryID)
                                              .then((value) {
                                            if (li5.details.length -
                                                    Order3State.cnt.length ==
                                                0)
                                              ;
                                            else {
                                              print("else");
                                              print(
                                                  "length ${li5.details.length - Order3State.cnt.length}");
                                              for (int i = 0;
                                                  i <=
                                                      (li5.details.length -
                                                          Order3State
                                                              .cnt.length);
                                                  i++) {
                                                Order3State.cnt.add(0);
                                                Order3State.controllers.add(
                                                    new TextEditingController(
                                                        text: "0"));
                                              }
                                              print(Order3State.cnt);
                                            }
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderSummary(
                                                          edit: int.parse(
                                                              widget.orderid),
                                                          payment: 0,
                                                          id: int.parse(
                                                              widget.orderid),
                                                        )));
                                          });
                                        });
                                      },
                                      color: String_Values.primarycolor,
                                    ),
                                    if(!((li8.details[0].disApplied.replaceAll(" ", "")=="Y")&&(li8.details[0].disApproval.replaceAll(" ", "")=="Y")))
                                      if((li8.details[0].orderPrice - li8.details[0].advanceAmount)>0)
                                    RaisedButton(
                                      child: Text(
                                        "Discount",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                      ),
                                      onPressed: () {
                                       discountcontroller.text= (li8.details[0].orderPrice - li8.details[0].advanceAmount).toStringAsFixed(2);
                                        showDialog<void>(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white.withOpacity(0),
                                                title: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(50))),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height: height / 30,
                                                        ),
                                                        Container(

                                                          child: Image.asset(
                                                            "logo.png",width: width/2,

                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 30,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:8.0,right:8.0),
                                                          child: Text(
                                                            "Are you Sure, Do you want to apply discount ",
                                                            style: TextStyle(
                                                                color: Colors.amber, fontSize: 16),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 30,
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(left: 24, right: 24),
                                                            child: TextField(

                                                              enabled: true,
                                                              controller: discountcontroller,
                                                              decoration: InputDecoration(
                                                                prefixIcon: Icon(Icons.calendar_today_outlined),
                                                                labelText: 'Discount Amount (Rs)',
                                                                hintStyle: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 16.0,
                                                                ),
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(25.0),
                                                                ),
                                                              ),
                                                            )),

                                                        SizedBox(height: height/50,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Container(
                                                                width: width/4,

                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(50))),
                                                                child: FlatButton(
                                                                  onPressed: () {

                                                                    Navigator.pop(context);
                                                                    DiscountRequest();
                                                                  },
                                                                  child: Text(
                                                                    "Yes",
                                                                    style: TextStyle(
                                                                        color: String_Values.primarycolor),
                                                                  ),
                                                                )),
                                                            Container(
                                                                width: width/4,

                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(50))),
                                                                child: FlatButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(context);

                                                                  },
                                                                  child: Text(
                                                                    "No",
                                                                    style: TextStyle(
                                                                        color: String_Values.primarycolor),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),



                                                        SizedBox(
                                                          height: height / 50,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });

                                      },
                                      color: String_Values.primarycolor,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                RaisedButton(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(25.0),
                                  ),
                                  onPressed: () {
                                    showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white.withOpacity(0),
                                            title: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(50))),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      height: height / 30,
                                                    ),
                                                    Container(

                                                      child: Image.asset(
                                                        "logo.png",width: width/2,

                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height / 30,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:8.0,right:8.0),
                                                      child: Text(
                                                        "Are you Sure, Do you want to cancel this order",
                                                        style: TextStyle(
                                                            color: Colors.amber, fontSize: 16),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height / 30,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Container(
                                                            width: width/4,

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(50))),
                                                            child: FlatButton(
                                                              onPressed: () {

                                                                Navigator.pop(context);
                                                                CancelRequest();
                                                              },
                                                              child: Text(
                                                                "Yes",
                                                                style: TextStyle(
                                                                    color: String_Values.primarycolor),
                                                              ),
                                                            )),
                                                        Container(
                                                            width: width/4,

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(50))),
                                                            child: FlatButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);

                                                              },
                                                              child: Text(
                                                                "No",
                                                                style: TextStyle(
                                                                    color: String_Values.primarycolor),
                                                              ),
                                                            )),
                                                      ],
                                                    ),



                                                    SizedBox(
                                                      height: height / 50,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });

                                  },
                                  color: String_Values.primarycolor,
                                ),
                                SizedBox(
                                  height: height / 6,
                                ),
                              ],
                            ),
                    ],
                  ),
                )
              ],
            )),
      appBar: AppBar(
          title: Text(
        !widget.gst ? "Order Summary" : "Invoice Detail",
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
