import 'package:flutter/foundation.dart';
import 'package:sign_in_file/models/document.dart';

abstract class DocumentState {}

class DocumentEmptyState extends DocumentState {}

class DocumentLoadingState extends DocumentState {}

class DocumentLoadedState extends DocumentState {
  List<Document> loadedDocuments;
  DocumentLoadedState({@required this.loadedDocuments})
      : assert(loadedDocuments != null);
}

class DocumentErrorState extends DocumentState {}
