import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_file/components/bottom_nav_bar.dart';
import 'package:sign_in_file/components/document_list.dart';
import 'package:sign_in_file/cubit/document/document_cubit.dart';
import 'package:sign_in_file/screens/document/add_document.dart';
import 'package:sign_in_file/screens/document/components/categories.dart';
import 'package:sign_in_file/screens/document/services/document_repository.dart';

import '../../app_localizations.dart';
import '../../size_config.dart';

class DocumentListScreen extends StatelessWidget {
  static String routeName = '/document_list';
  final documentsRepository = DocumentsRepository();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final String Function(String key) t =
        AppLocalizations.of(context).translate;

    return BlocProvider<DocumentCubit>(
      create: (context) {
        return DocumentCubit(documentsRepository);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(t("documents_list")),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddDocumentScreen.routeName);
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
            Categories(),
            Expanded(
              child: DocumentList(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
