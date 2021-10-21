import 'dart:convert';

import 'package:sign_in_file/models/invoice.dart';
import 'package:sign_in_file/network_utils/api.dart';

class InvoiceApi {
  Future<List<Invoice>> getInvoices() async {
    final response = await Network().getData("/invoices");

    if (response.statusCode == 200) {
      final List<dynamic> documentJson = json.decode(response.body)['data'];

      return documentJson.map((json) => Invoice.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching documents');
    }
  }
}
