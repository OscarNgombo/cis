class CustomerModel {
  String? cUSTKEY;
  String? zONE;
  // String? cELLTELNO;
  String? nAME;
  // String? uAADRESS;
  String? sTATUS;
  String? mETERREF;
  // String? pHYSICALADDRESS;
  String? cUSTOMERCATEGORY;

  CustomerModel(
      {this.cUSTKEY,
      this.zONE,
      // this.cELLTELNO,
      this.nAME,
      // this.uAADRESS,
      this.sTATUS,
      this.mETERREF,
      // this.pHYSICALADDRESS,
      this.cUSTOMERCATEGORY});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    cUSTKEY = json['CUSTKEY'];
    zONE = json['ZONE'];
    // cELLTELNO = json['CELL_TEL_NO'];
    nAME = json['NAME'];
    // uAADRESS = json['UA_ADRESS'];
    sTATUS = json['STATUS'];
    mETERREF = json['METER_REF'];
    // pHYSICALADDRESS = json['PHYSICAL_ADDRESS'];
    cUSTOMERCATEGORY = json['CUSTOMER_CATEGORY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CUSTKEY'] = this.cUSTKEY;
    data['ZONE'] = this.zONE;
    // data['CELL_TEL_NO'] = this.cELLTELNO;
    data['NAME'] = this.nAME;
    // data['UA_ADRESS'] = this.uAADRESS;
    data['STATUS'] = this.sTATUS;
    data['METER_REF'] = this.mETERREF;
    // data['PHYSICAL_ADDRESS'] = this.pHYSICALADDRESS;
    data['CUSTOMER_CATEGORY'] = this.cUSTOMERCATEGORY;
    return data;
  }
}
