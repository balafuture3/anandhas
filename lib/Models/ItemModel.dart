class ItemModelList {
  final List<ItemModel> details;

  ItemModelList({
    this.details,
  });

  factory ItemModelList.fromJson(
      List<dynamic> parsedJson) {
    List<ItemModel> details =
    new List<ItemModel>();
    details = parsedJson
        .map((i) => ItemModel.fromJson(i))
        .toList();

    return new ItemModelList(details: details);
  }
}


class ItemModel {
  int docNo;
  String docDate;
  int categroryID;
  String itemCode;
  String itemName;
  double price;
  String active;
  String uOM;
  double qty;
  int createdBy;
  String createdDate;

  ItemModel(
      {this.docNo,
        this.docDate,
        this.categroryID,
        this.itemCode,
        this.itemName,
        this.price,
        this.active,
        this.uOM,
        this.qty,
        this.createdBy,
        this.createdDate});

  ItemModel.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    docDate = json['DocDate'];
    categroryID = json['CategroryID'];
    itemCode = json['ItemCode'];
    itemName = json['ItemName'];
    price = json['Price'];
    active = json['Active'];
    uOM = json['UOM'];
    qty = json['Qty'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['DocDate'] = this.docDate;
    data['CategroryID'] = this.categroryID;
    data['ItemCode'] = this.itemCode;
    data['ItemName'] = this.itemName;
    data['Price'] = this.price;
    data['Active'] = this.active;
    data['UOM'] = this.uOM;
    data['Qty'] = this.qty;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}