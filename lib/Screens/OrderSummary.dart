import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:anandhasapp/Models/SaveModel.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:anandhasapp/Models/AdvanceHistoryModel.dart';
import 'package:anandhasapp/Models/InsertOrderResponse.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Models/OrderDetail.dart';
import 'package:anandhasapp/Models/OrderIdemDetailModel.dart';
import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/Screens/NewOrder_SelectDate.dart';
import 'package:anandhasapp/Screens/NewOrderItemChoose .dart';
import 'package:anandhasapp/Screens/NewOrderChooseCatering.dart';
import 'package:anandhasapp/Screens/OrderDetails.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:xml/xml.dart' as xml;

import 'Order4.dart';
import 'OrderList.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({Key key,this.edit,this.payment,this.id});
  int edit;
  int payment;
  int id;

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  SaveModel li11;


  Future<void> generateInvoice1() async {
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
                    ])),
            pw.Container(
                padding: pw.EdgeInsets.only(top:10),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text("Order No : ORDNO${widget.edit!=0?li8.details[0].orderNo:li11.oRDERNO}")),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          color: PdfColor.fromHex("339B6F"),
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text("Order Form/Estimate",
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
                child:
                widget.edit!=0?
                pw.Text(
                  "Name: ${li8.details[0].name}",
                  softWrap: true,

                ): pw.Text(
                  "Name: ${Order4State.Namecontroller.text}",
                  softWrap: true,

                ),
              ),
              widget.edit!=0?
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Date: ${(DateFormat("dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }",
                  softWrap: true,

                ),
              ):  pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Date: ${NewOrderState.datefromcontroller.text}",
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
                child:
                widget.edit!=0?
                pw.Text(
                  "Mobile: ${OrderDetailsState.li8.details[0].mobile.toString()}",
                  softWrap: true,

                ): pw.Text(
                  "Mobile: ${Order4State.Mobilecontroller.text}",
                  softWrap: true,

                ),
              ),

              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: widget.edit!=0?pw.Text(
                  "Delivery Time:  ${(DateFormat("hh:mm a")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }",
                  softWrap: true,

                ):pw.Text(
                  "Delivery Time:  ${NewOrderState.timecontroller.text}",
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
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
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
            pw.Divider(thickness: 0.2),
            if(widget.edit!=0)
              pw.Column(
                children: [
                  for(int j=0 ;j<=OrderListState.orderflagno;j++)

                    pw.Column(children: [

                      // if(OrderListState.orderflagno!=0)
                      //   Divider(thickness: 2,),
                      if(OrderListState.orderflagno!=0&&j!=0)
                        pw.Column(
                          children: [
                            pw.SizedBox(height: 50,),
                            pw.Text("Additional Order $j",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

                            // SizedBox(height: height/50,),

                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 24, right: 24, top: 8.0, bottom: 8),
                              child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
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
                            pw.Divider(thickness: 0.2,),
                          ],
                        ),
                      // SizedBox(height: height/50,),
                      for (int i = 0; i < li9.details.length; i++)
                        if(li9.details[i].orderFlagNo==j)
                          pw.Column(
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    left: 24, right: 24, top: 8.0, bottom: 8),
                                child: pw.Column(
                                  children: [
                                    pw.Row(
                                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Text(
                                              li9.details[i].itemName,
                                              textAlign: pw.TextAlign.center,
                                            )),
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Text(
                                              li9.details[i].qty.round().toString(),
                                              textAlign: pw.TextAlign.center,
                                            )),
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Text(
                                              "Rs.${( li9.details[i].price).toString()}",
                                              textAlign: pw.TextAlign.center,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),



                    ],),
                  // Divider(thickness: 2,),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment:pw. MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "GST ( 2.5% CGST + 2.5% SGST )",
                                  textAlign: pw.TextAlign.center,
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(total*5)/100}",
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
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "Item Total",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(((total*5)/100)+total)}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  li8.details[0].cateringService == "Y"
                      ? pw.Column(
                    children: [

                      pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              left: 24, right: 24, top: 8.0, bottom: 8),
                          child: pw.Column(
                            children: [

                              pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 4,
                                        child: pw.Text(
                                          "Catering Service",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${li8.details[0].cateringAmount}",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : pw.Container(),
                  li8.details[0].vesselSet == "Y"
                      ? pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw. Expanded(
                                flex: 4,
                                child: pw.Text("Vessel Set",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")))
                            ),
                            pw. Expanded(
                                flex: 1,
                                child:pw. Text(
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
                  )
                      : pw.Container(),
                  li8.details[0].vehicle == "Y"
                      ? pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                                flex: 4,
                                child: pw.Text("Transport",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),
                                )),
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
                      : pw.Container(),

                  // Column(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(right: 16),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //               flex: 4,
                  //               child: ListTile(
                  //                 title: Text("Amount Paid",style: TextStyle(color: String_Values.primarycolor),),
                  //               )),
                  //           Expanded(
                  //               flex: 1,
                  //               child: Text(
                  //                 "Rs.${(li8.details[0].advanceAmount)}",
                  //                 textAlign: TextAlign.start,
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //     // Padding(
                  //     //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                  //     //     child: Column(
                  //     //       children: [
                  //     //         // Row(
                  //     //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //         //     children: [
                  //     //         //       Expanded(flex:4,child: Container()),
                  //     //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                  //     //         //     ]),
                  //     //         // SizedBox(height: 10,),
                  //     //         Row(
                  //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //             children: [
                  //     //
                  //     //               Expanded(flex:4,child: Container(),),
                  //     //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                  //     //
                  //     //             ]),
                  //     //       ],
                  //     //     ))
                  //   ],
                  // ),
                  pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                                flex: 4,
                                child:  pw.Text("Total Amount",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),
                                )),
                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(li8.details[0].orderPrice)}",
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


                  pw.Divider(thickness: 2,),
                ],
              ),

            widget.payment!=0?pw.Column(
              children: [
                if(widget.edit!=0)
                  pw. Text("New Additional Order",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                if(widget.edit!=0)
                  pw.SizedBox(height: 50,),
                if(widget.edit!=0)
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                            flex: 3,
                            child: pw.Text(
                              "Item",
                              textAlign: pw.TextAlign.center,
                            )),
                        pw.Expanded(
                            flex: 1,
                            child:pw. Text(
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
                if(widget.edit!=0)
                  pw.Divider(thickness: 0.2,),
                for (int i = 0; i < li5.details.length; i++)
                  if (Order3State.cnt[i] != 0)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                          left: 24, right: 24, top: 8.0, bottom: 8),
                      child: pw.Column(
                        children: [
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Expanded(
                                  flex: 3,
                                  child: pw.Text(
                                    li5.details[i].itemName,
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    Order3State.cnt[i].toString(),
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Rs.${(Order3State.cnt[i] * li5.details[i].price).toString()}",
                                    textAlign: pw.TextAlign.center,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),


              ],
            ):pw.Container(),

            if(widget.payment!=0)
              pw.Column(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment:pw. MainAxisAlignment.spaceBetween,
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
                                child:pw. Text(
                                  "Rs.${Order3State.total}",
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
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "GST ( 2.5% CGST + 2.5% SGST )",
                                  textAlign: pw.TextAlign.center,
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(Order3State.total*5)/100}",
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
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "Item Total",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${((Order3State.total*5)/100)+Order3State.total}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Order2State.catcheck == true
                      ? pw.Column(
                    children: [

                      pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              left: 24, right: 24, top: 8.0, bottom: 8),
                          child: pw.Column(
                            children: [

                              pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 4,
                                        child: pw.Text(
                                          "Catering Service",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${(int.parse(Order2State.cntcontroller.text) * Order2State.personamt)}",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : pw.Container(),
                  Order2State.vescheck == true
                      ? pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw. Text("Vessel Set",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),),
                            ),
                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${Order2State.vescontroller.text}",
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
                      : pw.Container(),
                  Order2State.vehcheck == true
                      ? pw.Column(
                    children: [
                      pw.Text("Transport",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),
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
                                    pw.Expanded(
                                        flex: 4,
                                        child:pw. Text(
                                          "Distance in Kms".toString(),
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Amount".toString(),
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 4,
                                        child: pw.Text(
                                          Order2State
                                              .vehkmcontroller.text,
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${Order2State.vehcostcontroller.text}",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : pw.Container(),
                ],
              ),
            widget.edit != 0
                ? pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(right: 16),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text("Amount Paid",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),),
                      ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${double.parse(OrderDetailsState.li8.details[0].advanceAmount.toStringAsFixed(2))+double.parse(AdvanceController.text) }",
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
                : pw.Container(),
            pw.SizedBox(height: 10,),
            widget.payment!=0&&widget.edit != 0?pw.Container(
              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw. Expanded(flex:4,child: pw.Text("Grant Total",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))+li8.details[0].orderPrice)).round() }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
            ):pw.Container(
            ),
            pw.SizedBox(height: 10,),
            widget.edit==0?
            pw.Column(
                children:[
                  pw.Container(

                    padding: const pw.EdgeInsets.only(right:16.0),
                    child: pw.Row(
                      children: [
                        pw.Expanded(flex:4,child:pw.Text("Advance Amount",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                        pw.Expanded(flex:1,child: pw.Text("Rs.${AdvanceController.text}",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                      ],
                    ),
                  ),
                  pw.Container(

                    padding: const pw.EdgeInsets.only(right:16.0),
                    child: pw.Row(
                      children: [
                        pw.Expanded(flex:4,child:pw.Text("Total Amount",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                        pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                      ],
                    ),

                  ),
                  pw.Container(

                    padding: const pw.EdgeInsets.only(right:16.0),
                    child: pw.Row(
                      children: [
                        pw.Expanded(flex:4,child:pw.Text("Amount Receivable",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                        pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))-double.parse(AdvanceController.text)).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                      ],
                    ),

                  )

                ]):
            widget.payment!=0?pw.Container(

              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(flex:4,child: pw.Text("Amount Receivable",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))+li8.details[0].orderPrice)-(OrderDetailsState.li8.details[0].advanceAmount+double.parse(AdvanceController.text))).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
            ):pw.Container(

              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(flex:4,child: pw.Text("Amount Receivable",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw. Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))-(OrderDetailsState.li8.details[0].advanceAmount+double.parse(AdvanceController.text))).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
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
          return [
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
                          child: pw.Text("Order No : ${li11.oRDERNO}")),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          color: PdfColor.fromHex("339B6F"),
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text("Order Form/Estimate",
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
                child:
                widget.edit!=0?
                pw.Text(
                  "Name: ${li8.details[0].name}",
                  softWrap: true,

                ): pw.Text(
                  "Name: ${Order4State.Namecontroller.text}",
                  softWrap: true,

                ),
              ),
              widget.edit!=0?
              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Date: ${(DateFormat("dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }",
                  softWrap: true,

                ),
              ):  pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: pw.Text(
                  "Delivery Date: ${NewOrderState.datefromcontroller.text}",
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
                child:
                widget.edit!=0?
                pw.Text(
                  "Mobile: ${OrderDetailsState.li8.details[0].mobile.toString()}",
                  softWrap: true,

                ): pw.Text(
                  "Mobile: ${Order4State.Mobilecontroller.text}",
                  softWrap: true,

                ),
              ),

              pw.Padding(
                padding: const pw.EdgeInsets.only(

                  top: 10,
                ),
                child: widget.edit!=0?pw.Text(
                  "Delivery Time:  ${(DateFormat("hh:mm a")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }",
                  softWrap: true,

                ):pw.Text(
                  "Delivery Time:  ${NewOrderState.timecontroller.text}",
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
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
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
            pw.Divider(thickness: 0.2),
            if(widget.edit!=0)
              pw.Column(
                children: [
                  for(int j=0 ;j<=OrderListState.orderflagno;j++)

                    pw.Column(children: [

                      // if(OrderListState.orderflagno!=0)
                      //   Divider(thickness: 2,),
                      if(OrderListState.orderflagno!=0&&j!=0)
                        pw.Column(
                          children: [
                            pw.SizedBox(height: 50,),
                            pw.Text("Additional Order $j",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

                            // SizedBox(height: height/50,),

                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 24, right: 24, top: 8.0, bottom: 8),
                              child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
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
                            pw.Divider(thickness: 0.2,),
                          ],
                        ),
                      // SizedBox(height: height/50,),
                      for (int i = 0; i < li9.details.length; i++)
                        if(li9.details[i].orderFlagNo==j)
                          pw.Column(
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    left: 24, right: 24, top: 8.0, bottom: 8),
                                child: pw.Column(
                                  children: [
                                    pw.Row(
                                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Text(
                                              li9.details[i].itemName,
                                              textAlign: pw.TextAlign.center,
                                            )),
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Text(
                                              li9.details[i].qty.round().toString(),
                                              textAlign: pw.TextAlign.center,
                                            )),
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Text(
                                              "Rs.${( li9.details[i].price).toString()}",
                                              textAlign: pw.TextAlign.center,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),



                    ],),
                  // Divider(thickness: 2,),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment:pw. MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "GST ( 2.5% CGST + 2.5% SGST )",
                                  textAlign: pw.TextAlign.center,
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(total*5)/100}",
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
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "Item Total",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${((total*5)/100)+total}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  li8.details[0].cateringService == "Y"
                      ? pw.Column(
                    children: [
                      // pw.Text("Catering Service",style: pw.TextStyle(color: PdfColor.fromHex("339B6F"),),
                      // ),
                      pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              left: 24, right: 24, top: 8.0, bottom: 8),
                          child: pw.Column(
                            children: [

                              pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 4,
                                        child: pw.Text(
                                          "Catering Service",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${li8.details[0].cateringAmount}",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : pw.Container(),
                  li8.details[0].vesselSet == "Y"
                      ? pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw. Expanded(
                                flex: 4,
                                child: pw.Text("Vessel Set",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")))
                                ),
                            pw. Expanded(
                                flex: 1,
                                child:pw. Text(
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
                  )
                      : pw.Container(),
                  li8.details[0].vehicle == "Y"
                      ? pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                                flex: 4,
                                child: pw.Text("Transport",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),
                                )),
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
                      : pw.Container(),

                  // Column(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(right: 16),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //               flex: 4,
                  //               child: ListTile(
                  //                 title: Text("Amount Paid",style: TextStyle(color: String_Values.primarycolor),),
                  //               )),
                  //           Expanded(
                  //               flex: 1,
                  //               child: Text(
                  //                 "Rs.${(li8.details[0].advanceAmount)}",
                  //                 textAlign: TextAlign.start,
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //     // Padding(
                  //     //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                  //     //     child: Column(
                  //     //       children: [
                  //     //         // Row(
                  //     //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //         //     children: [
                  //     //         //       Expanded(flex:4,child: Container()),
                  //     //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                  //     //         //     ]),
                  //     //         // SizedBox(height: 10,),
                  //     //         Row(
                  //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //             children: [
                  //     //
                  //     //               Expanded(flex:4,child: Container(),),
                  //     //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                  //     //
                  //     //             ]),
                  //     //       ],
                  //     //     ))
                  //   ],
                  // ),
                  pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                                flex: 4,
                                child:  pw.Text("Total Amount",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),
                                )),
                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(li8.details[0].orderPrice)}",
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


                  pw.Divider(thickness: 2,),
                ],
              ),

            widget.payment!=0?pw.Column(
              children: [
                if(widget.edit!=0)
                  pw. Text("New Additional Order",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                if(widget.edit!=0)
                  pw.SizedBox(height: 50,),
                if(widget.edit!=0)
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                            flex: 3,
                            child: pw.Text(
                              "Item",
                              textAlign: pw.TextAlign.center,
                            )),
                        pw.Expanded(
                            flex: 1,
                            child:pw. Text(
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
                if(widget.edit!=0)
                  pw.Divider(thickness: 0.2,),
                for (int i = 0; i < li5.details.length; i++)
                  if (Order3State.cnt[i] != 0)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                          left: 24, right: 24, top: 8.0, bottom: 8),
                      child: pw.Column(
                        children: [
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Expanded(
                                  flex: 3,
                                  child: pw.Text(
                                    li5.details[i].itemName,
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    Order3State.cnt[i].toString(),
                                    textAlign: pw.TextAlign.center,
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Text(
                                    "Rs.${(Order3State.cnt[i] * li5.details[i].price).toString()}",
                                    textAlign: pw.TextAlign.center,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),


              ],
            ):pw.Container(),

            if(widget.payment!=0)
              pw.Column(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 24, right: 24, top: 8.0, bottom: 8),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment:pw. MainAxisAlignment.spaceBetween,
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
                                child:pw. Text(
                                  "Rs.${Order3State.total}",
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
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "GST ( 2.5% CGST + 2.5% SGST )",
                                  textAlign: pw.TextAlign.center,
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${(Order3State.total*5)/100}",
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
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Container()),
                            pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  "Item Total",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),

                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${((Order3State.total*5)/100)+Order3State.total}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Order2State.catcheck == true
                      ? pw.Column(
                    children: [

                      pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              left: 24, right: 24, top: 8.0, bottom: 8),
                          child: pw.Column(
                            children: [

                              pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 4,
                                        child: pw.Text(
                                          "Catering Service",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${(int.parse(Order2State.cntcontroller.text) * Order2State.personamt)}",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : pw.Container(),
                  Order2State.vescheck == true
                      ? pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(right: 16),
                        child: pw.Row(
                          children: [
                            pw.Expanded(
                                flex: 4,
                                child: pw. Text("Vessel Set",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),),
                                ),
                            pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "Rs.${Order2State.vescontroller.text}",
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
                      : pw.Container(),
                  Order2State.vehcheck == true
                      ? pw.Column(
                    children: [
                    pw.Text("Transport",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),
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
                                    pw.Expanded(
                                        flex: 4,
                                        child:pw. Text(
                                          "Distance in Kms".toString(),
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Amount".toString(),
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Row(
                                  mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Expanded(
                                        flex: 4,
                                        child: pw.Text(
                                          Order2State
                                              .vehkmcontroller.text,
                                          textAlign: pw.TextAlign.center,
                                        )),
                                    pw.Expanded(
                                        flex: 1,
                                        child: pw.Text(
                                          "Rs.${Order2State.vehcostcontroller.text}",
                                          textAlign: pw.TextAlign.center,
                                        )),
                                  ]),
                            ],
                          ))
                    ],
                  )
                      : pw.Container(),
                ],
              ),
            widget.edit != 0
                ? pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(right: 16),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                          flex: 4,
                          child: pw.Text("Amount Paid",style: pw.TextStyle( color: PdfColor.fromHex("339B6F")),),
                          ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Rs.${OrderDetailsState.li8.details[0].advanceAmount.toStringAsFixed(2) }",
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
                : pw.Container(),
            pw.SizedBox(height: 10,),
            widget.payment!=0&&widget.edit != 0?pw.Container(
              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw. Expanded(flex:4,child: pw.Text("Grant Total",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))+li8.details[0].orderPrice)).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
            ):pw.Container(
            ),
            pw.SizedBox(height: 10,),
            widget.edit==0?
                pw.Column(
                  children:[
            pw.Container(

              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(flex:4,child:pw.Text("Advance Amount",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw.Expanded(flex:1,child: pw.Text("Rs.${AdvanceController.text}",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
            ),
            pw.Container(

              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(flex:4,child:pw.Text("Total Amount",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
            pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
            )]):
            widget.payment!=0?pw.Container(

              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(flex:4,child: pw.Text("Amount Receivable",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw.Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))+li8.details[0].orderPrice)-(OrderDetailsState.li8.details[0].advanceAmount)).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
            ):pw.Container(

              padding: const pw.EdgeInsets.only(right:16.0),
              child: pw.Row(
                children: [
                  pw.Expanded(flex:4,child: pw.Text("Amount Receivable",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),
                  pw. Expanded(flex:1,child: pw.Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))-(OrderDetailsState.li8.details[0].advanceAmount)).toStringAsFixed(2) }",style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex("339B6F")),)),

                ],
              ),
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
  bool loading = false;

  ItemModelList li5;

  var dropdownValue1="Advance Type";
  TextEditingController AdvanceController = new TextEditingController();
  TextEditingController remarkscontroller = new TextEditingController();
  var stringlist=["Advance Type","Advance","Full/Balance Amount"];

  var dropdownValue2="Payment Mode";
  var stringlist2=["Payment Mode","Cash","Card","Cheque","UPI","Receive Later"];
  var stringlist3=["Payment Mode","Cash","Card","Cheque","UPI"];
  SaveResponse li6;

  String vehtot;
  // int timeInMillis = 1586348737122;
  // var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
  // var formattedDate = DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(timeInMillis));
  String vestot;

  String cattot;

  String bookingitem;

  double advanceamt;

  String vehkm;

  int doc;

  String status;

  String orderflag="N";

  int orderflagNo=0;

  OrderDetaillListModel li8;

  OrderItemDetailModelList li9;

  double total=0;

  OrderAdvanceHistoryList li10;

  var advenable=true;

  Future<http.Response> OrderRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${OrderListState.orderid}</OrderNo>
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
      // print(li5.details[0].itemName);
      setState(() {

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
      <OrderNo>${OrderListState.orderid}</OrderNo>
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
        total=0;
        for(int i=0;i<li9.details.length;i++) {

          total = total + li9.details[i].price;
          print("Order Flag ${li9.details[i].orderFlagNo}");
          print("Order Flag ${li9.details[i].orderFlag}");
        }
        // OrderListState.orderflagno=li9.details[li9.details.length-1].orderFlagNo;
        // print(OrderListState.orderflagno=li9.details[li9.details.length-1].orderFlagNo);



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

Future<http.Response> AdvanceHistoryRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GET_ORDER_NO xmlns="http://tempuri.org/">
      <OrderNo>${OrderListState.orderid}</OrderNo>
       <FormId>3</FormId>
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
Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GETITEMMASTER xmlns="http://tempuri.org/">
      <BranchID>1</BranchID>
      <CategoryID>0</CategoryID>
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

Future<http.Response> postRequest() async {


if(widget.edit==0)
  doc=0;
else
  doc=widget.id;
    bookingitem = "";
    advanceamt=double.parse(AdvanceController.text);



  if(widget.edit!=0) {
    if (((int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) +
        ((Order3State.total * 5) / 100) + Order3State.total) ).round() -  (OrderDetailsState.li8.details[0].advanceAmount+advanceamt)) == 0) {
      print("widget  0 Status: ${(int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) +
          ((Order3State.total * 5) / 100) + Order3State.total) ).round() -  (OrderDetailsState.li8.details[0].advanceAmount+advanceamt)}");
      status = "C";
    }
    else {
      print("widget  0 else Status: ${(int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) +
          ((Order3State.total * 5) / 100) + Order3State.total) ) -  (OrderDetailsState.li8.details[0].advanceAmount+advanceamt)}");

      status = "P";
    }
    if(dropdownValue2=="Receive Later")
      status = "C";
  }
  else
    {
      if (((int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) +
          ((Order3State.total * 5) / 100) + Order3State.total)).round() - advanceamt) == 0) {
        print("Status: ${(int.parse(vehtot) +
            (int.parse(vestot) + (int.parse(cattot)) +
                ((Order3State.total * 5) / 100) + Order3State.total)) -
            advanceamt}");
        status = "C";
      }
      else {
        print("Status: ${(int.parse(vehtot) +
            (int.parse(vestot) + (int.parse(cattot)) +
                ((Order3State.total * 5) / 100) + Order3State.total)) -
            advanceamt}");

        status = "P";
      }
      if(dropdownValue2=="Receive Later")
        status = "C";
    }

    // if(dropdownValue1=="Half Advance")
    //   advanceamt=(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total))/2;
    // else
    //   advanceamt=(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total));
if(widget.edit==0) {

  orderflag="N";

  orderflagNo=0;
  for (int i = 0; i < li5.details.length; i++)
    if (Order3State.cnt[i] != 0)
      bookingitem =
      "$bookingitem<Table1><RowID>0</RowID><LineID>0</LineID><ItemCode>${li5
          .details[i].itemCode}</ItemCode><ItemName>${ li5.details[i].docNo==136?Order3State.NameController1.text:li5.details[i].docNo==137?Order3State.NameController2.text:li5.details[i].docNo==138?Order3State.NameController3.text:li5.details[i].docNo==139?Order3State.NameController4.text:li5.details[i].docNo==140?Order3State.NameController5.text:li5.details[i].itemName
  }</ItemName><Qty>${Order3State
          .cnt[i]}</Qty><UOM></UOM><Price>${(Order3State.itemtotal[i]).toString()}</Price><OrderFlag>$orderflag</OrderFlag><OrderFlagNo>$orderflagNo</OrderFlagNo></Table1>";

  bookingitem = "<NewDataSet>$bookingitem</NewDataSet>";
}
else
  {
    orderflag="Y";
    orderflagNo=OrderListState.orderflagno+1;
    print(Order3State.cnt.length);
    print(li5.details.length);
    for (int i = 0; i < li5.details.length; i++)
      if (Order3State.cnt[i] != 0)
        bookingitem =
        "$bookingitem<Table1><RowID>0</RowID><LineID>0</LineID><ItemCode>${li5
            .details[i].itemCode}</ItemCode><ItemName>${li5.details[i]
            .itemName}</ItemName><Qty>${Order3State
            .cnt[i]}</Qty><UOM></UOM><Price>${((Order3State.cnt[i]) *
            (li5.details[i].price)).toString()}</Price><OrderFlag>$orderflag</OrderFlag><OrderFlagNo>$orderflagNo</OrderFlagNo></Table1>";

    bookingitem = "<NewDataSet>$bookingitem</NewDataSet>";
  }
print(NewOrderState.dateupload+' '+ NewOrderState.timeupload);
print(bookingitem);
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_INSERT_ORDER xmlns="http://tempuri.org/">
      <DocNo>$doc</DocNo>
      <OrderDate>${NewOrderState.dateupload+' '+ NewOrderState.timeupload}</OrderDate>
      <OrderTime>${NewOrderState.timeupload}</OrderTime>      
      <CateringService>${Order2State.catcheck==true?"Y":"N"}</CateringService>
      <CateringAmount>${double.parse(cattot)}</CateringAmount>
      <VaselSet>${Order2State.vescheck==true?"Y":"N"}</VaselSet>
      <VaselAmount>${double.parse(vestot)}</VaselAmount>
      <Vehicle>${Order2State.vehcheck==true?"Y":"N"}</Vehicle>
      <VechicleAmount>${double.parse(vehtot)}</VechicleAmount>
      <OrderPrice>${(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total)).round()}</OrderPrice>
      <AdvanceType>$dropdownValue1</AdvanceType>
      <AdvanceAmount>$advanceamt</AdvanceAmount>
      <PaymentType>$dropdownValue2</PaymentType>
      <OrderStatus>$status</OrderStatus>
      <Branch>${LoginPageState.branchid}</Branch>
      <Remarks>${remarkscontroller.text}</Remarks>
      <ItemDetailXML><![CDATA[${bookingitem.toString()}]]></ItemDetailXML>
      <ItemDetailXMLID>${widget.payment}</ItemDetailXMLID>
      <UserID>1</UserID>
      <CategoryID>0</CategoryID>
      <Name>${Order4State.Namecontroller.text}</Name>
      <Mobile>${Order4State.Mobilecontroller.text}</Mobile>
      <Email>${Order4State.Emailcontroller.text}</Email>
      <Address>${Order4State.Addresscontroller.text}</Address>
      <GST>${Order4State.GSTcontroller.text}</GST>
      <WhatsappNumber>${Order4State.Whatsappcontroller.text}</WhatsappNumber>
      <Pincode>${Order4State.Pincodecontroller.text}</Pincode>
      <DisAmount>0</DisAmount>
      <DisApproval>N</DisApproval>
      <DisApplied>N</DisApplied>
      <DisApprovedBy>0</DisApprovedBy>
      <VehicleDelType>${Order2State.vehcheck?Order2State.dropdowntype:""}</VehicleDelType>
      <VehicleDelCharType>${Order2State.vehcheck?Order2State.dropdowndelcharge:""}</VehicleDelCharType>
      <CategoryName>${NewOrderState.dropdownValue1}</CategoryName> 
    </IN_MOB_INSERT_ORDER>
  </soap:Body>
</soap:Envelope>
''';
    log(envelope);
    print(vehkm);
    print(NewOrderState.categoryid);
    print(vehkm);

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
    log(response.body);
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });

      xml.XmlDocument parsedXml = xml.XmlDocument.parse(response.body);
      print(parsedXml.text);
      if (parsedXml.text != "[]")
      {


        final decoded = json.decode(parsedXml.text);
        li11 = SaveModel.fromJson(decoded[0]);
        print(li11.sTATUSID);
        if(li11.sTATUSID==1) {


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
        else if(li11.sTATUSID==2) {
          NewOrderState.datefromcontroller.text="";
          NewOrderState.categoryid=0;
          Order2State.cntcontroller.text="0";
          Order2State.vescontroller.text="";
          Order2State.vehcostcontroller.text="";
          Order2State.vehkmcontroller.text="";
          Fluttertoast.showToast(
              msg: "Order Updated Successfully",
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

    if(widget.edit!=0)
    {
print("call");
      NewOrderState.datefromcontroller.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
      NewOrderState.timeupload=DateFormat("hh:mm").format(DateTime.now());
      NewOrderState.dateupload=DateFormat("yyyy-MM-dd").format(DateTime.now());
      OrderRequest().then((value) => OrderItemRequest()).then((value) => itemRequest()).then((value) => AdvanceHistoryRequest());


    }
    else


    // for(int i=0;i<3;i++)
    // print(Order3State.cnt[i]);
itemRequest();
    // for(int i=0;i<3;i++)
    //   print(Order3State.cnt[i]);
    if(Order2State.vehcheck) {
      vehkm=Order2State.vehkmcontroller.text;
      vehtot=Order2State.vehcostcontroller.text;
    }
    else
      {
        vehkm="0";
        vehtot="0";
      }
    if(Order2State.vescheck) {

     vestot= Order2State.vescontroller.text;
    }
    else
      {
        vestot="0";
      }
    if(Order2State.catcheck)
    {
      cattot=(int.parse(Order2State.cntcontroller.text)*int.parse(Order2State.controller.text)).toString() ;
    }
    else
      {
        cattot="0";
      }
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Select Advance Type"),
              ],
            ),
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
if(newValue=="Full/Balance Amount") {
  advenable=false;
  AdvanceController.text = widget.edit == 0 ? ((int.parse(vehtot) +
      (int.parse(vestot) + (int.parse(cattot)) +
          (((Order3State.total * 5) / 100) + Order3State.total))))
      .round().toString() : widget.payment != 0
      ? ((int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) +
      (((Order3State.total * 5) / 100) + Order3State.total)) +
      li8.details[0].orderPrice) -
      (OrderDetailsState.li8.details[0].advanceAmount)).toStringAsFixed(2)
      : ((int.parse(vehtot) + (int.parse(vestot) + (int.parse(cattot)) +
      (((Order3State.total * 5) / 100) + Order3State.total))) -
      (OrderDetailsState.li8.details[0].advanceAmount)).toStringAsFixed(2);
}else {
  advenable=true;
  AdvanceController.text = "";
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
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: AdvanceController,
              decoration: InputDecoration(

                  enabled: advenable,
                  prefixIcon: Icon(Icons.money),
                  labelText: "Enter Advance Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),

              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Select Payment Mode"),
              ],
            ),
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
                value: dropdownValue2,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue2 = newValue;
                    if(dropdownValue2=="Receive Later")
                      {
                        AdvanceController.text="0";
                        dropdownValue1= "Advance";
                        advenable=false;

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
                                            "Are you Sure, Do you want to receive payment later ",
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
                                              controller: remarkscontroller,
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.calendar_today_outlined),
                                                labelText: 'Remarks',
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

                      }



                  });
                },

                items:widget.edit!=0?stringlist2
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList():stringlist2.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
            );
            }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: height / 50,
          ),
          ExpansionTile(
            title: Text("Order Summary"),
            initiallyExpanded: true,
            children: [
              widget.edit!=0?
              ListTile(title: Text("Order Time and Date"),trailing: Text("${(DateFormat("hh:mm a , dd-MM-yyyy")).format(DateTime.fromMillisecondsSinceEpoch(int.parse(OrderDetailsState.li8.details[0].bookingDate.toString().replaceAll("/Date(", "").replaceAll(")/", "")))) }")
              ):ListTile(title: Text("Order Time and Date"),trailing: Text("${NewOrderState.timecontroller.text },${NewOrderState.datefromcontroller.text}")),


              widget.edit!=0?
              Container(
                color:Colors.yellow.shade50,
                child: ExpansionTile(title: Text("Name and Address"),
                  leading: Icon(Icons.group),
                  children: [
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Name:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].name
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Mobile:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].mobile
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    li8.details[0].whatsappNumber!=li8.details[0].mobile? Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Whatsapp:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].whatsappNumber
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween):              Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: true,
                              onChanged: null
                          ),
                          Text("Whatsapp Same as Mobile")
                        ],
                      ),
                    ),
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Address:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].address
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Pincode:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].pincode
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    li8.details[0].email!=""?
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Email:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].email
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween):Container(),
                    li8.details[0].gSTno!=""?
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Pincode:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      li8.details[0].pincode
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween):Container(),
                  ],
                ),
              ):Container(
                color:Colors.yellow.shade50,
                child: ExpansionTile(title: Text("Name and Address"),
                  leading: Icon(Icons.group),
                  children: [
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Name:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      Order4State.Namecontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Mobile:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      Order4State.Mobilecontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    Order4State.Mobilecontroller.text!=Order4State.Whatsappcontroller.text? Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Whatsapp:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                     Order4State.Whatsappcontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween):              Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: true,
                              onChanged: null
                          ),
                          Text("Whatsapp Same as Mobile")
                        ],
                      ),
                    ),
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Address:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(Order4State.Addresscontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Pincode:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      Order4State.Pincodecontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween),
                    Order4State.Emailcontroller.text!=""?
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "Email:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      Order4State.Emailcontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween):Container(),
                    Order4State.GSTcontroller.text!=""?
                    Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 24.0,
                                right: 24,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "GST No:",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                              textAlign:
                              TextAlign.center,
                            ),
                          ),
                          Wrap(
                              direction: Axis
                                  .vertical, //default
                              alignment:
                              WrapAlignment
                                  .center,
                              children: [
                                Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        24.0),
                                    child: Text(
                                      Order4State.GSTcontroller.text
                                          .toString(),
                                      textAlign:
                                      TextAlign
                                          .center,
                                      style: TextStyle(
                                          color: Colors
                                              .indigo,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ))
                              ]),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween):Container(),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 24, right: 24, top: 8.0, bottom: 8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //           flex: 3,
              //           child: Text(
              //             "Item",
              //             textAlign: TextAlign.start,
              //           )),
              //       Expanded(
              //           flex: 1,
              //           child: Text(
              //             "Qty",
              //             textAlign: TextAlign.start,
              //           )),
              //       Expanded(
              //           flex: 1,
              //           child: Text(
              //             "Amount",
              //             textAlign: TextAlign.start,
              //           )),
              //     ],
              //   ),
              // ),
              // ListTile(
              //   title: Text("Item Details",style: TextStyle(color: String_Values.primarycolor),),
              // ),

              Container(
    color:Colors.purple.shade50,
                child: ExpansionTile(title: Text("Item Details"),
                leading: Icon(Icons.fastfood),
                backgroundColor: Colors.white,
                children: [

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
                  Divider(thickness: 2),
                  if(widget.edit!=0)
                    Column(
                      children: [
                        for(int j=0 ;j<=OrderListState.orderflagno;j++)

                          Column(children: [

                            // if(OrderListState.orderflagno!=0)
                            //   Divider(thickness: 2,),
                            if(OrderListState.orderflagno!=0&&j!=0)
                              Column(
                                children: [
                                  SizedBox(height: height/50,),
                                  ListTile(leading: Text("Additional Order $j",style: TextStyle(fontWeight: FontWeight.w800)),),

                                  // SizedBox(height: height/50,),

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
                                  Divider(thickness: 2,),
                                ],
                              ),
                            // SizedBox(height: height/50,),
                            for (int i = 0; i < li9.details.length; i++)
                              if(li9.details[i].orderFlagNo==j)
                                Column(
                                  children: [
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
                                                    li9.details[i].qty.round().toString(),
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


                                  ],
                                ),



                          ],),
                        // Divider(thickness: 2,),
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
                            Row(
                              children: [
                                Expanded(flex:4,child: ListTile(title: Text("Catering Service",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),))),
                                Expanded(flex:1,child: Text("Rs.${li8.details[0].cateringAmount}",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),)),

                              ],
                            )
                            // ListTile(leading: Icon(Icons.follow_the_signs,color: Colors.deepOrange,),
                            //   title: Text("Catering Service",style: TextStyle(color: Colors.deepOrange,),),
                            // trailing:  Text(
                            //   "Rs.${li8.details[0].cateringAmount}",
                            //   textAlign: TextAlign.start,
                            // ),
                            // ),
                            // Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 24, right: 24, top: 8.0, bottom: 8),
                            //     child: Column(
                            //       children: [
                            //         Row(
                            //             mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Expanded(
                            //                   flex: 4,
                            //                   child: Text(
                            //                     "Persons",
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //               Expanded(
                            //                   flex: 1,
                            //                   child: Text(
                            //                     "Amount".toString(),
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //             ]),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Row(
                            //             mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Expanded(
                            //                   flex: 4,
                            //                   child: Text(
                            //                     "${li8.details[0].cateringAmount/100}",
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //               Expanded(
                            //                   flex: 1,
                            //                   child: Text(
                            //                     "Rs.${li8.details[0].cateringAmount}",
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //             ]),
                            //       ],
                            //     ))
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
                                        leading: Icon(Icons.emoji_food_beverage_sharp,color: Colors.deepOrange,),
                                        title: Text("Vessel Set",style: TextStyle(color: Colors.deepOrange,),),
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
                                        leading: Icon(Icons.motorcycle_sharp,color: Colors.deepOrange,),
                                        title: Text("Transport",style: TextStyle(color: Colors.deepOrange,),),
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

                        // Column(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(right: 16),
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //               flex: 4,
                        //               child: ListTile(
                        //                 title: Text("Amount Paid",style: TextStyle(color: String_Values.primarycolor),),
                        //               )),
                        //           Expanded(
                        //               flex: 1,
                        //               child: Text(
                        //                 "Rs.${(li8.details[0].advanceAmount)}",
                        //                 textAlign: TextAlign.start,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //     // Padding(
                        //     //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
                        //     //     child: Column(
                        //     //       children: [
                        //     //         // Row(
                        //     //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     //         //     children: [
                        //     //         //       Expanded(flex:4,child: Container()),
                        //     //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
                        //     //         //     ]),
                        //     //         // SizedBox(height: 10,),
                        //     //         Row(
                        //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     //             children: [
                        //     //
                        //     //               Expanded(flex:4,child: Container(),),
                        //     //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
                        //     //
                        //     //             ]),
                        //     //       ],
                        //     //     ))
                        //   ],
                        // ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: ListTile(
                                        title: Text("Total Amount",style: TextStyle(color: String_Values.primarycolor),),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Rs.${(li8.details[0].orderPrice.round())}",
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


                        Divider(thickness: 2,),
                      ],
                    ),

                  widget.payment!=0?Column(
                    children: [
                      if(widget.edit!=0)
                        ListTile(leading: Text("New Additional Order",style: TextStyle(fontWeight: FontWeight.w800)),),
                      if(widget.edit!=0)
                        SizedBox(height: height/50,),
                      if(widget.edit!=0)
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
                      if(widget.edit!=0)
                        Divider(thickness: 2,),
                      for (int i = 0; i < li5.details.length; i++)
                        if (Order3State.cnt[i] != 0)
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
                                          li5.details[i].docNo==136?Order3State.NameController1.text:li5.details[i].docNo==137?Order3State.NameController2.text:li5.details[i].docNo==138?Order3State.NameController3.text:li5.details[i].docNo==139?Order3State.NameController4.text:li5.details[i].docNo==140?Order3State.NameController5.text:li5.details[i].itemName,

                                          textAlign: TextAlign.start,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          Order3State.cnt[i].toString(),
                                          textAlign: TextAlign.start,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Rs.${(Order3State.itemtotal[i]).toString()}",
                                          textAlign: TextAlign.start,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),


                    ],
                  ):Container(),

                  if(widget.payment!=0)
                    Column(
                      children: [
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
                                        "Rs.${Order3State.total}",
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
                                        "Rs.${(Order3State.total*5)/100}",
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
                                        "Rs.${((Order3State.total*5)/100)+Order3State.total}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontWeight: FontWeight.w800),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Order2State.catcheck == true
                            ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex:4,child: ListTile(title: Text("Catering Service",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),))),
                                Expanded(flex:1,child: Text("Rs.${(int.parse(Order2State.cntcontroller.text) * int.parse(Order2State.controller.text))}",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),)),

                              ],
                            )
                            // ListTile(leading: Icon(Icons.follow_the_signs,color: Colors.deepOrange,),
                            //   title: Text("Catering Service",style: TextStyle(color: Colors.deepOrange,),),
                            // trailing:  Text(
                            //   "Rs.${(int.parse(Order2State.cntcontroller.text) * int.parse(Order2State.controller.text))}",
                            //   textAlign: TextAlign.start,
                            // ),
                            // ),
                            // Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 24, right: 24, top: 8.0, bottom: 8),
                            //     child: Column(
                            //       children: [
                            //         Row(
                            //             mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Expanded(
                            //                   flex: 4,
                            //                   child: Text(
                            //                     "Persons",
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //               Expanded(
                            //                   flex: 1,
                            //                   child: Text(
                            //                     "Amount".toString(),
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //             ]),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Row(
                            //             mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Expanded(
                            //                   flex: 4,
                            //                   child: Text(
                            //                     Order2State.cntcontroller.text,
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //               Expanded(
                            //                   flex: 1,
                            //                   child: Text(
                            //                     "Rs.${(int.parse(Order2State.cntcontroller.text) * int.parse(Order2State.controller.text))}",
                            //                     textAlign: TextAlign.start,
                            //                   )),
                            //             ]),
                            //       ],
                            //     ))
                          ],
                        )
                            : Container(),
                        Order2State.vescheck == true
                            ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: ListTile(
                                        leading: Icon(Icons.emoji_food_beverage_sharp,color: Colors.deepOrange,),
                                        title: Text("Vessel Set",style: TextStyle(color: Colors.deepOrange,),),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Rs.${Order2State.vescontroller.text}",
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
                        Order2State.vehcheck == true && Order2State.vehcostcontroller.text!="0"
                            ? Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: ListTile(
                                    leading: Icon(Icons.motorcycle_sharp,color: Colors.deepOrange,),
                                    title: Text("Transport",style: TextStyle(color: Colors.deepOrange,),),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Rs.${Order2State.vehcostcontroller.text}",
                                    textAlign: TextAlign.start,
                                  )),
                            ],
                          ),
                        )
                            : Container(),
                      ],
                    ),
                ],
                ),
              ),


              // widget.edit != 0
              //     ? Column(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(right: 16),
              //       child: Row(
              //         children: [
              //           Expanded(
              //               flex: 4,
              //               child: ListTile(
              //                 title: Text("Total Amount",style: TextStyle(color: String_Values.primarycolor),),
              //               )),
              //           Expanded(
              //               flex: 1,
              //               child: Text(
              //                 "Rs.${  (int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))).toStringAsFixed(2) }",
              //                 textAlign: TextAlign.start,
              //               )),
              //         ],
              //       ),
              //     ),
              //     // Padding(
              //     //     padding: const EdgeInsets.only(left:24,right:24,top:8.0,bottom: 8),
              //     //     child: Column(
              //     //       children: [
              //     //         // Row(
              //     //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //         //     children: [
              //     //         //       Expanded(flex:4,child: Container()),
              //     //         //       Expanded(flex:1,child: Text("Amount".toString(),textAlign: TextAlign.start,)),
              //     //         //     ]),
              //     //         // SizedBox(height: 10,),
              //     //         Row(
              //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //             children: [
              //     //
              //     //               Expanded(flex:4,child: Container(),),
              //     //               Expanded(flex:1,child: Text((int.parse(Order2State.vescontroller.text)).toString(),textAlign: TextAlign.start,)),
              //     //
              //     //             ]),
              //     //       ],
              //     //     ))
              //   ],
              // )
              //     : Container(),
              // Divider(thickness: 2,),

              widget.edit != 0
                  ? Column(
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
                              "Rs.${OrderDetailsState.li8.details[0].advanceAmount.toStringAsFixed(2) }",
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
              SizedBox(height: 10,),
              widget.payment!=0&&widget.edit != 0?Container(
                padding: const EdgeInsets.only(right:16.0),
                child: Row(
                  children: [
                    Expanded(flex:4,child: ListTile(title: Text("Grant Total",style: TextStyle(fontWeight: FontWeight.w800,color: String_Values.primarycolor),))),
                    Expanded(flex:1,child: Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))+li8.details[0].orderPrice)).round() }",style: TextStyle(fontWeight: FontWeight.w800,color: String_Values.primarycolor),)),

                  ],
                ),
              ):Container(
              ),
              SizedBox(height: 10,),
              widget.edit==0?     Container(

                padding: const EdgeInsets.only(right:16.0),
                child: Row(
                  children: [
                    Expanded(flex:4,child: ListTile(title: Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),))),
                    Expanded(flex:1,child: Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))).round() }",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),)),

                  ],
                ),
              ):
              widget.payment!=0?Container(

                padding: const EdgeInsets.only(right:16.0),
                child: Row(
                  children: [
                    Expanded(flex:4,child: ListTile(title: Text("Amount Receivable",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),))),
                    Expanded(flex:1,child: Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))+li8.details[0].orderPrice)-(OrderDetailsState.li8.details[0].advanceAmount)).toStringAsFixed(2) }",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),)),

                  ],
                ),
              ):Container(

                padding: const EdgeInsets.only(right:16.0),
                child: Row(
                  children: [
                    Expanded(flex:4,child: ListTile(title: Text("Amount Receivable",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),))),
                    Expanded(flex:1,child: Text("Rs.${((int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))-(OrderDetailsState.li8.details[0].advanceAmount)).toStringAsFixed(2) }",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.purple),)),

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (widget.edit == 0) {
            if ((dropdownValue1 != "Advance Type") &&
                (dropdownValue2 != "Payment Mode") &&
                (AdvanceController.text.length != 0) &&
                (double.parse(AdvanceController.text) <= (int.parse(vehtot) +
                    (int.parse(vestot) + (int.parse(cattot)) +
                        (((Order3State.total * 5) / 100) +
                            Order3State.total))).round()))
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
                                  "Are you Sure, Do you want to confirm your order..",
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: height / 30,
                              ),
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
                                          // pdf();
                                          postRequest().then((value) => generateInvoice1()).then((value)
                                          {
                                            NewOrderState.datefromcontroller.text="";
                                            Order4State.Mobilecontroller.text="";
                                            NewOrderState.categoryid=0;
                                            Order2State.cntcontroller.text="0";
                                            Order2State.vescontroller.text="";
                                            Order2State.vehcostcontroller.text="";
                                            Order2State.vehkmcontroller.text="";
                                            Order4State.Addresscontroller.text="";
                                            Order4State.Emailcontroller.text="";
                                            Order4State.Whatsappcontroller.text="";
                                            Order4State.Pincodecontroller.text="";
                                            Order4State.GSTcontroller.text="";

                                          })
                                          ;
                                          Navigator.pop(context);

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

            else if (dropdownValue1 == "Advance Type")
              Fluttertoast.showToast(
                  msg: "Please choose Advance Type",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            else if (dropdownValue2 == "Payment Mode")
              Fluttertoast.showToast(
                  msg: "Please choose Payment Mode",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            else if (AdvanceController.text.length == 0)
              Fluttertoast.showToast(
                  msg: "Please Enter Advance Amount",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            else
              Fluttertoast.showToast(
                  msg: "Advance Amount should not greater than total amount",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
          }

          else {
            if (widget.payment == 0) {
              if ((dropdownValue1 != "Advance Type") &&
                  (dropdownValue2 != "Payment Mode") &&
                  (AdvanceController.text.length != 0) &&
                  (double.parse(AdvanceController.text) <= (int.parse(vehtot) +
                      (int.parse(vestot) + (int.parse(cattot)) +
                          (((Order3State.total * 5) / 100) +
                              Order3State.total))) -
                      OrderDetailsState.li8.details[0].advanceAmount))
                postRequest().then((value)
                {
                  NewOrderState.datefromcontroller.text="";
                  Order4State.Mobilecontroller.text="";
                  NewOrderState.categoryid=0;
                  Order2State.cntcontroller.text="0";
                  Order2State.vescontroller.text="";
                  Order2State.vehcostcontroller.text="";
                  Order2State.vehkmcontroller.text="";
                  Order4State.Addresscontroller.text="";
                  Order4State.Emailcontroller.text="";
                  Order4State.Whatsappcontroller.text="";
                  Order4State.Pincodecontroller.text="";
                  Order4State.GSTcontroller.text="";

                })
              ;
              else if (dropdownValue1 == "Advance Type")
                Fluttertoast.showToast(
                    msg: "Please choose Advance Type",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              else if (dropdownValue2 == "Payment Mode")
                Fluttertoast.showToast(
                    msg: "Please choose Payment Mode",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              else if (AdvanceController.text.length == 0)
                Fluttertoast.showToast(
                    msg: "Please Enter Advance Amount",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              else
                Fluttertoast.showToast(
                    msg: "Advance Amount should not greater than Payable Amount",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
            }
            else
              {

                if ((dropdownValue1 != "Advance Type") &&
                    (dropdownValue2 != "Payment Mode") &&
                    (AdvanceController.text.length != 0) &&
                    (double.parse(AdvanceController.text) <= (int.parse(vehtot) +
                        (int.parse(vestot) + (int.parse(cattot)) +
                            (((Order3State.total * 5) / 100) +
                                Order3State.total+li8.details[0].orderPrice))) -
                        OrderDetailsState.li8.details[0].advanceAmount))
                  postRequest().then((value) => generateInvoice1()).then((value)
                  {
                    NewOrderState.datefromcontroller.text="";
                    Order4State.Mobilecontroller.text="";
                    NewOrderState.categoryid=0;
                    Order2State.cntcontroller.text="0";
                    Order2State.vescontroller.text="";
                    Order2State.vehcostcontroller.text="";
                    Order2State.vehkmcontroller.text="";
                    Order4State.Addresscontroller.text="";
                    Order4State.Emailcontroller.text="";
                    Order4State.Whatsappcontroller.text="";
                    Order4State.Pincodecontroller.text="";
                    Order4State.GSTcontroller.text="";

                  })
                ;
                else if (dropdownValue1 == "Advance Type")
                  Fluttertoast.showToast(
                      msg: "Please choose Advance Type",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                else if (dropdownValue2 == "Payment Mode")
                  Fluttertoast.showToast(
                      msg: "Please choose Payment Mode",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                else if (AdvanceController.text.length == 0)
                  Fluttertoast.showToast(
                      msg: "Please Enter Advance Amount",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                else
                  Fluttertoast.showToast(
                      msg: "Advance Amount should not greater than Payable Amount",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

              }
          }
        }
          ,
        icon: Icon(Icons.navigate_next),backgroundColor:String_Values.primarycolor,
        label: Text(widget.edit==0?"Place Order":"Update Order"),
      ),
    );
  }
}
