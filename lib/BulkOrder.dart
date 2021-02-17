import 'package:anandhasapp/Order2.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BulkOrder extends StatefulWidget {
  BulkOrder({Key key,this.food});
  String food;
  @override
  _BulkOrderState createState() => _BulkOrderState();
}

class _BulkOrderState extends State<BulkOrder> {
  int _current = 0;

  TextEditingController datefromcontroller = new TextEditingController();
  TextEditingController cntcontroller = new TextEditingController();
  TextEditingController cnt1controller = new TextEditingController();
  TextEditingController cnt2controller = new TextEditingController();
  TextEditingController cnt3controller = new TextEditingController();

  var dropdownValue = "Select";
  var dropdownValue1 = "Select";
  var stringlist = ["Select", "7 AM", "8 AM", "9 AM"];

  var cnt=0,cnt1=0,cnt2=0,cnt3=0;
  @override
  void initState() {
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
      body: SingleChildScrollView(

        child: widget.food=="Breakfast"?Column(children: [

          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Pongal"),
                          Text(
                            "Rs.30",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt--;
                                        cntcontroller.text=cnt.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt=int.parse(cntcontroller.text);
                                        },
                                        enabled:true,
                                        controller: cntcontroller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt++;
                                        cntcontroller.text=cnt.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Chappathi"),
                          Text(
                            "Rs.20",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt1--;
                                        cnt1controller.text=cnt1.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt1=int.parse(cnt1controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt1controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt1++;
                                        cnt1controller.text=cnt1.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Dosa"),
                          Text(
                            "Rs.40",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt2--;
                                        cnt2controller.text=cnt2.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt2=int.parse(cnt2controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt2controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt2++;
                                        cnt2controller.text=cnt2.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Veg Biriyani"),
                          Text(
                            "Rs.50",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt3--;
                                        cnt3controller.text=cnt3.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt3=int.parse(cnt3controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt3controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt3++;
                                        cnt3controller.text=cnt3.toString();

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
          Container(
            width: width,
            color: Color.fromRGBO(160, 27, 37, 1),
            child: Card(
              color: Color.fromRGBO(160, 27, 37, 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Item Total : ${((cnt1*20)+(cnt2*40)+(cnt3*50)+(cnt*30))}",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),


        ]):widget.food=="Dinner"?Column(children: [

          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Parrota"),
                          Text(
                            "Rs.30",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt--;
                                        cntcontroller.text=cnt.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt=int.parse(cntcontroller.text);
                                        },
                                        enabled:true,
                                        controller: cntcontroller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt++;
                                        cntcontroller.text=cnt.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Chappathi"),
                          Text(
                            "Rs.20",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt1--;
                                        cnt1controller.text=cnt1.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt1=int.parse(cnt1controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt1controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt1++;
                                        cnt1controller.text=cnt1.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Naan"),
                          Text(
                            "Rs.40",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt2--;
                                        cnt2controller.text=cnt2.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt2=int.parse(cnt2controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt2controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt2++;
                                        cnt2controller.text=cnt2.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Pongal"),
                          Text(
                            "Rs.50",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt3--;
                                        cnt3controller.text=cnt3.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt3=int.parse(cnt3controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt3controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt3++;
                                        cnt3controller.text=cnt3.toString();

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
          Container(
            width: width,
            color: Color.fromRGBO(160, 27, 37, 1),
            child: Card(
              color: Color.fromRGBO(160, 27, 37, 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Item Total : ${((cnt1*20)+(cnt2*40)+(cnt3*50)+(cnt*30))}",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),



        ]):widget.food=="Lunch"?Column(children: [

          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Lemon Rice"),
                          Text(
                            "Rs.30",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt--;
                                        cntcontroller.text=cnt.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt=int.parse(cntcontroller.text);
                                        },
                                        enabled:true,
                                        controller: cntcontroller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt++;
                                        cntcontroller.text=cnt.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("White Rice"),
                          Text(
                            "Rs.20",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt1--;
                                        cnt1controller.text=cnt1.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt1=int.parse(cnt1controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt1controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt1++;
                                        cnt1controller.text=cnt1.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Veg Rice"),
                          Text(
                            "Rs.40",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt2--;
                                        cnt2controller.text=cnt2.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt2=int.parse(cnt2controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt2controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt2++;
                                        cnt2controller.text=cnt2.toString();

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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 3, child: Image.asset("logo.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text("Curd Rice"),
                          Text(
                            "Rs.50",
                            style: TextStyle(color: Color.fromRGBO(160, 27, 37, 1)),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.remove,color: Colors.red,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt3--;
                                        cnt3controller.text=cnt3.toString();
                                      });
                                    },),
                                  ),
                                  Flexible(
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
                                          cnt3=int.parse(cnt3controller.text);
                                        },
                                        enabled:true,
                                        controller: cnt3controller,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton( icon: Icon(Icons.add,color: Colors.teal,),onPressed: ()
                                    {
                                      setState(() {
                                        cnt3++;
                                        cnt3controller.text=cnt3.toString();

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
          Container(
            width: width,
            color: Color.fromRGBO(160, 27, 37, 1),
            child: Card(
              color: Color.fromRGBO(160, 27, 37, 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Item Total : ${((cnt1*20)+(cnt2*40)+(cnt3*50)+(cnt*30))}",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),


        ]):Container(),
      ),
      appBar: AppBar(
          title: Text(
        "Bulk Order",
        style: TextStyle(fontWeight: FontWeight.w700),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => Order2()));
        },
        icon: Icon(Icons.navigate_next),backgroundColor:Color.fromRGBO(
          160, 27, 37, 1) ,
        label: Text("Next"),
      ),
    );
  }
}
