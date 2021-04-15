class ResponseModelListings1 {
  final List<ResponseModelList1> details;

  ResponseModelListings1({
    this.details,
  });

  factory ResponseModelListings1.fromJson(
      List<dynamic> parsedJson) {
    List<ResponseModelList1> details =
    new List<ResponseModelList1>();
    details = parsedJson
        .map((i) => ResponseModelList1.fromJson(i))
        .toList();

    return new ResponseModelListings1(details: details);
  }
}




class ResponseModelList1 {
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
  String email;
  String name;
  String mobile;
  String address;
  String gSTno;
  String pincode;
  String whatsappNumber;
  String invNo;
  double disAmount;
  String disApplied;
  String disApproval;
  String disApprovedBy;
  String fullPayDate;
  String orderNo1;
  double advanceAmount1;
  String date;
  String time;
  int branchID1;
  String orderStatus1;
  String paymentType1;

  ResponseModelList1(
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
        this.email,
        this.name,
        this.mobile,
        this.address,
        this.gSTno,
        this.pincode,
        this.whatsappNumber,
        this.invNo,
        this.disAmount,
        this.disApplied,
        this.disApproval,
        this.disApprovedBy,
        this.fullPayDate,
        this.orderNo1,
        this.advanceAmount1,
        this.date,
        this.time,
        this.branchID1,
        this.orderStatus1,
        this.paymentType1});

  ResponseModelList1.fromJson(Map<String, dynamic> json) {
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
    email = json['Email'];
    name = json['Name'];
    mobile = json['Mobile'];
    address = json['Address'];
    gSTno = json['GSTno'];
    pincode = json['Pincode'];
    whatsappNumber = json['WhatsappNumber'];
    invNo = json['InvNo'];
    disAmount = json['DisAmount'];
    disApplied = json['DisApplied'];
    disApproval = json['DisApproval'];
    disApprovedBy = json['DisApprovedBy'];
    fullPayDate = json['FullPayDate'];
    orderNo1 = json['OrderNo1'];
    advanceAmount1 = json['AdvanceAmount1'];
    date = json['Date'];
    time = json['Time'];
    branchID1 = json['BranchID1'];
    orderStatus1 = json['OrderStatus1'];
    paymentType1 = json['PaymentType1'];
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
    data['Email'] = this.email;
    data['Name'] = this.name;
    data['Mobile'] = this.mobile;
    data['Address'] = this.address;
    data['GSTno'] = this.gSTno;
    data['Pincode'] = this.pincode;
    data['WhatsappNumber'] = this.whatsappNumber;
    data['InvNo'] = this.invNo;
    data['DisAmount'] = this.disAmount;
    data['DisApplied'] = this.disApplied;
    data['DisApproval'] = this.disApproval;
    data['DisApprovedBy'] = this.disApprovedBy;
    data['FullPayDate'] = this.fullPayDate;
    data['OrderNo1'] = this.orderNo1;
    data['AdvanceAmount1'] = this.advanceAmount1;
    data['Date'] = this.date;
    data['Time'] = this.time;
    data['BranchID1'] = this.branchID1;
    data['OrderStatus1'] = this.orderStatus1;
    data['PaymentType1'] = this.paymentType1;
    return data;
  }
}