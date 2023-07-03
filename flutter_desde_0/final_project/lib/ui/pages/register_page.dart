import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nombresController;
  late TextEditingController _primerApellidoController;
  late TextEditingController _segundoApellidoController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nacimientoController;
  late TextEditingController _empresaController;

  @override
  initState() {
    _nombresController = TextEditingController(text: '');
    _primerApellidoController = TextEditingController(text: '');
    _segundoApellidoController = TextEditingController(text: '');
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _confirmPasswordController = TextEditingController(text: '');
    _nacimientoController = TextEditingController(text: '');
    _empresaController = TextEditingController(text: '');
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
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Image.asset("assets/logo.png", width: 150, height: 150),
              Text("Crear cuenta",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nombresController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          label: Text("Nombres*"),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Campo requerido" : null,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _primerApellidoController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                label: Text("P. Apellido*"),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? "Campo requerido" : null,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              controller: _segundoApellidoController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                label: Text("S. Apellido"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Email*"),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Campo requerido" : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Password*"),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Campo requerido" : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Confirmar password*"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo requerido";
                            }

                            if (value != _passwordController.text) {
                              return "Las contraseñas no coinciden";
                            }

                            return null;
                          }),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _nacimientoController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(),
                                label: Text("Fecha de nacimiento"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              controller: _empresaController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Empresa"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text("Crear cuenta",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ],
                  ))
            ],
          )),
        ));
  }
}
