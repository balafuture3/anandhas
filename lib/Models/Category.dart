class CategoryModelList {
  final List<CategoryModel> details;

  CategoryModelList({
    this.details,
  });

  factory CategoryModelList.fromJson(
      List<dynamic> parsedJson) {
    List<CategoryModel> details =
    new List<CategoryModel>();
    details = parsedJson
        .map((i) => CategoryModel.fromJson(i))
        .toList();

    return new CategoryModelList(details: details);
  }
}





class CategoryModel {
  int docNo;
  String docDate;
  int categoryID;
  String categoryName;
  String active;
  int createdBy;

  CategoryModel(
      {this.docNo,
        this.docDate,
        this.categoryID,
        this.categoryName,
        this.active,
        this.createdBy});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    docDate = json['DocDate'];
    categoryID = json['CategoryID'];
    categoryName = json['CategoryName'];
    active = json['Active'];
    createdBy = json['CreatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['DocDate'] = this.docDate;
    data['CategoryID'] = this.categoryID;
    data['CategoryName'] = this.categoryName;
    data['Active'] = this.active;
    data['CreatedBy'] = this.createdBy;
    return data;
  }
}