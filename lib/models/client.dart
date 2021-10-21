class Client {
  int id;
  String email;
  String username;
  String firstName;
  String lastName;
  int documentsCount;
  String phone;
  String avatar;
  String address;
  String roleId;
  int auditorId;
  int accountantId;
  int organizationTypeId;
  String vatNumber;
  String passport;
  double taxPercent;
  int socialSecurity;
  int reportPeriod;
  String socialSecurityNumber;
  int defaultIncomeTypeId;
  String mhAdvances;
  String mhDeductions;
  String portfolio;
  int notify;
  int notificationRate;

  Client(
      {this.id,
      this.email,
      this.username,
      this.firstName,
      this.lastName,
      this.documentsCount,
      this.phone,
      this.avatar,
      this.address,
      this.roleId,
      this.auditorId,
      this.accountantId,
      this.organizationTypeId,
      this.vatNumber,
      this.passport,
      this.taxPercent,
      this.socialSecurity,
      this.reportPeriod,
      this.socialSecurityNumber,
      this.defaultIncomeTypeId,
      this.mhAdvances,
      this.mhDeductions,
      this.portfolio,
      this.notify,
      this.notificationRate});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    documentsCount = json['documents_count'];
    phone = json['phone'];
    avatar = json['avatar'];
    address = json['address'];
    roleId = json['role_id'];
    auditorId = json['auditor_id'];
    accountantId = json['accountant_id'];
    organizationTypeId = json['organization_type_id'];
    vatNumber = json['vat_number'];
    passport = json['passport'];
    taxPercent = json['tax_percent']?.toDouble();
    socialSecurity = json['social_security'];
    reportPeriod = json['report_period'];
    socialSecurityNumber = json['social_security_number'];
    defaultIncomeTypeId = json['default_income_type_id'];
    mhAdvances = json['mh_advances'];
    mhDeductions = json['mh_deductions'];
    portfolio = json['portfolio'];
    notify = json['notify'];
    notificationRate = json['notification_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['role_id'] = this.roleId;
    data['auditor_id'] = this.auditorId;
    data['accountant_id'] = this.accountantId;
    data['organization_type_id'] = this.organizationTypeId;
    data['vat_number'] = this.vatNumber;
    data['passport'] = this.passport;
    data['tax_percent'] = this.taxPercent;
    data['social_security'] = this.socialSecurity;
    data['report_period'] = this.reportPeriod;
    data['social_security_number'] = this.socialSecurityNumber;
    data['default_income_type_id'] = this.defaultIncomeTypeId;
    data['mh_advances'] = this.mhAdvances;
    data['mh_deductions'] = this.mhDeductions;
    data['portfolio'] = this.portfolio;
    data['notify'] = this.notify;
    data['notification_rate'] = this.notificationRate;
    return data;
  }
}
