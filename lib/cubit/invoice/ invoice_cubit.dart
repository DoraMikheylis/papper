import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_file/cubit/invoice/invoice_state.dart';
import 'package:sign_in_file/models/invoice.dart';
import 'package:sign_in_file/screens/invoices/services/invoice.api.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceApi _invoiceApi;

  InvoiceCubit(this._invoiceApi) : super(InvoiceEmptyState());

  Future<void> fetchInvoices() async {
    try {
      emit(InvoiceLoadingState());
      final List<Invoice> _loadedDocumentList = await _invoiceApi.getInvoices();
      emit(InvoiceLoadedState(loadedInvoices: _loadedDocumentList));
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      emit(InvoiceErrorState());
    }
  }

  Future<void> clearInvoices() async {
    emit(InvoiceEmptyState());
  }
}
