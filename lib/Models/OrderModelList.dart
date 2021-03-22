class OrderListingslList {
  final List<OrderListModel> details;

  OrderListingslList({
    this.details,
  });

  factory OrderListingslList.fromJson(
      List<dynamic> parsedJson) {
    List<OrderListModel> details =
    new List<OrderListModel>();
    details = parsedJson
        .map((i) => OrderListModel.fromJson(i))
        .toList();

    return new OrderListingslList(details: details);
  }
}


class OrderListModel {

  String orderNum;
  String Date;
  String Time;
  String branchId;
  String Invoice;

  OrderListModel({this.orderNum});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    orderNum = json['OrderNum'];
    Date = json['BookingDate'];
    Time = json['BookingTime'];
    branchId = json['BranchID'];
    Invoice = json['Invoice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderNum'] = this.orderNum;
    data['BookingDate'] = this.Date;
    data['BookingTime'] = this.Time;
    data['BranchID'] = this.branchId;
    data['Invoice'] = this.Invoice;
    return data;
  }
}