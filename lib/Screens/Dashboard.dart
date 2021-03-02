import 'package:anandhasapp/HallBooking.dart';
import 'package:anandhasapp/Screens/ExistingDeliveryOrder.dart';
import 'package:anandhasapp/Screens/NewOrder.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:anandhasapp/String_Values.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: height / 30,
          ),
          CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new NetworkImage(
                              item,
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                              color: String_Values.primarycolor, width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(width / 8)),
                        ),
                        margin: EdgeInsets.only(top: 16),
                      ))
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                initialPage: 0,
                height: 220,
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
                      ? Color.fromRGBO(51, 155, 111, 1)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
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
                    showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white.withOpacity(0),
                            title: Container(
                              decoration: BoxDecoration(
                                color: String_Values.primarycolor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(24.0),
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

                                  SizedBox(
                                    height: height / 30,
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
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>ExistingDeliveryOrder()));
                                              // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Dashboard()));

                                            },
                                            child: Text(

                                              "Existing Delivery Order",
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
                                            },
                                            child: Text(
                                              "GST Invoice",
                                              style: TextStyle(
                                                  color: String_Values.primarycolor),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
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
                            "Party Order",
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
                    showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white.withOpacity(0),
                            title: Container(
                              decoration: BoxDecoration(
                                color: String_Values.primarycolor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.asset(
                                      "logo.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Text(
                                    "Order Confirmation",
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Are you sure want to confirm your order",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Dashboard()),
                                                    (Route<dynamic> route) => false,
                                              );
                                              // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Dashboard()));

                                            },
                                            child: Text(
                                              "Confirm",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 27, 37, 1)),
                                            ),
                                          )),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
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
                            "Hall Booking",
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
      )),
      appBar: AppBar(
          title: Center(
              child: Text(
        "DashBoard",
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
      actions: [IconButton(icon: Icon(Icons.logout,color: Colors.white,), onPressed:(){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()), (route) => false);})],),
    );
  }
}
