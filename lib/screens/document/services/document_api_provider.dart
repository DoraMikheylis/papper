import 'dart:convert';
import 'package:sign_in_file/models/document.dart';
import 'package:sign_in_file/network_utils/api.dart';

class DocumentProvider {
  Future<List<Document>> getDocuments() async {
    final response = await Network().getData("/documents");

    if (response.statusCode == 200) {
      final List<dynamic> documentJson = json.decode(response.body)['data'];

      return documentJson.map((json) => Document.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching documents');
    }
  }

  Future<Document> getDocument(int id) async {
    final response = await Network().getData("/documents/$id");

    if (response.statusCode == 200) {
      final dynamic documentJson = json.decode(response.body)['data'];

      return Document.fromJson(documentJson);
    } else {
      throw Exception('Error fetching documents');
    }
  }

  Future<List<Document>> getLastDocuments() async {
    final response = await Network().getData("/documents/last");

    if (response.statusCode == 200) {
      final List<dynamic> documentJson = json.decode(response.body)['data'];

      return documentJson.map((json) => Document.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching documents');
    }
  }

  Future<List<Document>> getWaitingDocuments() async {
    final response = await Network().getData("/documents/waiting");

    if (response.statusCode == 200) {
      final List<dynamic> documentJson = json.decode(response.body)['data'];

      return documentJson.map((json) => Document.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching documents');
    }
  }

  Future<int> getWaitingDocumentsCount() async {
    final response = await Network().getData("/documents/waiting");

    if (response.statusCode == 200) {
      final int count = json.decode(response.body)['meta']['total'];

      return count;
    } else {
      throw Exception('Error fetching documents');
    }
  }
}
