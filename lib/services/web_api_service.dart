import 'dart:io';
import 'dart:convert';
import 'package:cyberdoctor/utils/links.dart';
import 'package:http/http.dart' as http;

class WebApiService {

  Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  static Future<Map<String, dynamic>> getProblems() async {
    final response = await http.get(Uri.parse('${Links.serverurl}problem'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Conection fail ${response.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> getSolution(int avaria_id) async {
    final response = await http.get(Uri.parse('${Links.serverurl}solution/${avaria_id}'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Conection fail ${response.statusCode}');
    }
  }


}
