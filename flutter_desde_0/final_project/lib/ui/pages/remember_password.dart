import 'package:flutter/material.dart';

class RememberPassword extends StatefulWidget {
  const RememberPassword({super.key});

  @override
  State<RememberPassword> createState() => _RememberPasswordState();
}

class _RememberPasswordState extends State<RememberPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
                child: Column(children: [
              Image.asset("assets/logo.png", width: 150, height: 150),
              const Text("Recuperar contraseña",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Correo electrónico"),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {},
                child: const Text("Enviar correo",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Regresar al inicio de sesión"))
            ]))));
  }
}
