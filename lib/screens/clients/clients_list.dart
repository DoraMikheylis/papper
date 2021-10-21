import 'package:flutter/material.dart';
import 'package:sign_in_file/components/bottom_nav_bar.dart';
import 'package:sign_in_file/models/client.dart';
import 'package:sign_in_file/screens/clients/client_add_form.dart';
import 'package:sign_in_file/screens/clients/client_card.dart';
import 'package:sign_in_file/screens/clients/services/client_api_provider.dart';

import '../../app_localizations.dart';
import '../../size_config.dart';

class ClientsListScreen extends StatefulWidget {
  static String routeName = '/clients';
  const ClientsListScreen({Key key}) : super(key: key);

  @override
  _ClientsListScreenState createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final clientProvider = ClientProvider();

  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return FutureBuilder(
        future: clientProvider.getClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              title: Text("לקוחות"),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, ClientAddForm.routeName);
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
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.defaultSize * 2,
                                  vertical: 20),
                              child: snapshot.hasData
                                  ? GridView.builder(
                                      itemCount: snapshot.data.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            SizeConfig.orientation ==
                                                    Orientation.landscape
                                                ? 2
                                                : 1,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing:
                                            SizeConfig.orientation ==
                                                    Orientation.landscape
                                                ? SizeConfig.defaultSize * 2
                                                : 0,
                                        childAspectRatio: 2.65,
                                      ),
                                      itemBuilder: (context, index) =>
                                          ClientCard(
                                              client: snapshot.data[index]),
                                    )
                                  : Container()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}
