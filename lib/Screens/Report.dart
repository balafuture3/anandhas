
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:printing/printing.dart';

reportView(context) async {
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
      PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: BoxDecoration(
                border:
                BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
        Header(
            level: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Report', textScaleFactor: 2),
                  PdfLogo()
                ])),

        Padding(padding: const EdgeInsets.all(10)),
        Table.fromTextArray(context: context, data: const <List<String>>[
          <String>['Year', 'Ipsum', 'Lorem'],
          <String>['2000', 'Ipsum 1.0', 'Lorem 1'],
          <String>['2001', 'Ipsum 1.1', 'Lorem 2'],
          <String>['2002', 'Ipsum 1.2', 'Lorem 3'],
          <String>['2003', 'Ipsum 1.3', 'Lorem 4'],
          <String>['2004', 'Ipsum 1.4', 'Lorem 5'],
          <String>['2004', 'Ipsum 1.5', 'Lorem 6'],
          <String>['2006', 'Ipsum 1.6', 'Lorem 7'],
          <String>['2007', 'Ipsum 1.7', 'Lorem 8'],
          <String>['2008', 'Ipsum 1.7', 'Lorem 9'],
        ]),
      ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());

}