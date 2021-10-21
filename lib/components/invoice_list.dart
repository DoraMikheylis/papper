import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_file/cubit/document/document_state.dart';
import 'package:sign_in_file/cubit/invoice/%20invoice_cubit.dart';
import 'package:sign_in_file/cubit/invoice/invoice_state.dart';
import 'package:sign_in_file/screens/invoices/components/invoice_card.dart';

import '../size_config.dart';

class InvoiceList extends StatefulWidget {
  @override
  _InvoiceListState createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final InvoiceCubit invoiceCubit = context.read<InvoiceCubit>();
    invoiceCubit.fetchInvoices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        if (state is InvoiceEmptyState) {
          return Center(
            child: Text(
              'No data received. Try reload the page',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else if (state is InvoiceLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is InvoiceLoadedState) {
          print(state.loadedInvoices);
          return SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2),
                    child: GridView.builder(
                      itemCount: state.loadedInvoices.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            SizeConfig.orientation == Orientation.landscape
                                ? 2
                                : 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing:
                            SizeConfig.orientation == Orientation.landscape
                                ? SizeConfig.defaultSize * 2
                                : 0,
                        childAspectRatio: 1.65,
                      ),
                      itemBuilder: (context, index) =>
                          InvoiceCard(invoice: state.loadedInvoices[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is DocumentErrorState) {
          return Center(
            child: Text(
              'Error fetching invoices',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return null;
      },
    );
  }
}
