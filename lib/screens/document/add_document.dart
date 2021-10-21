import 'package:flutter/material.dart';
import 'package:sign_in_file/models/document.dart';
import 'package:sign_in_file/screens/document/components/adding%20document/body.dart';
import 'package:sign_in_file/screens/document/services/document_repository.dart';

class AddDocumentArguments {
  final int id;

  AddDocumentArguments({this.id});
}

class AddDocumentScreen extends StatefulWidget {
  static String routeName = '/add_document';

  @override
  _AddDocumentScreenState createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  Document document;
  @override
  void didChangeDependencies() async {
    final DocumentsRepository documentsRepository = DocumentsRepository();
    var args =
        (ModalRoute.of(context).settings.arguments as AddDocumentArguments);

    if (args?.id != null) {
      var editDocument = await documentsRepository.getDocument(args.id);
      print(editDocument.toJson());

      setState(() {
        this.document = editDocument;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          text: document != null ? "ערוך מסמך ${document.id}" : null),
      body: Body(document: document),
    );
  }

  AppBar buildAppBar({String text}) {
    return AppBar(
      title: Text(text ?? 'להוסיף מסמך'),
      centerTitle: true,
    );
  }
}
