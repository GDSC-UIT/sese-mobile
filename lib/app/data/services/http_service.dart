import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response> postRequest({body, url}) async {
    return await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    // print('status1:${response.statusCode}');
    // print('response:${response.body}');
  }
}
