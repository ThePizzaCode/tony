import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../env/env.dart';
import '../models/user_model.dart';
import '../utils/url.dart';
import '../storage/storage.dart';

class User with ChangeNotifier {
  String errorMessage = '';
  bool loading = false;

  String token = '';

  UserModel user = UserModel(
    id: '',
    walletID: '',
    username: '',
    phone: '',
  );

  // temp
  bool check = true;
  String phoneNumber = '';

  loadUser() async {
    token = await getToken();
    user = await getUser();

    notifyListeners();
  }

  checkUser(String phone) async {
    phoneNumber = phone;
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('${AppURL.baseURL}/users/check?phone=$phone'),
      headers: basicHeader,
    );

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      check = body['check'];

      notifyListeners();
    }
  }

  signupPhone(String phone) async {
    phoneNumber = phone;
    loading = true;
    notifyListeners();

    final response =
        await http.post(Uri.parse('${AppURL.baseURL}/users/signup/phone'),
            headers: basicHeader,
            body: jsonEncode(<String, String>{
              'phone': phone,
            }));

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode != 200) {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  signupCode(String code) async {
    loading = true;
    notifyListeners();

    final response =
        await http.post(Uri.parse('${AppURL.baseURL}/users/signup/code'),
            headers: basicHeader,
            body: jsonEncode(<String, String>{
              'phone': phoneNumber,
              'code': code,
            }));

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      token = body["token"];

      notifyListeners();
    } else {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  signupUsername(String username) async {
    loading = true;
    notifyListeners();

    final response =
        await http.post(Uri.parse('${AppURL.baseURL}/users/signup/username'),
            headers: authHeader(token),
            body: jsonEncode(<String, String>{
              'username': username,
            }));

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      token = body["token"];
      user = UserModel.fromJSON(body["user"]);

      setUser(user, token);

      notifyListeners();
    } else {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  loginPhone(String phone) async {
    phoneNumber = phone;
    loading = true;
    notifyListeners();

    final response =
        await http.post(Uri.parse('${AppURL.baseURL}/users/login/phone'),
            headers: basicHeader,
            body: jsonEncode(<String, String>{
              'phone': phone,
            }));

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode != 200) {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  loginCode(String code) async {
    loading = true;
    notifyListeners();

    final response =
        await http.post(Uri.parse('${AppURL.baseURL}/users/login/code'),
            headers: basicHeader,
            body: jsonEncode(<String, String>{
              'phone': phoneNumber,
              'code': code,
            }));

    loading = false;
    notifyListeners();

    final body = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      token = body['token'];
      user = UserModel.fromJSON(body['user']);

      await setUser(user, token);

      notifyListeners();
    } else {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  loginDemo() async {
    loading = true;
    notifyListeners();

    final response =
        await http.post(Uri.parse('${AppURL.baseURL}/users/login/phone'),
            headers: basicHeader,
            body: jsonEncode(<String, String>{
              'phone': demoPhone,
            }));

    loading = false;
    notifyListeners();

    final body = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      token = body['token'];
      user = UserModel.fromJSON(body['user']);

      await setUser(user, token);

      notifyListeners();
    } else {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  update(String token) async {
    loading = true;
    notifyListeners();

    final response = await http.post(
        Uri.parse('${AppURL.baseURL}/users/update'),
        headers: authHeader(token),
        body: jsonEncode({}));

    loading = false;
    notifyListeners();

    final body = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      token = body['token'];
      user = UserModel.fromJSON(body['user']);

      await setUser(user, token);

      notifyListeners();
    } else {
      errorMessage = body['message'];

      notifyListeners();
    }
  }

  logout() async {
    token = '';
    user = UserModel(
      id: '',
      walletID: '',
      username: '',
      phone: '',
    );

    await removeUser();

    notifyListeners();
  }

  deleteUser() async {
    loading = true;
    notifyListeners();

    final response = await http.delete(
        Uri.parse('${AppURL.baseURL}/users/signup'),
        headers: authHeader(token),
        body: jsonEncode({}));

    loading = false;
    notifyListeners();

    final body = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      await logout();

      notifyListeners();
    } else {
      errorMessage = body['message'];

      notifyListeners();
    }
  }
}
