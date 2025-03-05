import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  try {
    final baseUrl = Uri.https('jsonplaceholder.typicode.com', '/users/3');
    final dataInfo = await http.read(baseUrl);
    final dataInfoJson = json.decode(dataInfo) as Map<String, dynamic>;
    DataModel data = DataModel.fromJson(dataInfoJson);
    print('Id: ${data.id}');
    print('Name: ${data.name}');
    print('Username: ${data.username}');
    print('Email: ${data.email}');
    print('Phone: ${data.phone}');
    print('Website: ${data.website}');
    print(
      'Company Name & Catchphrase: ${data.company['name']} - ${data.company['catchPhrase']}',
    );
    print(
      'Address: ${data.address['street']}, ${data.address['suite']}, ${data.address['city']}, ${data.address['zipcode']}',
    );
  } catch (e) {
    print('An error occurred');
  }
}

class DataModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final Uri? website;
  final Map<String, dynamic> company;
  final Map<String, dynamic> address;

  DataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    this.website,
    required this.company,
    required this.address,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] != null ? Uri.tryParse(json['website']) : null,
      company: json['company'] as Map<String, dynamic>,
      address: json['address'] as Map<String, dynamic>,
    );
  }
}
