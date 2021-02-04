import 'package:anandhasapp/NewOrder.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _current=0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final List<String> imgList = [
      "https://www.shreeanandhaas.com/images/special-menu/2-in-1-Idiyappam.jpg","https://www.shreeanandhaas.com/images/special-menu/Garlic-Kesari.jpg","https://www.shreeanandhaas.com/images/special-menu/Wheat-Rava-Idly.jpg",
        "https://www.shreeanandhaas.com/images/special-menu/Podi-Idly.jpg","https://www.shreeanandhaas.com/images/special-menu/Diet-Breakfast.jpg", ];
    return Scaffold(

      body: SingleChildScrollView(
child:

          Column(
            children: [
              CarouselSlider(
                  items: imgList.map((item) => Container(
                    child: Center(
                        child: Image.network(item, fit: BoxFit.cover)
                    ),
                  )).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    initialPage: 0,
                    height: height/3,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                     width: _current == index
                         ? 10:8.0,
                    height:  _current == index
                        ? 10:8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(160,27,37, 1)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: height/20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               InkWell(
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context) => NewOrder()));
                 },
                 child: Card(
                   elevation: 5,
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Image.asset("logo.jpg",height: height/8,width: width/2.5,),
                       ),

                       Text("New Order"),
                       SizedBox(height: height/20,)
                     ],
                   ),
                 ),
               ),
               Card(
                 elevation: 5,
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Image.asset("logo.jpg",height:height/8,width: width/2.5,),
                     ),
                     Text("Hall Booking"),
                     SizedBox(height: height/20,)
                   ],
                 ),
               )
             ],
              ),
            ],
          )

      ),
      appBar: AppBar(
          title:Center(child: Text("DashBoard",style: TextStyle(fontWeight: FontWeight.w700),))
      ),
    );
  }
}
