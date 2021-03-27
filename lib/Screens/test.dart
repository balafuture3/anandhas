import 'package:anandhasapp/Screens/OrderDetails.dart';
import 'package:anandhasapp/Screens/Report.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {



  Future<void> main() async {
    final pdf = pw.Document();

    var data = await rootBundle.load("open-sans.ttf");

    final ttf = pw.Font.ttf(data.buffer.asByteData());
    const imageProvider = const AssetImage('logo.png');
    final image = await flutterImageProvider(imageProvider);

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
          children:[
              pw.Header(
              child: pw.Row(children: [

                pw.Column(
                  children: [
                    pw.Text("Ratnaa Shree Anandhaas Hotels Private Limited",style: pw.TextStyle(fontSize: 18))
                  ]
                ),
                pw.Row(
                    children: [
                      pw.Padding(
                        padding:
                        const pw.EdgeInsets
                            .only(
                            left: 24.0,
                            right: 24,
                            top: 10,
                            bottom: 10),
                        child: pw.Text(
                          "Name:",
                          softWrap: true,
                          style: pw.TextStyle(
                              fontSize: 15,
                              ),

                        ),
                      ),
                      pw.Wrap(
                          direction: pw.Axis
                              .vertical, //default
                          alignment:
                          pw.WrapAlignment
                              .center,
                          children: [
                            pw.Padding(
                                padding:
                                const pw.EdgeInsets
                                    .only(
                                    right:
                                    24.0),
                                child: pw.Text(
                                  OrderDetailsState.li8.details[0].name
                                      .toString(),
                                  textAlign:
                                  pw.TextAlign
                                      .center,

                                ))
                          ]),
                    ],
                    mainAxisAlignment:
                    pw.MainAxisAlignment
                        .spaceBetween),
                // Row(
                //     children: [
                //       Padding(
                //         padding:
                //         const EdgeInsets
                //             .only(
                //             left: 24.0,
                //             right: 24,
                //             top: 10,
                //             bottom: 10),
                //         child: Text(
                //           "Mobile:",
                //           softWrap: true,
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight:
                //               FontWeight
                //                   .w600),
                //           textAlign:
                //           TextAlign.center,
                //         ),
                //       ),
                //       Wrap(
                //           direction: Axis
                //               .vertical, //default
                //           alignment:
                //           WrapAlignment
                //               .center,
                //           children: [
                //             Padding(
                //                 padding:
                //                 const EdgeInsets
                //                     .only(
                //                     right:
                //                     24.0),
                //                 child: Text(
                //                   li8.details[0].mobile
                //                       .toString(),
                //                   textAlign:
                //                   TextAlign
                //                       .center,
                //                   style: TextStyle(
                //                       color: Colors
                //                           .indigo,
                //                       fontWeight:
                //                       FontWeight
                //                           .w600),
                //                 ))
                //           ]),
                //     ],
                //     mainAxisAlignment:
                //     MainAxisAlignment
                //         .spaceBetween),
                // li8.details[0].whatsappNumber!=li8.details[0].mobile? Row(
                //     children: [
                //       Padding(
                //         padding:
                //         const EdgeInsets
                //             .only(
                //             left: 24.0,
                //             right: 24,
                //             top: 10,
                //             bottom: 10),
                //         child: Text(
                //           "Whatsapp:",
                //           softWrap: true,
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight:
                //               FontWeight
                //                   .w600),
                //           textAlign:
                //           TextAlign.center,
                //         ),
                //       ),
                //       Wrap(
                //           direction: Axis
                //               .vertical, //default
                //           alignment:
                //           WrapAlignment
                //               .center,
                //           children: [
                //             Padding(
                //                 padding:
                //                 const EdgeInsets
                //                     .only(
                //                     right:
                //                     24.0),
                //                 child: Text(
                //                   li8.details[0].whatsappNumber
                //                       .toString(),
                //                   textAlign:
                //                   TextAlign
                //                       .center,
                //                   style: TextStyle(
                //                       color: Colors
                //                           .indigo,
                //                       fontWeight:
                //                       FontWeight
                //                           .w600),
                //                 ))
                //           ]),
                //     ],
                //     mainAxisAlignment:
                //     MainAxisAlignment
                //         .spaceBetween):              Container(
                //   margin: EdgeInsets.only(left: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Checkbox(
                //           value: true,
                //           onChanged: null
                //       ),
                //       Text("Whatsapp Same as Mobile")
                //     ],
                //   ),
                // ),
                // Row(
                //     children: [
                //       Padding(
                //         padding:
                //         const EdgeInsets
                //             .only(
                //             left: 24.0,
                //             right: 24,
                //             top: 10,
                //             bottom: 10),
                //         child: Text(
                //           "Address:",
                //           softWrap: true,
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight:
                //               FontWeight
                //                   .w600),
                //           textAlign:
                //           TextAlign.center,
                //         ),
                //       ),
                //       Wrap(
                //           direction: Axis
                //               .vertical, //default
                //           alignment:
                //           WrapAlignment
                //               .center,
                //           children: [
                //             Padding(
                //                 padding:
                //                 const EdgeInsets
                //                     .only(
                //                     right:
                //                     24.0),
                //                 child: Text(
                //                   li8.details[0].address
                //                       .toString(),
                //                   textAlign:
                //                   TextAlign
                //                       .center,
                //                   style: TextStyle(
                //                       color: Colors
                //                           .indigo,
                //                       fontWeight:
                //                       FontWeight
                //                           .w600),
                //                 ))
                //           ]),
                //     ],
                //     mainAxisAlignment:
                //     MainAxisAlignment
                //         .spaceBetween),
                // Row(
                //     children: [
                //       Padding(
                //         padding:
                //         const EdgeInsets
                //             .only(
                //             left: 24.0,
                //             right: 24,
                //             top: 10,
                //             bottom: 10),
                //         child: Text(
                //           "Pincode:",
                //           softWrap: true,
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight:
                //               FontWeight
                //                   .w600),
                //           textAlign:
                //           TextAlign.center,
                //         ),
                //       ),
                //       Wrap(
                //           direction: Axis
                //               .vertical, //default
                //           alignment:
                //           WrapAlignment
                //               .center,
                //           children: [
                //             Padding(
                //                 padding:
                //                 const EdgeInsets
                //                     .only(
                //                     right:
                //                     24.0),
                //                 child: Text(
                //                   li8.details[0].pincode
                //                       .toString(),
                //                   textAlign:
                //                   TextAlign
                //                       .center,
                //                   style: TextStyle(
                //                       color: Colors
                //                           .indigo,
                //                       fontWeight:
                //                       FontWeight
                //                           .w600),
                //                 ))
                //           ]),
                //     ],
                //     mainAxisAlignment:
                //     MainAxisAlignment
                //         .spaceBetween),
                // li8.details[0].email!=""?
                // Row(
                //     children: [
                //       Padding(
                //         padding:
                //         const EdgeInsets
                //             .only(
                //             left: 24.0,
                //             right: 24,
                //             top: 10,
                //             bottom: 10),
                //         child: Text(
                //           "Email:",
                //           softWrap: true,
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight:
                //               FontWeight
                //                   .w600),
                //           textAlign:
                //           TextAlign.center,
                //         ),
                //       ),
                //       Wrap(
                //           direction: Axis
                //               .vertical, //default
                //           alignment:
                //           WrapAlignment
                //               .center,
                //           children: [
                //             Padding(
                //                 padding:
                //                 const EdgeInsets
                //                     .only(
                //                     right:
                //                     24.0),
                //                 child: Text(
                //                   li8.details[0].email
                //                       .toString(),
                //                   textAlign:
                //                   TextAlign
                //                       .center,
                //                   style: TextStyle(
                //                       color: Colors
                //                           .indigo,
                //                       fontWeight:
                //                       FontWeight
                //                           .w600),
                //                 ))
                //           ]),
                //     ],
                //     mainAxisAlignment:
                //     MainAxisAlignment
                //         .spaceBetween):Container(),
                // li8.details[0].gSTno!=""?
                // Row(
                //     children: [
                //       Padding(
                //         padding:
                //         const EdgeInsets
                //             .only(
                //             left: 24.0,
                //             right: 24,
                //             top: 10,
                //             bottom: 10),
                //         child: Text(
                //           "GST No:",
                //           softWrap: true,
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight:
                //               FontWeight
                //                   .w600),
                //           textAlign:
                //           TextAlign.center,
                //         ),
                //       ),
                //       Wrap(
                //           direction: Axis
                //               .vertical, //default
                //           alignment:
                //           WrapAlignment
                //               .center,
                //           children: [
                //             Padding(
                //                 padding:
                //                 const EdgeInsets
                //                     .only(
                //                     right:
                //                     24.0),
                //                 child: Text(
                //                   li8.details[0].gSTno
                //                       .toString(),
                //                   textAlign:
                //                   TextAlign
                //                       .center,
                //                   style: TextStyle(
                //                       color: Colors
                //                           .indigo,
                //                       fontWeight:
                //                       FontWeight
                //                           .w600),
                //                 ))
                //           ]),
                //     ],
                //     mainAxisAlignment:
                //     MainAxisAlignment
                //         .spaceBetween):Container(),

              ])
          ),
              ]);
           // Center
        })); // Pa
    Directory tempDir;// g
    if (Platform.isAndroid) {
      tempDir= await getExternalStorageDirectory();
      // Android-specific code
    } else {
     tempDir = await getApplicationDocumentsDirectory();
      // iOS-specific code
    }

    String tempPath = tempDir.path;
    print(tempPath);
    File file = File('$tempPath/example.pdf');
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'my-document.pdf');
    // await Printing.layoutPdf(
    //     onLayout: (PdfPageFormat format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text(
                'Generate PDF',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: main,
            )
          ],
        ),
      ),
    );
  }
}
