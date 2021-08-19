import 'dart:convert';

import 'package:anandhasapp/Models/Category.dart';
import 'package:anandhasapp/Models/ItemModel.dart';
import 'package:anandhasapp/Screens/NewOrderChooseCatering.dart';
import 'package:anandhasapp/Screens/OrderSummary.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:xml/xml.dart' as xml;

import 'NewOrderItemSearch.dart';
class Order3 extends StatefulWidget {
  Order3({Key key,this.id,this.edit});
  int id;
  int edit;
  @override
  Order3State createState() => Order3State();
}

class Order3State extends State<Order3> {
  int _current = 0;
  List<FilterList> li2 = new List();
  bool loading=false;
  var dropdownValue = "Select";
  var dropdownValue1 = "All";
  var stringlist = ["All"];
  CategoryModelList li4;

 static ItemModelList li5;

  static var cnt=[0,0,0];

  static var total;

  // var itemtotal;
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
      if(widget.edit==0) {

        setState(() {
          total=0;
          cnt.clear();
          stringlist.clear();
          stringlist.add("All");
          for (int i = 0; i < li5.details.length; i++) {
            cnt.add(0);
            itemtotal.add(0);
            if(!stringlist.contains(li5.details[i].itemCode))
              stringlist.add(li5.details[i].itemCode);
            controllers.add(new TextEditingController());
            controllers[i].text = "0";
            // checkvalue.add(CheckList(false,""));
            // li2.add(
            //     FilterList(li5.details[i].itemCode,li5.details[i].itemName,li5.details[i].price,li5.details[i].uOM,li5.details[i].qty));

          }

        });
      }
      else
      {

        setState(() {
          total=0;
          cnt.clear();
          stringlist.clear();
          stringlist.add("All");
          for (int i = 0; i < li5.details.length; i++) {
            if(!stringlist.contains(li5.details[i].itemCode))
              stringlist.add(li5.details[i].itemCode);
            cnt.add(0);
            itemtotal.add(0);
            controllers.add(new TextEditingController());
            controllers[i].text = "0";
            // checkvalue.add(CheckList(false,""));
            // li2.add(
            //     FilterList(li5.details[i].itemCode,li5.details[i].itemName,li5.details[i].price,li5.details[i].uOM,li5.details[i].qty));

          }
        });
        // setState(() {
        //   if(li5.details.length-cnt.length==0);
        //   else {
        //     print("else");
        //     print("length ${li5.details.length - cnt.length}");
        //     for (int i = 0; i <= (li5.details.length - cnt.length); i++) {
        //       cnt.add(0);
        //       controllers.add(new TextEditingController(text: "0"));
        //     }
        //     print(cnt);
        //   }
        //   // total=0;
        //   // cnt.clear();
        //   // for (int i = 0; i < li5.details.length; i++) {
        //   //   cnt.add();
        //   //   controllers.add(new TextEditingController());
        //   //   controllers[i].text = "0";
        //   // }
        // });


      }
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
  TextEditingController searchController = new TextEditingController();
  TextEditingController cnt1controller = new TextEditingController();
  TextEditingController cnt2controller = new TextEditingController();
  TextEditingController cnt3controller = new TextEditingController();
  static List<TextEditingController> controllers =new List();
  List<double> itemtotal =new List();
  // var dropdownValue = "Select";
  // var dropdownValue1 = "Select";
  // var stringlist = ["Select", "7 AM", "8 AM", "9 AM"];


  @override
  void initState() {
    print(widget.edit);
    print(widget.id);

    itemRequest(0);

    // cnt1controller.text="0";
    // cnt2controller.text="0";
    // cnt3controller.text="0";

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
          Padding(
            padding: const EdgeInsets.only(left:16,top:8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Select Category"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24.0, right: 24.0,top:10),
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 6, bottom: 6),
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
              height: 80,
              child: Row(children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 24.0, right: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                    ),
                    child: TextField(
                      autofocus: false,
                      onChanged: (value) {
                        setState(() {
                          li2.clear();
                        });
                        for (int i = 0; i < li5.details.length; i++)
                          if (li5.details[i].itemName
                              .toLowerCase()
                              .contains(searchController.text
                              .toLowerCase()) ||
                              li5.details[i].itemCode
                                  .toLowerCase()
                                  .contains(searchController.text
                                  .toLowerCase())) {
                            setState(() {
                              // checkvalue.add(CheckList(false,""));
                              if(dropdownValue1=="All")
                                li2.add(
                                    FilterList(li5.details[i].itemCode,li5.details[i].itemName,li5.details[i].price,li5.details[i].uOM,li5.details[i].qty));
                              else
                              if(li5.details[i].itemCode==dropdownValue1)
                                li2.add(
                                    FilterList(li5.details[i].itemCode,li5.details[i].itemName,li5.details[i].price,li5.details[i].uOM,li5.details[i].qty));


                            });
                          }
                      },
                      controller: searchController,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.teal,
                        ),
                        hintText: 'Search item here.....',
                        hintStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 16.0,
                        ),
                        prefix: Text("    "),
                        suffix: Text("    "),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
          // Container(
          //     height: 80,
          //     child: Row(children: [
          //       Flexible(
          //         flex: 1,
          //         child: Container(
          //           margin: const EdgeInsets.only(
          //               left: 24.0, right: 24),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(25.0),
          //             color: Colors.white,
          //           ),
          //           child: TextField(
          //             onChanged: (value) {
          //               setState(() {
          //                 li2.clear();
          //               });
          //               for (int i = 0; i < li5.details.length; i++)
          //                 if (li5.details[i].itemName
          //                     .toLowerCase()
          //                     .contains(searchController.text
          //                     .toLowerCase()) ||
          //                     li5.details[i].itemCode
          //                         .toLowerCase()
          //                         .contains(searchController.text
          //                         .toLowerCase())) {
          //                   setState(() {
          //                     li2.add(
          //                         FilterList(li5.details[i].itemCode,li5.details[i].itemName,li5.details[i].price,li5.details[i].uOM,li5.details[i].qty));
          //                   });
          //                 }
          //             },
          //             controller: searchController,
          //             style: TextStyle(color: Colors.black54),
          //             decoration: InputDecoration(
          //               suffixIcon: Icon(
          //                 Icons.search,
          //                 color: Colors.teal,
          //               ),
          //               hintText: 'Search item here.....',
          //               hintStyle: TextStyle(
          //                 color: Colors.teal,
          //                 fontSize: 16.0,
          //               ),
          //               prefix: Text("    "),
          //               suffix: Text("    "),
          //               border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(25.0),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ])),

          for(int i=0;i<li5.details.length;i++)

            if(dropdownValue1=="All")
              if (li5.details[i].itemName
                  .toLowerCase()
                  .contains(searchController.text
                  .toLowerCase()) ||
                  li5.details[i].itemCode
                      .toLowerCase()
                      .contains(searchController.text
                      .toLowerCase()))
              // if(ItemSearchState.selecteditems.any((element) => element.contains(li2[i].itemName)))
                Card(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Expanded(flex: 2, child: Image.asset("logo.png")),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Text(li5.details[i].itemName),
                                Text(
                                  li5.details[i].price.toString(),
                                  style: TextStyle(
                                      color: Color.fromRGBO(160, 27, 37, 1)),
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
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(icon: Icon(
                                            Icons.remove, color: Colors.red,),
                                            onPressed: () {
                                              setState(() {
                                                print(cnt[i]);
                                                if (cnt[i] != 0)
                                                  cnt[i]--;
                                                itemtotal[i] =
                                                    (li5.details[i].price) *
                                                        cnt[i];
                                                controllers[i].text =
                                                    cnt[i].toString();
                                                print(cnt[i]);
                                                total = 0;
                                                for (int j = 0; j <
                                                    li5.details.length; j++)
                                                  total = total + (cnt[j] *
                                                      li5.details[j].price);
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
                                                  borderRadius: BorderRadius
                                                      .circular(5.0),
                                                ),
                                              ),
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType
                                                  .number,
                                              onChanged: (value) {
                                                setState(() {
                                                  cnt[i] = int.parse(
                                                      controllers[i].text);
                                                  itemtotal[i] =
                                                      (li5.details[i].price) *
                                                          cnt[i];

                                                  total = 0;
                                                  for (int j = 0; j <
                                                      li5.details.length; j++)
                                                    total = total + (cnt[j] *
                                                        li5.details[j].price);
                                                });
                                              },
                                              enabled: true,
                                              controller: controllers[i],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(icon: Icon(
                                            Icons.add, color: Colors.teal,),
                                            onPressed: () {
                                              setState(() {
                                                print(cnt[i]);
                                                cnt[i]++;
                                                controllers[i].text =
                                                    cnt[i].toString();
                                                print(cnt[i]);
                                                itemtotal[i] =
                                                    (li5.details[i].price) *
                                                        cnt[i];
                                                total = 0;
                                                for (int j = 0; j <
                                                    li5.details.length; j++)
                                                  total = total + (cnt[j] *
                                                      li5.details[j].price);
                                              });
                                            },),
                                        ),

                                      ],
                                    ),
                                  )
                                ]
                            ),
                          ),
                          Expanded(flex: 3, child: Text("Rs. ${itemtotal[i]}",
                            textAlign: TextAlign.center,)),

                        ],
                      )),
                ) else Container()
                else
    if ((li5.details[i].itemName
        .toLowerCase()
        .contains(searchController.text
        .toLowerCase()) ||
        li5.details[i].itemCode
            .toLowerCase()
            .contains(searchController.text
            .toLowerCase()))&&li5.details[i].itemCode==dropdownValue1)
    // if(ItemSearchState.selecteditems.any((element) => element.contains(li2[i].itemName)))
      Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Expanded(flex: 2, child: Image.asset("logo.png")),
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
                                    itemtotal[i]=(li5.details[i].price)*cnt[i];
                                    controllers[i].text=cnt[i].toString();
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
                                    keyboardType: TextInputType.number,
                                    onChanged: (value)
                                    {
                                      setState(() {
                                        cnt[i]=int.parse(controllers[i].text);
                                        itemtotal[i]=(li5.details[i].price)*cnt[i];

                                        total=0;
                                        for(int j=0;j<li5.details.length;j++)
                                          total=total+(cnt[j]*li5.details[j].price);
                                      });


                                    },
                                    enabled:true,
                                    controller: controllers[i],
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
                                    controllers[i].text=cnt[i].toString();
                                    print(cnt[i]);
                                    itemtotal[i]=(li5.details[i].price)*cnt[i];
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
                Expanded(flex: 3, child: Text("Rs. ${itemtotal[i]}",textAlign: TextAlign.center,)),

              ],
            )),
      )
          ,

          SizedBox(height: height/4,),
      


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
          if(total!=0) {
            if(widget.edit==0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  Order2(id: widget.id, edit: widget.edit,)));
            }
            else{
              Order2State.catcheck=false;
              Order2State.vehcheck=false;
              Order2State.vescheck=false;
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  OrderSummary( edit: widget.edit,payment:1,id: widget.id,)));
            }
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>
              //     Order2(id: widget.id, edit: widget.edit,)));
          }
          else
            Fluttertoast.showToast(
                msg: "Please choose Item",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
        },
        icon: Icon(Icons.navigate_next,color: String_Values.primarycolor,),backgroundColor:Colors.white ,
        label: Text("Next",style: TextStyle(color:String_Values.primarycolor),),
      ),
    );
  }
}
class FilterList {

  String itemCode;
  String itemName;
  double price;
  String uOM;
  double qty;

  FilterList(

        this.itemCode,
        this.itemName,
        this.price,

        this.uOM,
        this.qty,);

}
