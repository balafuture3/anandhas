import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:flutter/material.dart';

import '../String_Values.dart';

class Widgetsfield
{
  Widget myTextField(icon,controller,label,void action(),suffix)
  {
    return Container(
      margin: EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        obscureText: controller==LoginPageState.PasswordController?LoginPageState.toggle==Icons.visibility?true:false:false,
        decoration: InputDecoration(
            enabled: true,
            prefixIcon: icon,
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            suffixIcon: suffix!=null?suffix:null
        ),
        onSubmitted: (value){
          action();
        },
      ),
    );
  }
  Widget myButton(label, void action(),width)
  {
    return Container(
      width: width,
      child: RaisedButton(onPressed: action,

      child: Text(label,style: TextStyle(color: Colors.white),),
      color: String_Values.primarycolor,
      padding: EdgeInsets.all(16),

      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }
  Widget myImageAsset(asset,void action(),context,height,width)
  {
    return Image.asset(asset,height: height,width: width,color: Colors.white,);
  }
  Widget myDropDown(dropdownValue,stringlist)
  {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
      padding: const EdgeInsets.only(left:24,right: 24,top: 6,bottom: 6),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          border: new Border.all(color: Colors.black38)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: dropdownValue,
          onChanged: (String newValue) {

  dropdownValue = newValue;

              // for(int i=0;i<li4.details.length;i++)
              //   if(li4.details[i].delivery==newValue)
              //   {
              //     MtrController.text=li4.details[i].material;
              //     MtrDesController.text=li4.details[i].materialdescription;
              //     ReqSegController.text=li4.details[i].requirementsegment;
              //   }


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
    );
  }

}

