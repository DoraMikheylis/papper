import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sign_in_file/app_localizations.dart';
import 'package:sign_in_file/models/document.dart';

import '../../../size_config.dart';
import '../add_document.dart';

class DocumentCard extends StatelessWidget {
  final Document document;

  const DocumentCard(this.document, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;

    Color textColor =
        document.documentType == "Income" ? Colors.green : Colors.red;
    Color statusColor = document.status == 'Confirmed'
        ? Colors.green
        : (document.status == 'Unconfirmed' ? Colors.yellow[600] : Colors.red);
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AddDocumentScreen.routeName,
            arguments: AddDocumentArguments(id: this.document.id));
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
                      "№ ${document.documentNumber ?? ""}",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, //22
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      document.creator,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: defaultSize * 2.2,
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      "${DateFormat("dd/MM/yyyy").format(DateTime.parse(document.documentDate))}",
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
                          t("sum"),
                          style: TextStyle(
                              fontSize: defaultSize * 1.3, color: Colors.black),
                        ),
                        Text(
                          "${document.sumWithoutVat} ${document.currencySign}",
                          style: TextStyle(
                              color: textColor,
                              fontSize: defaultSize * 2,
                              fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    Row(children: [
                      Text(
                        t('VAT'),
                        style: TextStyle(
                            fontSize: defaultSize * 1.3, color: Colors.black),
                      ),
                      Text(
                        "${document.vat} ${document.currencySign}",
                        style: TextStyle(
                            color: textColor,
                            fontSize: defaultSize * 2,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),

                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.2), //5
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: SizeConfig.defaultSize * 2),
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize * 2, //20
                      vertical: SizeConfig.defaultSize * 0.5, //5
                    ),
                    decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.defaultSize * 1.5, // 16
                        )),
                    child: Text(
                      t(document.status.toLowerCase()),
                      style: TextStyle(
                          color: statusColor == Colors.yellow[600]
                              ? Colors.black
                              : Colors.white,
                          fontSize: defaultSize * 1.5,
                          fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${document.sum} ${document.currencySign}",
                    style: TextStyle(
                        color: textColor,
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
