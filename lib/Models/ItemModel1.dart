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


class ItemModel1 {
  var docNo;
  String docDate;
  String orderNo;
  String bookingDate;
  String bookingTime;
  String cateringService;
  var cateringAmount;
  String vesselSet;
  var vesselSetAmount;
  String vehicle;
  var vehicleAmount;
  var orderPrice;
  String advanceType;
  var advanceAmount;
  String paymentType;
  double cgst;
  double sgst;
  String orderStatus;
  String branchID;
  String remarks;
  var createdBy;
  String createdDate;
  var modifiedBy;
  String modifiedDate;
  var categoryID;
  var vehicleKM;
  String email;
  String name;
  String mobile;
  String address;
  String gSTno;
  String pincode;
  String whatsappNumber;
  String invNo;
  var disAmount;
  String disApplied;
  String disApproval;
  String disApprovedBy;
  String fullPayDate;
  String vehicleDelType;
  String vehicleDelCharType;
  String categoryName;
  var rowID;
  var docNo1;
  var lineID;
  String itemCode;
  String itemName;
  var qty;
  var price;
  String uOM;
  String status;
  var createdBy1;
  String createdDate1;
  var modifiedBy1;
  String modifiedDate1;
  String orderFlag;
  var orderFlagNo;

  ItemModel1(
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
        this.vehicleDelType,
        this.vehicleDelCharType,
        this.categoryName,
        this.rowID,
        this.docNo1,
        this.lineID,
        this.itemCode,
        this.itemName,
        this.qty,
        this.price,
        this.uOM,
        this.status,
        this.createdBy1,
        this.createdDate1,
        this.modifiedBy1,
        this.modifiedDate1,
        this.orderFlag,
        this.orderFlagNo});

  ItemModel1.fromJson(Map<String, dynamic> json) {
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
    vehicleDelType = json['VehicleDelType'];
    vehicleDelCharType = json['VehicleDelCharType'];
    categoryName = json['CategoryName'];
    rowID = json['RowID'];
    docNo1 = json['DocNo1'];
    lineID = json['LineID'];
    itemCode = json['ItemCode'];
    itemName = json['ItemName'];
    qty = json['Qty'];
    price = json['Price'];
    uOM = json['UOM'];
    status = json['Status'];
    createdBy1 = json['CreatedBy1'];
    createdDate1 = json['CreatedDate1'];
    modifiedBy1 = json['ModifiedBy1'];
    modifiedDate1 = json['ModifiedDate1'];
    orderFlag = json['OrderFlag'];
    orderFlagNo = json['OrderFlagNo'];
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
    data['VehicleDelType'] = this.vehicleDelType;
    data['VehicleDelCharType'] = this.vehicleDelCharType;
    data['CategoryName'] = this.categoryName;
    data['RowID'] = this.rowID;
    data['DocNo1'] = this.docNo1;
    data['LineID'] = this.lineID;
    data['ItemCode'] = this.itemCode;
    data['ItemName'] = this.itemName;
    data['Qty'] = this.qty;
    data['Price'] = this.price;
    data['UOM'] = this.uOM;
    data['Status'] = this.status;
    data['CreatedBy1'] = this.createdBy1;
    data['CreatedDate1'] = this.createdDate1;
    data['ModifiedBy1'] = this.modifiedBy1;
    data['ModifiedDate1'] = this.modifiedDate1;
    data['OrderFlag'] = this.orderFlag;
    data['OrderFlagNo'] = this.orderFlagNo;
    return data;
  }
}