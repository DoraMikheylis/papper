import 'dart:convert';

import 'package:sign_in_file/models/client.dart';
import 'package:sign_in_file/network_utils/api.dart';

class ClientProvider {
  Future<List<Client>> getClients() async {
    final response = await Network().getData("/clients");

    if (response.statusCode == 200) {
      final List<dynamic> clientJson = json.decode(response.body)['data'];

      return clientJson.map((json) => Client.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching clients');
    }
  }

  Future<int> getClientsCount() async {
    final response = await Network().getData("/clients");

    if (response.statusCode == 200) {
      final int count = json.decode(response.body)['meta']['total'];

      return count;
    } else {
      throw Exception('Error fetching clients');
    }
  }
}
