import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:macos_ui_app/app/controller/app_controller.dart';
import 'package:macos_ui_app/app/model/api_response_model.dart';
import 'package:macos_ui_app/app/util/url_simplifier.dart';

class ApiClient {
  static var kBaseUrltest = dotenv.env['APP_API_URLdemo'] ?? '';
  static var kBaseUrl = 'http://169.254.253.37';

  static Future<ApiResponseModel> post(
    String url, {
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    return await _executeRequest(
      (client) => client.post(
        UriSimplifier.uri("$kBaseUrl$url", query),
        body: jsonEncode(body),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${AppController.find.token}',
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<ApiResponseModel> put(
    String url, {
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    return await _executeRequest(
      (client) => client.put(
        UriSimplifier.uri("$kBaseUrl$url", query),
        body: jsonEncode(body),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${AppController.find.token}',
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<ApiResponseModel> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    return await _executeRequest(
      (client) => client.delete(
        UriSimplifier.uri("$kBaseUrl$url", query),
        body: jsonEncode(body),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${AppController.find.token}',
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<ApiResponseModel> get(
    String url, {
    Map<String, dynamic>? query,
    bool simplifyUri = false,
  }) async {
    return await _executeRequest(
      (client) {
        final Uri uri = UriSimplifier.uri("$kBaseUrl$url", query);

        var header = {
          HttpHeaders.authorizationHeader: 'Bearer ${AppController.find.token}',
          "Content-Type": "application/json",
        };

        return client.get(
          uri,
          headers: header,
        );
      },
    );
  }

  static Future<ApiResponseModel> uploadFile({
    required String url,
    required Map<String, String> fields,
    Map<String, dynamic>? query,
    List<http.MultipartFile> files = const [],
  }) async {
    var headers = {
      "Authorization": "Bearer ${AppController.find.token}",
      "Content-type": "multipart/form-data"
    };

    var postUri = UriSimplifier.uri("$kBaseUrl$url", query);
    var request = http.MultipartRequest("POST", postUri);

    request.headers.addAll(headers);
    request.fields.addAll(fields);

    if (files.isNotEmpty) {
      request.files.addAll(files);
    }

    late StreamedResponse response;
    var data = "Couldn't upload files";

    try {
      response = await request.send();
      data = await response.stream.bytesToString();
    } catch (e) {
      return Failure(
        statusCode: response.statusCode,
        data: data,
      );
    }

    return Success(
      statusCode: response.statusCode,
      data: jsonDecode(data),
    );
  }

  static Future<ApiResponseModel> _executeRequest(
    Future<http.Response> Function(http.Client) request,
  ) async {
    var client = http.Client();

    try {
      var response = await request(client);

      if (response.statusCode == 403) {
        return Failure(
          statusCode: response.statusCode,
          data: "Error: Forbidden",
        );
      }

      if (response.statusCode == 401) {
        return Failure(
          statusCode: response.statusCode,
          data: "Unauthorized",
        );
      }

      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));

      return Success(
        statusCode: 200,
        data: decodedResponse,
      );
    } on HttpException {
      return Failure(
        statusCode: 101,
        data: "No Internet connection",
      );
    } on FormatException {
      return Failure(
        statusCode: 102,
        data: "Invalid Format",
      );
    } catch (ex, _) {
      return Failure(
        statusCode: 103,
        data: "Unkwon Error: $ex",
      );
    } finally {
      client.close();
    }
  }
}
