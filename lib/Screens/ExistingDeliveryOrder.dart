import 'package:anandhasapp/HallBooking.dart';
import 'package:anandhasapp/Screens/NewOrder_SelectDate.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OrderList.dart';

class ExistingDeliveryOrder extends StatefulWidget {
  @override
  _ExistingDeliveryOrderState createState() => _ExistingDeliveryOrderState();
}

class _ExistingDeliveryOrderState extends State<ExistingDeliveryOrder>
{
  int _current = 0;

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
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

                SizedBox(
                  height: height / 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  height: height - height / 9,
                  width: width,
                  child: GridView.count(
                    crossAxisSpacing: width / 40,
                    mainAxisSpacing: height / 60,
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrder()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),),
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "logo.png",
                                  height: height / 8,
                                  width: width / 2.5,
                                ),
                              ),

                              Container(
                                width: double.infinity,
                                color: String_Values.primarycolor,
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "New Order",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: height / 50,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderList()));
                          // showDialog<void>(
                          //     context: context,
                          //     barrierDismissible: true,
                          //     builder: (BuildContext context) {
                          //       return AlertDialog(
                          //         backgroundColor: Colors.white.withOpacity(0),
                          //         title: Container(
                          //           decoration: BoxDecoration(
                          //             color: String_Values.primarycolor,
                          //             borderRadius: BorderRadius.only(
                          //                 bottomLeft: Radius.circular(50),
                          //                 bottomRight: Radius.circular(50),
                          //                 topLeft: Radius.circular(50),
                          //                 topRight: Radius.circular(50)),
                          //           ),
                          //           child: Column(
                          //             mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //             children: [
                          //               Container(
                          //                 padding: const EdgeInsets.all(16.0),
                          //                 child: Image.asset(
                          //                   "logo.png",
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: height / 30,
                          //               ),
                          //               Text(
                          //                 "Order Confirmation",
                          //                 style: TextStyle(
                          //                     color: Colors.amber, fontSize: 16),
                          //               ),
                          //               SizedBox(
                          //                 height: height / 30,
                          //               ),
                          //               Center(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.all(8.0),
                          //                   child: Text(
                          //                     "Are you sure want to confirm your order",
                          //                     textAlign: TextAlign.center,
                          //                     style: TextStyle(
                          //                       color: Colors.white,
                          //                       fontSize: 16,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: height / 30,
                          //               ),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                 MainAxisAlignment.spaceEvenly,
                          //                 children: [
                          //                   Container(
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           color: Colors.white,
                          //                           borderRadius: BorderRadius.all(
                          //                               Radius.circular(50))),
                          //                       child: FlatButton(
                          //                         onPressed: () {
                          //                           Navigator.pop(context);
                          //                           Navigator.pushAndRemoveUntil(
                          //                             context,
                          //                             MaterialPageRoute(
                          //                                 builder: (context) => ExistingDeliveryOrder()),
                          //                                 (Route<dynamic> route) => false,
                          //                           );
                          //                           // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Dashboard()));
                          //
                          //                         },
                          //                         child: Text(
                          //                           "Confirm",
                          //                           style: TextStyle(
                          //                               color: Color.fromRGBO(
                          //                                   160, 27, 37, 1)),
                          //                         ),
                          //                       )),
                          //                   Container(
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           color: Colors.grey,
                          //                           borderRadius: BorderRadius.all(
                          //                               Radius.circular(50))),
                          //                       child: FlatButton(
                          //                         onPressed: () {
                          //                           Navigator.pop(context);
                          //                         },
                          //                         child: Text(
                          //                           "Cancel",
                          //                           style: TextStyle(
                          //                               color: Colors.white),
                          //                         ),
                          //                       )),
                          //                 ],
                          //               ),
                          //               SizedBox(
                          //                 height: height / 30,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     });
                          //
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HallBooking()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),),
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "logo.png",
                                  height: height / 8,
                                  width: width / 2.5,
                                ),
                              ),

                              Container(
                                width: double.infinity,
                                color: String_Values.primarycolor,
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Amount Received",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: height / 50,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      appBar: AppBar(
        title: Center(
            child: Text(
              "Existing Delivery Order",
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
        actions: [IconButton(icon: Icon(Icons.logout,color: Colors.white,), onPressed:(){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()), (route) => false);})],),
    );
  }
}
