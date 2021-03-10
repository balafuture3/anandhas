import 'dart:convert';

import 'package:anandhasapp/Models/InsertOrderResponse.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/Screens/NewOrder.dart';
import 'package:anandhasapp/Screens/Order2 .dart';
import 'package:anandhasapp/Screens/Order3.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import 'OrderList.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({Key key,this.edit});
  int edit;
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  bool loading = false;

  ItemModelList li5;

  var dropdownValue1="Advance Type";
  TextEditingController AdvanceController = new TextEditingController();
  var stringlist=["Advance Type","Half Advance","Full Advance"];

  var dropdownValue2="Payment Mode";
  var stringlist2=["Payment Mode","Cash","Card","Net Banking"];

  SaveResponse li6;

  String vehtot;

  String vestot;

  String cattot;

  String bookingitem;

  double advanceamt;

  String vehkm;

  int doc;

  Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GETITEMMASTER xmlns="http://tempuri.org/">
      <BranchID>1</BranchID>
      <CategoryID>${NewOrderState.categoryid}</CategoryID>
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
  doc=widget.edit;
    bookingitem = "";
    advanceamt=double.parse(AdvanceController.text);
    // if(dropdownValue1=="Half Advance")
    //   advanceamt=(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total))/2;
    // else
    //   advanceamt=(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total));
if(widget.edit==0) {
  for (int i = 0; i < li5.details.length; i++)
    if (Order3State.cnt[i] != 0)
      bookingitem =
      "$bookingitem<Table1><RowID>0</RowID><LineID>0</LineID><ItemCode>${li5
          .details[i].itemCode}</ItemCode><ItemName>${li5.details[i]
          .itemName}</ItemName><Qty>${Order3State
          .cnt[i]}</Qty><UOM></UOM><Price>${((Order3State.cnt[i]) *
          (li5.details[i].price)).toString()}</Price></Table1>";

  bookingitem = "<NewDataSet>$bookingitem</NewDataSet>";
}
else
  {
    for (int i = 0; i < li5.details.length; i++)
      if (Order3State.cnt[i] != 0)
        bookingitem =
        "$bookingitem<Table1><RowID>${OrderListState.rowid[i]}</RowID><LineID>${OrderListState.lineid[i]}</LineID><ItemCode>${li5
            .details[i].itemCode}</ItemCode><ItemName>${li5.details[i]
            .itemName}</ItemName><Qty>${Order3State
            .cnt[i]}</Qty><UOM></UOM><Price>${((Order3State.cnt[i]) *
            (li5.details[i].price)).toString()}</Price></Table1>";

    bookingitem = "<NewDataSet>$bookingitem</NewDataSet>";
  }
print(bookingitem);
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_INSERT_ORDER xmlns="http://tempuri.org/">
      <DocNo>$doc</DocNo>
      <OrderDate>${NewOrderState.datefromcontroller.text}</OrderDate>
      <OrderTime>${NewOrderState.timeupload}</OrderTime>      
      <CateringService>${Order2State.catcheck==true?"Y":"N"}</CateringService>
      <CateringAmount>${double.parse(cattot)}</CateringAmount>
      <VaselSet>${Order2State.vescheck==true?"Y":"N"}</VaselSet>
      <VaselAmount>${double.parse(vestot)}</VaselAmount>
      <Vehicle>${Order2State.vehcheck==true?"Y":"N"}</Vehicle>
      <VechicleAmount>${double.parse(vehtot)}</VechicleAmount>
      <OrderPrice>${(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+((Order3State.total*5)/100)+Order3State.total))}</OrderPrice>
      <AdvanceType>$dropdownValue1</AdvanceType>
      <AdvanceAmount>$advanceamt</AdvanceAmount>
      <PaymentType>$dropdownValue2</PaymentType>
      <OrderStatus>P</OrderStatus>
      <Branch>${LoginPageState.branchid}</Branch>
      <Remarks></Remarks>
      <ItemDetailXML><![CDATA[${bookingitem.toString()}]]></ItemDetailXML>
      <ItemDetailXMLID>1</ItemDetailXMLID>
      <UserID>1</UserID>
      <CategoryID>${NewOrderState.categoryid}</CategoryID>
       <VechicleKM>$vehkm</VechicleKM>
    </IN_MOB_INSERT_ORDER>
  </soap:Body>
</soap:Envelope>
''';
    print(envelope);
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
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });

      xml.XmlDocument parsedXml = xml.XmlDocument.parse(response.body);
      print(parsedXml.text);
      if (parsedXml.text != "[]")
      {


        final decoded = json.decode(parsedXml.text);
        li6 = SaveResponse.fromJson(decoded[0]);
        print(li6.sTATUSID);
        if(li6.sTATUSID==1) {
          NewOrderState.datefromcontroller.text="";
          NewOrderState.categoryid=0;
          Order2State.cntcontroller.text="0";
          Order2State.vescontroller.text="";
          Order2State.vehcostcontroller.text="";
          Order2State.vehkmcontroller.text="";
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
        else if(li6.sTATUSID==2) {
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
showDialog(context: context,child: AlertDialog(
  title: Text(response.body),
));
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
    if(widget.edit!=0) {
      NewOrderState.datefromcontroller.text = "09-03-2021";
      NewOrderState.timeupload="12:21";
    }

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
      cattot=(int.parse(Order2State.cntcontroller.text)*Order2State.personamt).toString() ;
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

                  enabled: true,
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



                  });
                },
                items: stringlist2
                    .map<DropdownMenuItem<String>>((String value) {
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
              ListTile(
                title: Text("Item Details",style: TextStyle(color: String_Values.primarycolor),),
              ),
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
                                  li5.details[i].itemName,
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
                                  "Rs.${(Order3State.cnt[i] * li5.details[i].price).toString()}",
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
                        ListTile(
                          title: Text("Catering Service",style: TextStyle(color: String_Values.primarycolor),),
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
                                          flex: 4,
                                          child: Text(
                                            "Persons",
                                            textAlign: TextAlign.start,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Amount".toString(),
                                            textAlign: TextAlign.start,
                                          )),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Text(
                                            Order2State.cntcontroller.text,
                                            textAlign: TextAlign.start,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${(int.parse(Order2State.cntcontroller.text) * Order2State.personamt)}",
                                            textAlign: TextAlign.start,
                                          )),
                                    ]),
                              ],
                            ))
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
                                    title: Text("Vessel Set",style: TextStyle(color: String_Values.primarycolor),),
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
              Order2State.vehcheck == true
                  ? Column(
                      children: [
                        ListTile(
                          title: Text("Vehicle Drop",style: TextStyle(color: String_Values.primarycolor),),
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
                                          flex: 4,
                                          child: Text(
                                            "Distance in Kms".toString(),
                                            textAlign: TextAlign.start,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Amount".toString(),
                                            textAlign: TextAlign.start,
                                          )),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Text(
                                            Order2State
                                                    .vehkmcontroller.text,
                                            textAlign: TextAlign.start,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Rs.${Order2State.vehcostcontroller.text}",
                                            textAlign: TextAlign.start,
                                          )),
                                    ]),
                              ],
                            ))
                      ],
                    )
                  : Container(),


              SizedBox(height: 10,),
              Container(
                color: String_Values.primarycolor.withOpacity(1),
                padding: const EdgeInsets.only(right:16.0),
                child: Row(
                  children: [
                    Expanded(flex:4,child: ListTile(title: Text("Total",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),))),
                    Expanded(flex:1,child: Text("Rs.${(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total))).toString()}",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),)),

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
          if((dropdownValue1!="Advance Type")&&(dropdownValue2!="Payment Mode")&&(AdvanceController.text.length!=0)&&(double.parse(AdvanceController.text)<=(int.parse(vehtot)+(int.parse(vestot)+(int.parse(cattot))+(((Order3State.total*5)/100)+Order3State.total)))))
          postRequest();
          else
            if(dropdownValue1=="Advance Type")
            Fluttertoast.showToast(
                msg: "Please choose Advance Type",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            else if(dropdownValue2=="Payment Mode")
              Fluttertoast.showToast(
                  msg: "Please choose Payment Mode",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            else if(AdvanceController.text.length==0)
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

        },
        icon: Icon(Icons.navigate_next),backgroundColor:String_Values.primarycolor,
        label: Text(widget.edit==0?"Place Order":"Update Order"),
      ),
    );
  }
}
