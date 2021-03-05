class OrderItemDetailModelList {
  final List<OrderItemDetailModel> details;

  OrderItemDetailModelList({
    this.details,
  });

  factory OrderItemDetailModelList.fromJson(
      List<dynamic> parsedJson) {
    List<OrderItemDetailModel> details =
    new List<OrderItemDetailModel>();
    details = parsedJson
        .map((i) => OrderItemDetailModel.fromJson(i))
        .toList();

    return new OrderItemDetailModelList(details: details);
  }
}

class OrderItemDetailModel {
  int rowID;
  int docNo;
  int lineID;
  String itemCode;
  String itemName;
  double qty;
  double price;
  String uOM;
  String status;
  int createdBy;
  String createdDate;
  int modifiedBy;
  String modifiedDate;

  OrderItemDetailModel(
      {this.rowID,
        this.docNo,
        this.lineID,
        this.itemCode,
        this.itemName,
        this.qty,
        this.price,
        this.uOM,
        this.status,
        this.createdBy,
        this.createdDate,
        this.modifiedBy,
        this.modifiedDate});

  OrderItemDetailModel.fromJson(Map<String, dynamic> json) {
    rowID = json['RowID'];
    docNo = json['DocNo'];
    lineID = json['LineID'];
    itemCode = json['ItemCode'];
    itemName = json['ItemName'];
    qty = json['Qty'];
    price = json['Price'];
    uOM = json['UOM'];
    status = json['Status'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedDate = json['ModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowID'] = this.rowID;
    data['DocNo'] = this.docNo;
    data['LineID'] = this.lineID;
    data['ItemCode'] = this.itemCode;
    data['ItemName'] = this.itemName;
    data['Qty'] = this.qty;
    data['Price'] = this.price;
    data['UOM'] = this.uOM;
    data['Status'] = this.status;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedDate'] = this.modifiedDate;
    return data;
  }
}