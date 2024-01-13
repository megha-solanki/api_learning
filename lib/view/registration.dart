import 'package:api_learning/api/auth.dart';
import 'package:api_learning/widgets/custom_button.dart';
import 'package:api_learning/widgets/custom_textformfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
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
                      "Welcome",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                      label: "Name",
                      hintText: "Enter your name",
                      controller: txtName,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        }
                      },
                      keyboardType: TextInputType.text),
                  const SizedBox(height: 20),
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
                          "name": txtName.text,
                          "email": txtEmail.text,
                          "password": txtPassword.text,
                          "avatar": "https://picsum.photos/800"
                        };
                        if (kDebugMode) {
                          print("$data");
                        }
                        registration(data: data);
                      },
                      label: "Registration")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
