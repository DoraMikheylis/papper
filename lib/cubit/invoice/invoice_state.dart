import 'package:flutter/foundation.dart';
import 'package:sign_in_file/models/invoice.dart';

abstract class InvoiceState {}

class InvoiceEmptyState extends InvoiceState {}

class InvoiceLoadingState extends InvoiceState {}

class InvoiceLoadedState extends InvoiceState {
  List<Invoice> loadedInvoices;
  InvoiceLoadedState({@required this.loadedInvoices})
      : assert(loadedInvoices != null);
}

class InvoiceErrorState extends InvoiceState {}
