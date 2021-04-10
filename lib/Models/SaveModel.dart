class SaveModel {
  int sTATUSID;
  String sTATUSMSG;
  int oRDERNO;

  SaveModel({this.sTATUSID, this.sTATUSMSG, this.oRDERNO});

  SaveModel.fromJson(Map<String, dynamic> json) {
    sTATUSID = json['STATUSID'];
    sTATUSMSG = json['STATUSMSG'];
    oRDERNO = json['ORDERNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUSID'] = this.sTATUSID;
    data['STATUSMSG'] = this.sTATUSMSG;
    data['ORDERNO'] = this.oRDERNO;
    return data;
  }
}