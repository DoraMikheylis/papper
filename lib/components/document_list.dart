import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_file/cubit/document/document_cubit.dart';
import 'package:sign_in_file/cubit/document/document_state.dart';
import 'package:sign_in_file/screens/document/add_document.dart';
import 'package:sign_in_file/screens/document/components/document_card.dart';

import '../size_config.dart';

class DocumentList extends StatefulWidget {
  @override
  _DocumentListState createState() => _DocumentListState();
}

class _DocumentListState extends State<DocumentList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final DocumentCubit documentCubit = context.read<DocumentCubit>();
    documentCubit.fetchDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentCubit, DocumentState>(
      builder: (context, state) {
        if (state is DocumentEmptyState) {
          return Center(
            child: Text(
              'No data received. Try reload the page',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else if (state is DocumentLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DocumentLoadedState) {
          print(state.loadedDocuments);
          return SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2),
                    child: GridView.builder(
                      itemCount: state.loadedDocuments.length,
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
                          DocumentCard(state.loadedDocuments[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is DocumentErrorState) {
          return Center(
            child: Text(
              'שגיאה באחזור מסמכים',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return Container();
      },
    );
  }
}
