import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  final baseUrl = Uri.https('dart.dev', '/f/packages/http.json');
  final dataInfo = await http.read(baseUrl);
  final dataInfoJson = json.decode(dataInfo) as Map<String, dynamic>;
  DataModel _dataModel = DataModel.fromJson(dataInfoJson);
  StringBuffer _buffer = StringBuffer();
  _buffer.write('Name: ${_dataModel.name}\n');
  _buffer.write('Latest Version: ${_dataModel.latestVersion}\n');
  _buffer.write('Description: ${_dataModel.description}\n');
  _buffer.write('Publisher: ${_dataModel.publisher}\n');
  _buffer.write('Repository: ${_dataModel.repository}\n');
  print(_buffer.toString());
}

class DataModel {
  final String name;
  final String latestVersion;
  final String description;
  final String publisher;
  final Uri? repository;

  DataModel({
    required this.name,
    required this.latestVersion,
    required this.description,
    required this.publisher,
    this.repository,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'] as String,
      latestVersion: json['latestVersion'] as String,
      description: json['description'] as String,
      publisher: json['publisher'] as String,
      repository:
          json['repository'] != null ? Uri.tryParse(json['repository']) : null,
    );
  }
}
