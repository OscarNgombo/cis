class CustomerModel {
  String? cUSTKEY;
  String? zONE;
 String? cELLTELNO;
  String? nAME;
  // String? uADDRESS;
  String? sTATUS;
  String? mETERREF;
  // String? pHYSICALADDRESS;
  String? cUSTOMERCATEGORY;

  CustomerModel(
      {this.cUSTKEY,
      this.zONE,
      this.cELLTELNO,
      this.nAME,
      // this.uADDRESS,
      this.sTATUS,
      this.mETERREF,
      // this.pHYSICALADDRESS,
      this.cUSTOMERCATEGORY});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    cUSTKEY = json['CUSTKEY'];
    zONE = json['ZONE'];
    cELLTELNO = json['CELL_TEL_NO'];
    nAME = json['NAME'];
    // uADDRESS = json['UA_ADDRESS'];
    sTATUS = json['STATUS'];
    mETERREF = json['METER_REF'];
    // pHYSICALADDRESS = json['PHYSICAL_ADDRESS'];
    cUSTOMERCATEGORY = json['CUSTOMER_CATEGORY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CUSTKEY'] = cUSTKEY;
    data['ZONE'] = zONE;
    data['CELL_TEL_NO'] = cELLTELNO;
    data['NAME'] = nAME;
    // data['UA_ADDRESS'] = this.uADDRESS;
    data['STATUS'] = sTATUS;
    data['METER_REF'] = mETERREF;
    // data['PHYSICAL_ADDRESS'] = this.pHYSICALADDRESS;
    data['CUSTOMER_CATEGORY'] = cUSTOMERCATEGORY;
    return data;
  }
}
