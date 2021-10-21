import 'package:flutter/material.dart';
import 'package:sign_in_file/models/client.dart';
import 'package:sign_in_file/screens/clients/client_edit_form.dart';

import '../../size_config.dart';

class ClientCard extends StatelessWidget {
  final Client client;

  const ClientCard({Key key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClientEditForm(
                      client: client,
                    )));
        // arguments: AddDocumentArguments(id: this.document.id));
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
                      (client.firstName != null || client.lastName != null)
                          ? "${client.firstName ?? ""} ${client.lastName ?? ""}"
                          : client.username,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: defaultSize * 2.2,
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      client.email ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: defaultSize * 1.8,
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 2), // 5
                    Text(
                      "מספר המסמכים: ${client.documentsCount ?? 0}",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, //22
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
