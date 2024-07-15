import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../application/dialog/dialog_service.dart';
import '../../utils/color.dart';

class ApiClient {
  ApiClient();

  Map<String, String> createHeaders({
    required String authtoken,
  }) {
    debugPrint("Token is=-=- $authtoken");
    final headers = <String, String>{
      "content-type": "application/json",
      "accept": "application/json",
      if (authtoken != "") 'Authorization': "Bearer $authtoken",
    };

    return headers;
  }

  Future<T?> postData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("_postData URL=-=-=-=-::: $uri");
      debugPrint("_postData headers=-=-=-=-::: $headers");
      debugPrint("_postData body=-=-=-=-::: $body");
      var request = http.Request('POST', uri);
      request.body = json.encode(body);
      debugPrint('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        debugPrint("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ??
                map["message"] ??
                response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=-1 ${response.reasonPhrase} ");
        return builder(responseString);
      }
    } catch (e, s) {
      print("============== error ::::::::::: ${e}");
      print("============== stacktrace ::::::::::: ${s}");
      // DialogServiceV1().showSnackBar(
      //     content: e.toString(),
      //     color: AppColors.red.withOpacity(0.7),
      //     textclr: AppColors.white);
      // throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> getData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("_getData URL=-=-=-=-::: $uri");
      debugPrint("_getData headers=-=-=-=-::: $headers");
      var request = http.Request('GET', uri);
      debugPrint('_getData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode} $responseString');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.colorPrimary);
        debugPrint("response.reasonPhrase=-=-2 ${response.reasonPhrase} ");
        return null;
      }
    } catch (e, s) {
      print("sgsg srg $e, $s");

      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      print("STRACStrace : $s");
      // throw Exception("Exception is =-=-4 $e");
    }
  }

  Future<T?> getDataWithBody<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
    required var body,
  }) async {
    try {
      debugPrint("_getData URL=-=-=-=-::: $uri");
      debugPrint("_getData headers=-=-=-=-::: $headers");
      var request = http.Request('GET', uri);
      debugPrint('_getData $uri body ${request.body}');
      request.headers.addAll(headers);
      debugPrint("1=-=-=-=-::: ");

      request.body = json.encode(body);
      debugPrint("2=-=-=-=-::: ");
      http.StreamedResponse response = await request.send();
      debugPrint("3=-=-=-=-::: ");
      final responseString = await response.stream.bytesToString();

      log('response.statusCode is ${response.statusCode} $responseString');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        // DialogServiceV1().showSnackBar(
        //     content: map["error"] ?? response.reasonPhrase.toString(),
        //     color: AppColors.red.withOpacity(0.7),
        //     textclr: AppColors.colorPrimary);
        debugPrint("response.reasonPhrase=-=-3 ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-5 $e");
    }
  }

  Future<T?> putData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_putData URL=-=-=-=-::: $uri");
      log("_putData headers=-=-=-=-::: $headers");
      log("_putData body=-=-=-=-::: $body");
      var request = http.Request('PUT', uri);
      request.body = json.encode(body);
      log('_putData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=-4 ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> deleteData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("deleteData URL=-=-=-=-::: $uri");
      debugPrint("deleteData headers=-=-=-=-::: $headers");

      var request = http.Request('DELETE', uri);
      debugPrint('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        debugPrint("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=-5 ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> multipartData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
    required var imageparam,
    required var imagepath,
  }) async {
    try {
      debugPrint("_multipartData URL=-=-=-=-::: $uri $imagepath");
      debugPrint("_multipartData headers=-=-=-=-::: $headers");
      debugPrint("_multipartData body=-=-=-=-::: $body");
      var request = http.MultipartRequest('POST', uri);
      if (body.toString() != "{}") {
        request.fields.addAll(body);
      }
      debugPrint('_multipartData $uri body ${request.fields}');
      if (imagepath != '') {
        request.files
            .add(await http.MultipartFile.fromPath(imageparam, imagepath));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('response.statusCode is ${response.statusCode}');
        log("response is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=-6 ${response.reasonPhrase} ");
        return null;
      }
    } catch (e, s) {
      print("error in multipart ::: ${e} ${s}");
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-2 $e");
    }
  }

  Future<T?> multiImagePartData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
    required var imageparam,
    required List imagepath,
  }) async {
    try {
      log("_multipartData URL=-=-=-=-::: $uri");
      log("_multipartData headers=-=-=-=-::: $headers");
      log("_multipartData body=-=-=-=-::: $body");
      var request = http.MultipartRequest('POST', uri);
      if (body != {}) {
        request.fields.addAll(body);
      }
      log('_multipartData $uri body ${request.fields}');
      for (int i = 0; i < imagepath.length; i++) {
        if (imagepath[i] != "") {
          log("i =-=-=-=-=--== $i");
          request.files
              .add(await http.MultipartFile.fromPath(imageparam, imagepath[i]));
          log("🟥🟥🟨🟥🟩 imagepath $i ::: ${imagepath[i]}");
        }
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(" staus code--- ${response.statusCode}");

      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode} ------- ${uri} -------');
      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["message"] ??
                map["error"] ??
                response.reasonPhrase.toString(),
            color: AppColors.red..withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e, s) {
      log("error: $e");
      log("stacktrace: $s");
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      // throw Exception("Exception is =-=-2 $e");
    }
  }

  Future<T?> patchData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_patchData URL=-=-=-=-::: $uri");
      log("_patchData headers=-=-=-=-::: $headers");
      log("_patchData body=-=-=-=-::: $body");
      var request = http.Request('PATCH', uri);
      request.body = json.encode(body);
      log('_patchData $uri body ${request.body}');

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }
}
