import 'dart:math';

import 'package:api_learning/api/auth.dart';
import 'package:api_learning/model/auth_model.dart';
import 'package:api_learning/shared_prefs/shared_prefs.dart';
import 'package:api_learning/view/home.dart';
import 'package:api_learning/widgets/custom_button.dart';
import 'package:api_learning/widgets/custom_textformfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Text(
                      "Welcome Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                      label: "Email",
                      hintText: "Enter your email",
                      controller: txtEmail,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        }
                      },
                      keyboardType: TextInputType.text),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                      label: "Password",
                      hintText: "Enter your password",
                      controller: txtPassword,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Password is required";
                        }
                      },
                      keyboardType: TextInputType.text),
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  CustomButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "email": txtEmail.text,
                          "password": txtPassword.text,
                        };
                        if (kDebugMode) {
                          print("$data");
                        }
                        login(data: data).then((value) async {
                          savePreference(value!).then((value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                                (route) => false);
                          });
                        });
                      },
                      label: "Login")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> savePreference(AuthModel value) async {
  try {
    await Prefs.setString("access_token", value.accessToken);
    await Prefs.setString("refresh_token", value.refreshToken);
    return true;
  } catch (e) {
    return false;
  }
}
