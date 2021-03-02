class LoginModel {
  int empID;
  String name;
  String branchID;
  String branchName;

  LoginModel({this.empID, this.name, this.branchID, this.branchName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    empID = json['EmpID'];
    name = json['Name'];
    branchID = json['BranchID'];
    branchName = json['BranchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpID'] = this.empID;
    data['Name'] = this.name;
    data['BranchID'] = this.branchID;
    data['BranchName'] = this.branchName;
    return data;
  }
}