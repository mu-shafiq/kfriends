import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as parser;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Create a custom interceptor
class AuthInterceptor extends Interceptor {
  final String bearerToken;
  AuthInterceptor(this.bearerToken);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // String token = await SharedPreferences.getInstance()
    //     .then((value) => value.getString(Keys.bearerToken) ?? "");
    // Add the bearer token to the headers
    options.headers["Authorization"] = "Bearer ${token ?? ''}";
    super.onRequest(options, handler);
  }
}

class MongoDBController extends GetxController {
  String baseUrl = '${Keys.serverIP}:3000/api/v1/';
  Dio dio = Dio();

  @override
  onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () async {
      dio.interceptors.add(AuthInterceptor(token ?? ''));
    });
  }

  Future<Map<String, dynamic>?> getCollection(String collectionName,
      {List<String> queries = const []}) async {
    try {
      String queryString = '/?';

      for (var query in queries) {
        queryString += "&$query";
      }
      printInfo(info: baseUrl + collectionName + queryString);
      Response res = await dio.get(
        baseUrl + collectionName + queryString,
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return res.data;
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDocument(
      String collectionName, String documentId) async {
    try {
      Response res = await dio.get(
        '$baseUrl$collectionName/$documentId',
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return res.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> postDocument(
      String collectionName, Map<String, dynamic> data) async {
    try {
      Response res = await dio.post(
        baseUrl + collectionName,
        data: data,
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return res.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> patchDocument(String collectionName,
      String documentId, Map<String, dynamic> data) async {
    try {
      Response res = await dio.patch(
        '$baseUrl$collectionName/$documentId',
        data: data,
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return res.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> deleteDocument(
      String collectionName, String documentId) async {
    try {
      printInfo(info: '$baseUrl$collectionName/$documentId');
      Response res = await dio.delete(
        '$baseUrl$collectionName/$documentId',
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return res.data;
    } catch (e) {
      printError(info: "$e");

      return null;
    }
  }

  Future<Map<String, dynamic>?> callFunction(String functionName,
      {Map<String, dynamic>? data}) async {
    try {
      printInfo(info: "${baseUrl}functions/$functionName");
      Response res = await dio.post(
        "${baseUrl}functions/$functionName",
        data: data ?? {},
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return res.data;
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> uploadJPG(
      Uint8List bytes, String folderName) async {
    try {
      var mpFile = http.MultipartFile.fromBytes('file', bytes,
          filename: DateTime.now().millisecondsSinceEpoch.toString(),
          contentType: parser.MediaType("image", "jpeg"));
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}functions/${Keys.uploadFileToServer}"),
      );
      request.files.add(mpFile);
      request.fields['folder'] = folderName;

      var streamRes = await request.send();
      var res = await http.Response.fromStream(streamRes);
      return json.decode(res.body);
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> uploadPNG(
      Uint8List bytes, String folderName) async {
    try {
      var mpFile = http.MultipartFile.fromBytes('file', bytes,
          filename: DateTime.now().millisecondsSinceEpoch.toString(),
          contentType: parser.MediaType("image", "png"));
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}functions/${Keys.uploadFileToServer}"),
      );
      request.files.add(mpFile);
      request.fields['folder'] = folderName;

      var streamRes = await request.send();
      var res = await http.Response.fromStream(streamRes);

      return json.decode(res.body);
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> uploadPDF(
      Uint8List bytes, String folderName) async {
    try {
      var mpFile = http.MultipartFile.fromBytes('file', bytes,
          filename: DateTime.now().millisecondsSinceEpoch.toString(),
          contentType: parser.MediaType("application", "pdf"));
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}functions/${Keys.uploadFileToServer}"),
      );
      request.files.add(mpFile);
      request.fields['folder'] = folderName;

      var streamRes = await request.send();
      var res = await http.Response.fromStream(streamRes);

      return json.decode(res.body);
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> uploadXLSX(
      Uint8List bytes, String folderName, String fileName) async {
    try {
      var mpFile = http.MultipartFile.fromBytes('file', bytes,
          filename: fileName,
          contentType: parser.MediaType("application",
              "vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}functions/${Keys.uploadFileToServer}"),
      );
      request.files.add(mpFile);
      request.fields['folder'] = folderName;

      var streamRes = await request.send();
      var res = await http.Response.fromStream(streamRes);

      return json.decode(res.body);
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> uploadCSV(
      Uint8List bytes, String folderName) async {
    try {
      var mpFile = http.MultipartFile.fromBytes('file', bytes,
          filename: DateTime.now().millisecondsSinceEpoch.toString(),
          contentType: parser.MediaType("text", "csv"));
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}functions/${Keys.uploadFileToServer}"),
      );
      request.files.add(mpFile);
      request.fields['folder'] = folderName;

      var streamRes = await request.send();
      var res = await http.Response.fromStream(streamRes);

      return json.decode(res.body);
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }

  void throwExpection(Map<String, dynamic>? response, {String? msg}) {
    if (response != null) {
      if (response[Keys.status] == Keys.fail) {
        throw response[Keys.message];
      }
    } else {
      throw msg ?? "An Error occurs";
    }
  }

  Future<String?> generateId() async {
    Map<String, dynamic>? response = await callFunction(Keys.generateId);

    if (response![Keys.status] == Keys.success) {
      printInfo(info: response[Keys.data][Keys.id].toString());
      return response[Keys.data][Keys.id];
    } else {
      throwExpection(response);
      return null;
    }
  }
}
