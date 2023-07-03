import 'dart:ffi';

import 'package:final_project/ui/pages/remember_password.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final baseUrl = "https://test-usuarios.herokuapp.com/api";

  @override
  initState() {
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 40),
                    Image.asset("assets/logo.png", width: 150, height: 150),
                    Text("Iniciar sesión",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Correo electrónico"),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? "Campo requerido" : null,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Contraseña"),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? "Campo requerido" : null,
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RememberPassword()));
                              },
                              child: Text("Olvide mi contraseña",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue[700],
                                      decoration: TextDecoration.underline)),
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final uri = Uri.parse("$baseUrl/login");
                                  final response = await http.post(uri, body: {
                                    "email": _emailController.value.text,
                                    "password": _passwordController.value.text
                                  });
                                  print(response.statusCode);
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text("Iniciar sesión",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ],
                        ))
                  ]),
            )));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
