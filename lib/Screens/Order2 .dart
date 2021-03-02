import 'dart:convert';

import 'package:anandhasapp/Models/Category.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Screens/Order3.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart' as xml;
class Order3 extends StatefulWidget {
  Order3({Key key,this.id});
  int id;
  @override
  Order3State createState() => Order3State();
}

class Order3State extends State<Order3> {
  int _current = 0;

  bool loading=false;

  CategoryModelList li4;

 static ItemModelList li5;

  static var cnt=[0,0,0];

  static var total;
  Future<http.Response> itemRequest() async {
    setState(() {
      loading = true;
    });
    var envelope = '''
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <IN_MOB_GETITEMMASTER xmlns="http://tempuri.org/">
      <BranchID>1</BranchID>
      <CategoryID>${widget.id}</CategoryID>
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
      setState(() {
        cnt.clear();
        for(int i=0;i<li5.details.length;i++) {
          cnt.add(0);
          _controllers.add(new TextEditingController());
          _controllers[i].text="0";
        }
      });
print(cnt[0]);
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
  TextEditingController datefromcontroller = new TextEditingController();
  TextEditingController cntcontroller = new TextEditingController();
  TextEditingController cnt1controller = new TextEditingController();
  TextEditingController cnt2controller = new TextEditingController();
  TextEditingController cnt3controller = new TextEditingController();
  final List<TextEditingController> _controllers = List();

  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist = ["Select", "7 AM", "8 AM", "9 AM"];


  @override
  void initState() {
    total=0;
    itemRequest();
    cnt1controller.text="0";
    cnt2controller.text="0";
    cnt3controller.text="0";
    cntcontroller.text="0";
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final List<String> imgList = [
      "https://www.shreeanandhaas.com/images/special-menu/2-in-1-Idiyappam.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Garlic-Kesari.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Wheat-Rava-Idly.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Podi-Idly.jpg",
      "https://www.shreeanandhaas.com/images/special-menu/Diet-Breakfast.jpg",
    ];
    return Scaffold(
      body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(

        child: Column(children: [
for(int i=0;i<li5.details.length;i++)
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 2, child: Image.asset("logo.png")),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(li5.details[i].itemName),
                          Text(
                            li5.details[i].price.toString(),
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        print(cnt[i]);
                                        if(cnt[i]!=0)
                                        cnt[i]--;
                                        _controllers[i].text=cnt[i].toString();
                                        print(cnt[i]);
                                        total=0;
                                        for(int j=0;j<li5.details.length;j++)
                                          total=total+(cnt[j]*li5.details[j].price);
                                      });
                                    },),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 30,
                                      child: TextField(
                                        decoration: InputDecoration
                                          (

                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                        onSubmitted: (value)
                                        {
                                          setState(() {
                                            cnt[i]=int.parse(_controllers[i].text);
                                            total=0;
                                            for(int j=0;j<li5.details.length;j++)
                                              total=total+(cnt[j]*li5.details[j].price);
                                          });


                                        },
                                        enabled:true,
                                        controller: _controllers[i],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        print(cnt[i]);
                                        cnt[i]++;
                                        _controllers[i].text=cnt[i].toString();
                                        print(cnt[i]);

                                        total=0;
                                        for(int j=0;j<li5.details.length;j++)
                                          total=total+(cnt[j]*li5.details[j].price);


                                      });

                                    },),
                                  ),

                                ],
                              ),
                            )
                          ]
                      ),
                    ),
                  ],
                )),
          ) ,

          SizedBox(height: height/30,),
      


        ])
      ),
      bottomSheet:           Container(
        height: AppBar().preferredSize.height+10,

        width: width,
        color: String_Values.primarycolor,
        child: Card(
          color: String_Values.primarycolor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: total!=null?Text("Item Total :$total ",style: TextStyle(color: Colors.white),):Text("Item Total :0 ",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(

          title: Text(
        "Order",
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => Order2()));
        },
        icon: Icon(Icons.navigate_next,color: String_Values.primarycolor,),backgroundColor:Colors.white ,
        label: Text("Next",style: TextStyle(color:String_Values.primarycolor),),
      ),
    );
  }
}
