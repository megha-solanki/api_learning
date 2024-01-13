import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/contact.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Original Contact Data: ${contactData.length}");
    }
    Set<Contacts> uniqueContactsSet = contactData.toSet();
    if (kDebugMode) {
      print("Unique Contacts Set: ${uniqueContactsSet.length}");
    }
    return Scaffold(body: SizedBox());
  }
}
