class BranchModelList {
  final List<BranchModel> details;

  BranchModelList({
    this.details,
  });

  factory BranchModelList.fromJson(
      List<dynamic> parsedJson) {
    List<BranchModel> details =
    new List<BranchModel>();
    details = parsedJson
        .map((i) => BranchModel.fromJson(i))
        .toList();

    return new BranchModelList(details: details);
  }
}



class BranchModel {
  int docNo;
  String docDate;
  int branchID;
  String branchName;
  String active;

  BranchModel(
      {this.docNo, this.docDate, this.branchID, this.branchName, this.active});

  BranchModel.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    docDate = json['DocDate'];
    branchID = json['BranchID'];
    branchName = json['BranchName'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['DocDate'] = this.docDate;
    data['BranchID'] = this.branchID;
    data['BranchName'] = this.branchName;
    data['Active'] = this.active;
    return data;
  }
}