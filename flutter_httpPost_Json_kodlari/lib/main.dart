import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odev3/userModel.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Odev3",
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

Future<UserModel> createUser(int brandID, String name, String phoneNumber,
    String email, String message) async {
  final String url = "https://kitapbulal.com/api/contact/add";

  var json = {
    'brandID': 5,
    'name': name,
    'phoneNumber': phoneNumber,
    'email': email,
    'message': message,
  };

  print(json);

  var response = await http.post(
    url,
    body: jsonEncode(json),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(response);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("başarısız");
  }

  return UserModel.fromJson(json);
}

class _AnaSayfaState extends State<AnaSayfa> {
  UserModel userr;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController mesajController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: phoneController,
            ),
            TextField(
              controller: mailController,
            ),
            TextField(
              controller: mesajController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String phone = phoneController.text;
          final String mail = mailController.text;
          final String mesaj = mesajController.text;

          final UserModel user = await createUser(5, name, phone, mail, mesaj);

          setState(() {
            userr = user;
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
