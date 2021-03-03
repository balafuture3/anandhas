class SaveResponse {
  int sTATUSID;
  String sTATUSMSG;

  SaveResponse({this.sTATUSID, this.sTATUSMSG});

  SaveResponse.fromJson(Map<String, dynamic> json) {
    sTATUSID = json['STATUSID'];
    sTATUSMSG = json['STATUSMSG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUSID'] = this.sTATUSID;
    data['STATUSMSG'] = this.sTATUSMSG;
    return data;
  }
}