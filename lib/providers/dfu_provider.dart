import 'dart:async';
import 'dart:io';
import 'package:diabe_trek/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DFUProvider with ChangeNotifier {
  String url = 'http://localhost:5000';
  Future<void> analyzeImage(
    BuildContext context,
    String imagePath,
  ) async {
    try {
      final request = await http.MultipartRequest(
        'POST',
        Uri.parse('$url/methodname'),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          imagePath.split('/').last,
          imagePath,
        ),
      );
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      switch (response.statusCode) {
        case 200:
          break;
        case 404:
          break;
        case 500:
          break;
        default:
      }
    } on SocketException {
      throw Constants.connectionError;
    } on TimeoutException {
      throw Constants.timeout;
    } catch (e) {
      throw Constants.serverError;
    }
  }

  Future<void> getMethod(
    BuildContext context,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(''),
      );
      switch (response.statusCode) {
        case 200:
          break;
        case 404:
          break;
        case 500:
          break;
        default:
      }
    } on SocketException {
      throw Constants.connectionError;
    } on TimeoutException {
      throw Constants.timeout;
    } catch (e) {
      throw Constants.serverError;
    }
  }

  Future<void> multipartMethod(
    BuildContext context,
    File imageFile,
  ) async {
    try {
      final request = await http.MultipartRequest(
        'POST',
        Uri.parse(''),
      );
      request.files.add(
        await http.MultipartFile.fromPath('', ''),
      );
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      switch (response.statusCode) {
        case 200:
          break;
        case 404:
          break;
        case 500:
          break;
        default:
      }
    } on SocketException {
      throw Constants.connectionError;
    } on TimeoutException {
      throw Constants.timeout;
    } catch (e) {
      throw Constants.serverError;
    }
  }
}
