import 'package:flutter/material.dart';
import 'package:sign_in_file/app_localizations.dart';
import 'package:sign_in_file/models/document.dart';
import 'package:sign_in_file/screens/document/services/document_repository.dart';
import 'package:sign_in_file/screens/home/components/cards.dart';
import 'package:sign_in_file/screens/home/components/home_card.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Document> documents = [];
  final documentsRepository = DocumentsRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.defaultSize * 2), //5
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: cards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 10,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => FutureBuilder<int>(
                  future: cards[index]['future'],
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return HomeCard(
                        press: () {},
                        amount: snapshot.data,
                        text: AppLocalizations.of(context)
                            .translate(cards[index]['text']),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
