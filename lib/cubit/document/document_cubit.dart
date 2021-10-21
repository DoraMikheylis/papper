import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_file/cubit/document/document_state.dart';
import 'package:sign_in_file/models/document.dart';
import 'package:sign_in_file/screens/document/services/document_repository.dart';

class DocumentCubit extends Cubit<DocumentState> {
  final DocumentsRepository documentsRepository;

  DocumentCubit(this.documentsRepository) : super(DocumentEmptyState());

  Future<void> fetchDocuments() async {
    try {
      emit(DocumentLoadingState());
      final List<Document> _loadedDocumentList =
          await documentsRepository.getAllDocuments();
      emit(DocumentLoadedState(loadedDocuments: _loadedDocumentList));
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      emit(DocumentErrorState());
    }
  }

  Future<void> fetchLastDocuments() async {
    try {
      emit(DocumentLoadingState());
      final List<Document> _loadedDocumentList =
          await documentsRepository.getLastDocuments();
      emit(DocumentLoadedState(loadedDocuments: _loadedDocumentList));
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      emit(DocumentErrorState());
    }
  }

  Future<void> fetchWaitingDocuments() async {
    try {
      emit(DocumentLoadingState());
      final List<Document> _loadedDocumentList =
          await documentsRepository.getWaitingDocuments();
      emit(DocumentLoadedState(loadedDocuments: _loadedDocumentList));
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      emit(DocumentErrorState());
    }
  }

  Future<void> clearDocuments() async {
    emit(DocumentEmptyState());
  }
}
