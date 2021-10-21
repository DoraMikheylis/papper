class Invoice {
  int id;
  String invoiceNumber;
  String invoiceDate;
  Customer customer;
  Creator creator;
  String taxPercent;
  DocumentType documentType;
  Currency currency;
  int paymentType;
  bool includeTax;
  String note;
  IncomeType incomeType;
  List<InvoiceItem> invoiceItems;
  double total;
  double vatSum;
  double grandTotal;

  Invoice(
      {this.id,
      this.invoiceNumber,
      this.invoiceDate,
      this.customer,
      this.creator,
      this.taxPercent,
      this.documentType,
      this.currency,
      this.paymentType,
      this.includeTax,
      this.note,
      this.incomeType,
      this.total,
      this.vatSum,
      this.invoiceItems,
      this.grandTotal});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNumber = json['invoice_number'];
    invoiceDate = json['invoice_date'];
    customer = (json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null);
    creator = (json['creator'] != null
        ? new Creator.fromJson(json['creator'])
        : null);
    taxPercent = json['tax_percent'];
    documentType = json['document_type'] != null
        ? new DocumentType.fromJson(json['document_type'])
        : null;
    currency = (json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null);
    paymentType = json['payment_type'];
    includeTax = json['include_tax'];
    note = json['note'];
    incomeType = (json['income_type'] != null
        ? new IncomeType.fromJson(json['income_type'])
        : null);
    if (json['invoice_items'] != null) {
      invoiceItems = [];
      json['invoice_items'].forEach((v) {
        invoiceItems.add(new InvoiceItem.fromJson(v));
      });
    }
    grandTotal = json['grand_total'].toDouble();
    total = json['total'].toDouble();
    vatSum = json['vat_sum'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_number'] = this.invoiceNumber;
    data['invoice_date'] = this.invoiceDate;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['tax_percent'] = this.taxPercent;
    if (this.documentType != null) {
      data['document_type'] = this.documentType.toJson();
    }
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    data['payment_type'] = this.paymentType;
    data['include_tax'] = this.includeTax;
    data['note'] = this.note;
    if (this.incomeType != null) {
      data['income_type'] = this.incomeType.toJson();
    }
    if (this.invoiceItems != null) {
      data['invoice_items'] = this.invoiceItems.map((v) => v.toJson()).toList();
    }
    data['grand_total'] = this.grandTotal;
    data['total'] = this.total;
    data['vat_sum'] = this.vatSum;

    return data;
  }
}

class Customer {
  int id;
  String vatNumber;
  String name;
  String email;
  String phone;
  String address;
  int creatorId;
  String createdAt;
  String updatedAt;

  Customer(
      {this.id,
      this.vatNumber,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.creatorId,
      this.createdAt,
      this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vatNumber = json['vat_number'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    creatorId = json['creator_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vat_number'] = this.vatNumber;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['creator_id'] = this.creatorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Creator {
  int id;
  String email;
  String username;
  String firstName;
  String lastName;

  Creator({this.id, this.email, this.username, this.firstName, this.lastName});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class DocumentType {
  int id;
  String name;
  String prefix;
  String createdAt;
  String updatedAt;

  DocumentType(
      {this.id, this.name, this.prefix, this.createdAt, this.updatedAt});

  DocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    prefix = json['prefix'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['prefix'] = this.prefix;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Currency {
  int id;
  String name;
  String iSOCode;
  String sign;
  double value;
  String createdAt;
  String updatedAt;

  Currency(
      {this.id,
      this.name,
      this.iSOCode,
      this.sign,
      this.value,
      this.createdAt,
      this.updatedAt});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iSOCode = json['ISO_code'];
    sign = json['sign'];
    value = json['value'].toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ISO_code'] = this.iSOCode;
    data['sign'] = this.sign;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class IncomeType {
  int id;
  String name;
  int incomeGroupId;
  String createdAt;
  String updatedAt;

  IncomeType(
      {this.id, this.name, this.incomeGroupId, this.createdAt, this.updatedAt});

  IncomeType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    incomeGroupId = json['income_group_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['income_group_id'] = this.incomeGroupId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class InvoiceItem {
  int id;
  int invoiceId;
  String name;
  String quantity;
  String price;
  String createdAt;
  String updatedAt;

  InvoiceItem(
      {this.id,
      this.invoiceId,
      this.name,
      this.quantity,
      this.price,
      this.createdAt,
      this.updatedAt});

  InvoiceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceId = json['invoice_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_id'] = this.invoiceId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
