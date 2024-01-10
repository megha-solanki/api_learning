import 'package:api_learning/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController txtEmail=TextEditingController();
  TextEditingController txtPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextFormField(
              label: "Email",
              hintText: "Enter your email",
              controller: txtEmail,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Employee name is required";
                }
              },
              keyboardType: TextInputType.text),
        ],
      ),
    );
  }
}
