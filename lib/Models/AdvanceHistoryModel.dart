class OrderAdvanceHistoryList {
  final List<OrderAdvanceHistory> details;

  OrderAdvanceHistoryList({
    this.details,
  });

  factory OrderAdvanceHistoryList.fromJson(
      List<dynamic> parsedJson) {
    List<OrderAdvanceHistory> details =
    new List<OrderAdvanceHistory>();
    details = parsedJson
        .map((i) => OrderAdvanceHistory.fromJson(i))
        .toList();

    return new OrderAdvanceHistoryList(details: details);
  }
}
class OrderAdvanceHistory {
  String orderNo;
  double advanceAmount;
  String date;
  String time;

  OrderAdvanceHistory({this.orderNo, this.advanceAmount, this.date, this.time});

  OrderAdvanceHistory.fromJson(Map<String, dynamic> json) {
    orderNo = json['OrderNo'];
    advanceAmount = json['AdvanceAmount'];
    date = json['Date'];
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderNo'] = this.orderNo;
    data['AdvanceAmount'] = this.advanceAmount;
    data['Date'] = this.date;
    data['Time'] = this.time;
    return data;
  }
}