import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supono/app.dart';
import 'package:supono/app/data/app_query_params.dart';
import 'package:supono/app/injection/injection.dart';
import 'package:supono/bootstrap.dart';
import 'package:supono/data/network/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final prefs = await SharedPreferences.getInstance();
  final userInfo = prefs.getString(AppQueryParams.userInfo);
  User? user;
  try {
    user = User.fromJson(json.decode(userInfo ?? '') as Map<String, dynamic>);
  } catch (e) {
    user = null;
  }

  await bootstrap(() => App(user));
}
