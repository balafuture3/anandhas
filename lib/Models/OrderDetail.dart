class OrderDetaillListModel {
  final List<OrderDetailModel> details;

  OrderDetaillListModel({
    this.details,
  });

  factory OrderDetaillListModel.fromJson(
      List<dynamic> parsedJson) {
    List<OrderDetailModel> details =
    new List<OrderDetailModel>();
    details = parsedJson
        .map((i) => OrderDetailModel.fromJson(i))
        .toList();

    return new OrderDetaillListModel(details: details);
  }
}

class OrderDetailModel {
  int docNo;
  String docDate;
  String orderNo;
  String bookingDate;
  String bookingTime;
  String cateringService;
  double cateringAmount;
  String vesselSet;
  double vesselSetAmount;
  String vehicle;
  double vehicleAmount;
  double orderPrice;
  String advanceType;
  double advanceAmount;
  String paymentType;
  double cgst;
  double sgst;
  String orderStatus;
  String branchID;
  String remarks;
  int createdBy;
  String createdDate;
  int modifiedBy;
  String modifiedDate;
  int categoryID;
  int vehicleKM;
  String orderFlag;
  int orderFlagNo;

  OrderDetailModel(
      {this.docNo,
        this.docDate,
        this.orderNo,
        this.bookingDate,
        this.bookingTime,
        this.cateringService,
        this.cateringAmount,
        this.vesselSet,
        this.vesselSetAmount,
        this.vehicle,
        this.vehicleAmount,
        this.orderPrice,
        this.advanceType,
        this.advanceAmount,
        this.paymentType,
        this.cgst,
        this.sgst,
        this.orderStatus,
        this.branchID,
        this.remarks,
        this.createdBy,
        this.createdDate,
        this.modifiedBy,
        this.modifiedDate,
        this.categoryID,
      this.vehicleKM,
      });

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    docDate = json['DocDate'];
    orderNo = json['OrderNo'];
    bookingDate = json['BookingDate'];
    bookingTime = json['BookingTime'];
    cateringService = json['CateringService'];
    cateringAmount = json['CateringAmount'];
    vesselSet = json['VesselSet'];
    vesselSetAmount = json['VesselSetAmount'];
    vehicle = json['Vehicle'];
    vehicleAmount = json['VehicleAmount'];
    orderPrice = json['OrderPrice'];
    advanceType = json['AdvanceType'];
    advanceAmount = json['AdvanceAmount'];
    paymentType = json['PaymentType'];
    cgst = json['Cgst'];
    sgst = json['Sgst'];
    orderStatus = json['OrderStatus'];
    branchID = json['BranchID'];
    remarks = json['Remarks'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedDate = json['ModifiedDate'];
    categoryID = json['CategoryID'];
    vehicleKM = json['VehicleKM'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['DocDate'] = this.docDate;
    data['OrderNo'] = this.orderNo;
    data['BookingDate'] = this.bookingDate;
    data['BookingTime'] = this.bookingTime;
    data['CateringService'] = this.cateringService;
    data['CateringAmount'] = this.cateringAmount;
    data['VesselSet'] = this.vesselSet;
    data['VesselSetAmount'] = this.vesselSetAmount;
    data['Vehicle'] = this.vehicle;
    data['VehicleAmount'] = this.vehicleAmount;
    data['OrderPrice'] = this.orderPrice;
    data['AdvanceType'] = this.advanceType;
    data['AdvanceAmount'] = this.advanceAmount;
    data['PaymentType'] = this.paymentType;
    data['Cgst'] = this.cgst;
    data['Sgst'] = this.sgst;
    data['OrderStatus'] = this.orderStatus;
    data['BranchID'] = this.branchID;
    data['Remarks'] = this.remarks;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedDate'] = this.modifiedDate;
    data['CategoryID'] = this.categoryID;
    data['VehicleKM'] = this.vehicleKM;

    return data;
  }
}