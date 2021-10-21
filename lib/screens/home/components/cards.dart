import 'package:sign_in_file/screens/clients/services/client_api_provider.dart';
import 'package:sign_in_file/screens/document/services/document_repository.dart';

final clientProvider = ClientProvider();
final documentsRepository = DocumentsRepository();

List<Map<String, dynamic>> cards = [
  {
    'future': documentsRepository.getWaitingDocumentsCount(),
    'text': "waiting_documents"
  },
  {'future': clientProvider.getClientsCount(), 'text': "clients"}
];
