import 'package:anandhasapp/HallBooking.dart';
import 'package:anandhasapp/Screens/ExistingDeliveryOrder.dart';
import 'package:anandhasapp/Screens/NewOrder.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OrderList.dart';
import 'OrderListGST.dart';
import 'Report.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: height/6,
              width: width/2,
child: Image.asset("logo.png"),
decoration: BoxDecoration(

  // borderRadius: BorderRadius.only(bottomRight: Radius.circular(width))
),
              

            ),

            Container(
              decoration: 
              BoxDecoration(
                color: String_Values.primarycolor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(width/6),topRight: Radius.circular(width/6))
              ),
              child: Column(
                children: [
                  SizedBox(height: height/20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dashboard",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18),),

                    ],
                  ),
                  SizedBox(height: height/20,),
                  CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new NetworkImage(
                              item,
                            ),
                            fit: BoxFit.fill,
                          ),
                          border: Border.all(
                              color: Colors.white, width: 2),
                          borderRadius:
                          BorderRadius.all(Radius.circular(width / 20)),
                        ),

                      ))
                          .toList(),
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        initialPage: 0,
                        height: 180,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: true,

                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),
                  SizedBox(height: height/50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: _current == index ? 10 : 8.0,
                        height: _current == index ? 10 : 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ?Colors.white
                              // ? Color.fromRGBO(51, 155, 111, 1)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),

                  Container(
                    padding: EdgeInsets.all(24),
                    height: height/3,
                    child: GridView.count(
// physics: PageScrollPhysics,
                      crossAxisSpacing: width / 40,
                      mainAxisSpacing: height / 60,
                      crossAxisCount: 2,
                      physics: const PageScrollPhysics(),
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            showDialog<void>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white.withOpacity(0),
                                    title: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(

                                            child: Image.asset(
                                              "logo.png",
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 30,
                                          ),
                                          Text(
                                            "Please Choose",
                                            style: TextStyle(
                                                color: Colors.amber, fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: height / 30,
                                          ),
                                          SizedBox(height: height/50,),
                                          Container(
                                              margin: EdgeInsets.only(left:16,right: 16),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(50))),
                                              child: FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>NewOrder()));
                                                },
                                                child: Text(
                                                  "New Order",
                                                  style: TextStyle(
                                                      color: String_Values.primarycolor),
                                                ),
                                              )),
                                          SizedBox(
                                            height: height / 50,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left:16,right: 16),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(50))),
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderList(gst:false)));
                                                      // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Dashboard()));

                                                    },
                                                    child: Text(
                                                      "Existing Order",
                                                      style: TextStyle(

                                                          color: String_Values.primarycolor),
                                                    ),
                                                  )),
                                              SizedBox(height: height/50,),
                                              Container(
                                                  margin: EdgeInsets.only(left:16,right: 16),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(50))),
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderListGST(gst: true,)));
                                                    },
                                                    child: Text(
                                                      "GST Invoice",
                                                      style: TextStyle(
                                                          color: String_Values.primarycolor),
                                                    ),
                                                  )),
                                              SizedBox(height: height/50,),
                                              Container(
                                                  margin: EdgeInsets.only(left:16,right: 16),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(50))),
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Reports()));
                                                    },
                                                    child: Text(
                                                      "Sales Report",
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
                                  );
                                });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(width),),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Icon(Icons.fastfood,color: String_Values.primarycolor,size: height/12,),
                                Text(
                                  "Party Order",
                                  style: TextStyle( color: String_Values.primarycolor,fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {

                            //
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => HallBooking()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width),),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Icon(Icons.apartment_outlined,color: String_Values.primarycolor,size: height/12,),
                                Text(
                                  "Hall Booking",
                                  style: TextStyle( color: String_Values.primarycolor,fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height/20,),
                ],
              ),
            ),
          ],
        )),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()), (route) => false);

  },
        backgroundColor: Colors.white,

      child: Icon(Icons.logout,color: String_Values.primarycolor,),),
      // appBar: AppBar(
      //
      //     title: Center(
      //         child: Text(
      //   "DashBoard",
      //   style: TextStyle(fontWeight: FontWeight.w700),
      // )),
      // actions: [IconButton(icon: Icon(Icons.logout,color: Colors.white,), onPressed:(){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()), (route) => false);})],),

    );
  }
}
