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
  String bookingDate;
  String bookingTime;
  String branchID;
  String invoice;
  String name;
  String mobile;

  OrderListModel(
      {this.orderNum,
        this.bookingDate,
        this.bookingTime,
        this.branchID,
        this.invoice,
        this.name,
        this.mobile});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    orderNum = json['OrderNum'];
    bookingDate = json['BookingDate'];
    bookingTime = json['BookingTime'];
    branchID = json['BranchID'];
    invoice = json['Invoice'];
    name = json['Name'];
    mobile = json['Mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderNum'] = this.orderNum;
    data['BookingDate'] = this.bookingDate;
    data['BookingTime'] = this.bookingTime;
    data['BranchID'] = this.branchID;
    data['Invoice'] = this.invoice;
    data['Name'] = this.name;
    data['Mobile'] = this.mobile;
    return data;
  }
}