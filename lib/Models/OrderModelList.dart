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

  OrderListModel({this.orderNum});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    orderNum = json['OrderNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderNum'] = this.orderNum;
    return data;
  }
}