import 'dart:convert';
import 'package:http/http.dart' as http;

//r
//https://api.kundelik.kz/partners/swagger/ui/index/index.html

class KunError implements Exception {
  final String message;
  KunError(this.message);

  @override
  String toString() => message;
  //好厉害
}

class KunBase {
  final String host = "https://api.kundelik.kz/v2/";
  String? token;
  final http.Client client;

  KunBase({this.token, http.Client? client})
      : client = client ?? http.Client() {
    if (token == null) {
      
    }
  }


  Future<String> getToken(String login, String password) async {
    final response = await client.post(
      Uri.parse("https://api.kundelik.kz/v2/authorizations/bycredentials"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "client_id": "387d44e3-e0c9-4265-a9e4-a4caaad5111c",
        "client_secret": "8a7d709c-fdbb-4047-b0ea-8947afe89d67",
        "username": login,
        "password": password,
        "scope": "Schools,Relatives,EduGroups,Lessons,marks,EduWorks,Avatar,"
            "EducationalInfo,CommonInfo,ContactInfo,FriendsAndRelatives,"
            "Files,Wall,Messages",
      }),
    );

    final jsonResponse = json.decode(response.body);

    if (response.statusCode != 200) {
      throw KunError("Site is down or undergoing maintenance.");
    }

    if (jsonResponse['type'] == 'authorizationFailed') {
      throw KunError(jsonResponse['description']);
    }

    return jsonResponse['accessToken'];
  }

  void _checkResponse(http.Response response) {
    if (response.headers['content-type'] == 'text/html') {
      final errorHtml = response.body;
      final errorText = errorHtml
          .split('<div class="error__description">')
          .last
          .split('<p>')
          .last
          .split('</p>')
          .first
          .trim()
          .replaceAll(RegExp('<[^>]*>'), ''); // Remove HTML tags
      throw KunError(errorText);
    }

    final jsonResponse = json.decode(response.body);

    if (jsonResponse['type'] == 'parameterInvalid') {
      throw KunError(jsonResponse['description']);
    } else if (jsonResponse['type'] == 'apiServerError' ||
        jsonResponse['type'] == 'apiUnknownError') {
      throw KunError("Unknown API error, check parameter correctness.");
    }
  }

  Future<Map<String, dynamic>> get(String method,
      {Map<String, String>? params}) async {
    final uri = Uri.parse(host + method).replace(queryParameters: params);
    final response =
        await client.get(uri, headers: {"Access-Token": token ?? ""});
    _checkResponse(response);
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post(String method,
      {Map<String, dynamic>? data}) async {
    final response = await client.post(
      Uri.parse(host + method),
      headers: {
        "Access-Token": token ?? "",
        "Content-Type": "application/json"
      },
      body: json.encode(data ?? {}),
    );
    _checkResponse(response);
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> delete(String method,
      {Map<String, String>? params}) async {
    final uri = Uri.parse(host + method).replace(queryParameters: params);
    final response =
        await client.delete(uri, headers: {"Access-Token": token ?? ""});
    _checkResponse(response);
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> put(String method,
      {Map<String, dynamic>? params}) async {
    final response = await client.put(
      Uri.parse(host + method),
      headers: {
        "Access-Token": token ?? "",
        "Content-Type": "application/json"
      },
      body: json.encode(params ?? {}),
    );
    _checkResponse(response);
    return json.decode(response.body);
  }
}


class KunAPI extends KunBase {
  final String? login;
  final String? password;

  KunAPI({this.login, this.password, String? token}) : super(token: token);

  Future<Map<String, dynamic>> getSchool() async {
    final response = await get("schools/person-schools");
    return response;
  }

  Future<Map<String, dynamic>> getInfo() async {
    final response = await get("users/me");
    return response;
  }
}
