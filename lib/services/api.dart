import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wisata/model/wisata2.dart';

class APIstatic {
  static final _host = "http://192.168.56.1/api";

  static Future<List<Wisata>> getWisata() async {
    try {
      final response = await http
          .get(Uri.parse("$_host/wisata"), headers: {'Authorization': ''});
      if (response.statusCode == 200) {
        // Parse JSON response
        final jsonData = json.decode(response.body);
        List<Wisata> wisataList = [];
        for (var item in jsonData) {
          wisataList.add(Wisata.fromJson(item));
        }
        return wisataList;
      } else {
        // Handle error response
        throw Exception('Failed to fetch wisata');
      }
    } catch (e) {
      // Handle network or parsing errors
      throw Exception('Error: $e');
    }
  }
}
