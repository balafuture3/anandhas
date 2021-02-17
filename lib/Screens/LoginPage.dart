import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/Widgets/AllWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // LoginResponse li;
  bool loading = false;

  static String rolename;
  static String roleid;
  static String token;

  var dropdownValue1= "Select Branch";

  var stringlist =["Select Branch","Coimbatore","Chennai"];
  // Future<http.Response> postRequest() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   var url;
  //
  //   url = String_values.base_url + 'login';
  //   Map data = {
  //     "email": EmailController.text,
  //     "password": PasswordController.text
  //   };
  //   print("data: ${data}");
  //   print(url);
  //   //encode Map to JSON
  //   var body = json.encode(data);
  //   print("response: ${body}");
  //   var response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         //   'Authorization':
  //         //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiIxIiwidXR5cGUiOiJFTVAifQ.AhfTPvo5C_rCMIexbUd1u6SEoHkQCjt3I7DVDLwrzUs'
  //         //
  //       },
  //       body: body);
  //   if (response.statusCode == 200) {
  //     li = LoginResponse.fromJson(json.decode(response.body));
  //     setState(() {
  //       loading = false;
  //     });
  //
  //     if (li.status)
  //     {
  //       setRegistered(rolename, roleid, token);
  //       rolename=li.authUserRolename;
  //       roleid = li.authUserRole;
  //       token = li.tokenType;
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientList()));
  //
  //
  //     } else
  //       showDialog<void>(
  //           context: context,
  //           barrierDismissible: false, // user must tap button!
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               content:
  //                    Text(li.alert),
  //               actions: <Widget>[
  //                 TextButton(
  //                   child: Text('OK'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             );
  //           });
  //
  //
  //   } else {
  //     setState(() {
  //       loading = false;
  //     });
  //     print("Retry");
  //   }
  //   print("response: ${response.statusCode}");
  //   print("response: ${response.body}");
  //   return response;
  // }
  Future<bool> setRegistered(rolename, roleid, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rolename', rolename);
    await prefs.setString('token', token);
    await prefs.setString('roleid', roleid);
    await prefs.setBool('seen', true);
    return true;
  }

  TextEditingController EmailController = new TextEditingController();
  static TextEditingController PasswordController = new TextEditingController();

  static IconData toggle = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.teal,
                          Colors.white70,
                          Colors.white70,
                          Colors.teal,
                        ]),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(width / 3),
                        topLeft: Radius.circular(width / 3))),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: height / 20,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: width / 4, right: width / 4),
                              child: Widgetsfield().myImageAsset("logo.png",
                                  () {}, context, height / 4, width/2)),
                          SizedBox(
                            height: height / 20,
                          ),
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
                              // for(int i=0;i<li4.details.length;i++)
                              //   if(li4.details[i].delivery==newValue)
                              //   {
                              //     MtrController.text=li4.details[i].material;
                              //     MtrDesController.text=li4.details[i].materialdescription;
                              //     ReqSegController.text=li4.details[i].requirementsegment;
                              //   }

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
                    SizedBox(
                      height: height / 50,
                    ),
                    Widgetsfield().myTextField(Icon(Icons.email),
                        EmailController, "Email", () {}, null),
                    Widgetsfield().myTextField(
                        Icon(Icons.lock),
                        PasswordController,
                        "Password",
                        () {},
                        IconButton(
                          icon: Icon(toggle),
                          onPressed: () {
                            togglestate();
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            padding: EdgeInsets.all(24),
                            child: InkWell(
                                onTap: () {}, child: Text("Forgot Password"))),
                      ],
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Widgetsfield().myButton("Submit", () {
                      // postRequest();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                    }, width / 2)
                  ],
                ),
              ),
            ),
    );
  }

  void togglestate() {
    setState(() {
      if (toggle == Icons.visibility)
        toggle = Icons.visibility_off;
      else
        toggle = Icons.visibility;
    });
  }

  void action() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
