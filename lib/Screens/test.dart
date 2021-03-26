import 'package:anandhasapp/Screens/Report.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets/placeholders.dart';
import 'package:printing/printing.dart';
import 'dart:io';

import 'package:syncfusion_flutter_pdf/pdf.dart';
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
                pw.Image.provider(image),
                pw.Column(
                  children: [
                    pw.Text("Ratnaa Shree Anandhaas Hotels Private Limited",style: pw.TextStyle(fontSize: 18))
                  ]
                )

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
