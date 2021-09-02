import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;

  PostResult({required this.id, required this.name});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(id: object['id'], name: object['name']);
  }

  static Future<PostResult> connectAPI(String id, String name) async {
    Uri apiURL = Uri.parse('https://reqres.in/api/users');

    var resultAPI = await http.post(apiURL, body: {
      'id': id,
      'name': name,
    });
    var jsonObject = json.decode(resultAPI.body);

    return PostResult.createPostResult(jsonObject);
  }
}
