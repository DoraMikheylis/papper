import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_file/components/bottom_nav_bar.dart';
import 'package:sign_in_file/components/invoice_list.dart';
import 'package:sign_in_file/cubit/invoice/%20invoice_cubit.dart';
import 'package:sign_in_file/screens/invoices/invoice_add_form.dart';
import 'package:sign_in_file/screens/invoices/services/invoice.api.dart';

import '../../app_localizations.dart';
import '../../size_config.dart';

class InvoiceListScreen extends StatelessWidget {
  static String routeName = '/invoices';
  final _invoiceApi = InvoiceApi();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final String Function(String key) t =
        AppLocalizations.of(context).translate;

    return BlocProvider<InvoiceCubit>(
      create: (context) {
        return InvoiceCubit(_invoiceApi);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(t("invoices_list")),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddInvoiceForm.routeName);
              },
            ),
            SizedBox(
              // It means 5 because by out defaultSize = 10
              width: SizeConfig.defaultSize * 0.5,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InvoiceList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
