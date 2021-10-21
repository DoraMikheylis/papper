import 'package:sign_in_file/models/document.dart';
import 'package:sign_in_file/screens/document/services/document_api_provider.dart';

class DocumentsRepository {
  DocumentProvider _documentsProvider = DocumentProvider();
  Future<List<Document>> getAllDocuments() => _documentsProvider.getDocuments();
  Future<List<Document>> getLastDocuments() =>
      _documentsProvider.getLastDocuments();
  Future<List<Document>> getWaitingDocuments() =>
      _documentsProvider.getWaitingDocuments();
  Future<int> getWaitingDocumentsCount() =>
      _documentsProvider.getWaitingDocumentsCount();

  Future<Document> getDocument(int id) => _documentsProvider.getDocument(id);
}
