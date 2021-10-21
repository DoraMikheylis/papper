import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sign_in_file/app_localizations.dart';
import 'package:sign_in_file/models/invoice.dart';
import 'package:sign_in_file/screens/invoices/invoice_edit_form.dart';

import '../../../size_config.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;

  const InvoiceCard({Key key, this.invoice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;

    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditInvoiceForm(invoice: invoice)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 5), blurRadius: 10)
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "№ ${invoice.invoiceNumber ?? ""}",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, //22
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      invoice.creator.firstName + invoice.creator.lastName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: defaultSize * 2.2,
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      "${DateFormat("dd/MM/yyyy").format(DateTime.parse(invoice.invoiceDate))}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: defaultSize * 1.8,
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Spacer(),

                    Row(
                      children: [
                        Text(
                          t("VAT"),
                          style: TextStyle(
                              fontSize: defaultSize * 1.3, color: Colors.black),
                        ),
                        Text(
                          "${invoice.vatSum} ${invoice.currency.sign}",
                          style: TextStyle(
                              fontSize: defaultSize * 2,
                              fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.2), //5
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${invoice.grandTotal.toStringAsFixed(2)} ${invoice.currency.sign}",
                    style: TextStyle(
                        fontSize: defaultSize * 2.5,
                        fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: defaultSize * 1.2), //5
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
