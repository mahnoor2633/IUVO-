import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/get_start_screen/report_your_issue_screen.dart';
import 'package:iuvo/view/main_screen/main_screen.dart';
import 'package:iuvo/view/signUp_screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    String? password = prefs.getString("password");
    if (email.toString() != "null" && password.toString() != "null") {
      Get.to(const MainScreen());
    } else {
      Timer(Duration(seconds: 2),()=>Get.to(const ReportYourIssueScreen()));
    }
  }

  @override
  void initState() {getLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
              'assets/gif/iUVo.gif'
          ),
        ),
      ),
    );
  }
}
