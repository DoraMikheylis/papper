class Document {
  int id;
  String documentNumber;
  String file;
  int userId;
  String creator;
  String documentText;
  String status;
  String documentDate;
  String documentType;
  String currencySign;
  double sumWithoutVat;
  double vat;
  double sum;

  Document(
      {this.id,
      this.documentNumber,
      this.file,
      this.userId,
      this.creator,
      this.documentText,
      this.status,
      this.documentDate,
      this.documentType,
      this.currencySign,
      this.sumWithoutVat,
      this.vat,
      this.sum});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentNumber = json['document_number'];
    file = json['file'];
    userId = json['user_id'];
    creator = json['creator'];
    documentText = json['document_text'];
    status = json['status'];
    documentDate = json['document_date'];
    documentType = json['document_type'];
    currencySign = json['currency_sign'];
    sumWithoutVat = json['sum_without_vat']?.toDouble();
    vat = json['vat']?.toDouble();
    sum = json['sum']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document_number'] = this.documentNumber;
    data['file'] = this.file;
    data['user_id'] = this.userId;
    data['creator'] = this.creator;
    data['document_text'] = this.documentText;
    data['status'] = this.status;
    data['document_date'] = this.documentDate;
    data['document_type'] = this.documentType;
    data['currency_sign'] = this.currencySign;
    data['sum_without_vat'] = this.sumWithoutVat;
    data['vat'] = this.vat;
    data['sum'] = this.sum;
    return data;
  }
}
