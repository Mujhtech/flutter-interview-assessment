import 'dart:convert';
import 'package:flutter_interview_1/HTTPException.dart';
import 'package:http/http.dart' as http;

class BvnVerify {
  static const baseUrl = 'https://jamiu-task-manager.herokuapp.com';
  final client = http.Client();

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cache-Control": "no-cache",
    };
    Map<String, String> jsonBody = {
      "email": "$email",
      "name": "$name",
      "password": "$password"
    };
    final res = await client.post(url,
        headers: jsonHeader, body: json.encode(jsonBody));
    final data = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, data["message"]);
    }

    return data["data"];
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cache-Control": "no-cache",
    };
    Map<String, String> jsonBody = {"email": "$email", "password": "$password"};
    final res = await client.post(url,
        headers: jsonHeader, body: json.encode(jsonBody));
    final data = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, data["message"]);
    }

    return data["data"];
  }

  Future<Map<String, dynamic>> profile(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/me');
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cache-Control": "no-cache",
    };
    Map<String, String> jsonBody = {"email": "$email", "password": "$password"};
    final res = await client.post(url,
        headers: jsonHeader, body: json.encode(jsonBody));
    final data = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, data["message"]);
    }

    return data["data"];
  }

  Future<Map<String, dynamic>> deleteAccount(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/users/me');
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cache-Control": "no-cache",
    };
    Map<String, String> jsonBody = {"email": "$email", "password": "$password"};
    final res = await client.delete(url,
        headers: jsonHeader, body: json.encode(jsonBody));
    final data = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, data["message"]);
    }

    return data["data"];
  }

  Future<Map<String, dynamic>> uploadPassport(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/users/me/avatar');
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cache-Control": "no-cache",
    };
    Map<String, String> jsonBody = {"email": "$email", "password": "$password"};
    final res = await client.post(url,
        headers: jsonHeader, body: json.encode(jsonBody));
    final data = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, data["message"]);
    }

    return data["data"];
  }

  Future<Map<String, dynamic>> getAvatar(String email, String password) async {
    final url = Uri.parse('$baseUrl/company/:id/avatar');
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Cache-Control": "no-cache",
    };
    Map<String, String> jsonBody = {"email": "$email", "password": "$password"};
    final res = await client.post(url,
        headers: jsonHeader, body: json.encode(jsonBody));
    final data = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, data["message"]);
    }

    return data["data"];
  }
}
