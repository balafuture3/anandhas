class ItemModelList1 {
  final List<ItemModel1> details;

  ItemModelList1({
    this.details,
  });

  factory ItemModelList1.fromJson(
      List<dynamic> parsedJson) {
    List<ItemModel1> details =
    new List<ItemModel1>();
    details = parsedJson
        .map((i) => ItemModel1.fromJson(i))
        .toList();

    return new ItemModelList1(details: details);
  }
}


class ItemModel1{
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
  String orderFlag;
  int orderFlagNo;
  String bookingDate;
  ItemModel1(
      {
        this.bookingDate,
        this.docNo,
        this.docDate,
        this.categroryID,
        this.itemCode,
        this.itemName,
        this.price,
        this.active,
        this.uOM,
        this.qty,
        this.createdBy,
        this.createdDate,this.orderFlag,this.orderFlagNo});

  ItemModel1.fromJson(Map<String, dynamic> json) {
    bookingDate=json['BookingDate'];
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
    orderFlag = json['OrderFlag'];
    orderFlagNo = json['OrderFlagNo'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookingDate'] = this.bookingDate;
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
    data['OrderFlag'] = this.orderFlag;
    data['OrderFlagNo'] = this.orderFlagNo;
    return data;
  }
}