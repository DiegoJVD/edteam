import 'package:final_project/ui/pages/email_login_page.dart';
import 'package:final_project/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/logo.png", width: 150, height: 150),
                Column(
                  children: [
                    const Text("Bienvenido",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const Text("Inicia sesión para continuar",
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    SizedBox(height: 100),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      text: "Iniciar sesión con Google",
                      textColor: Colors.black,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      text: "Iniciar sesión con Facebook",
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailLoginPage()));
                      },
                      child: Text("Iniciar sesión con correo electrónico",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue[700],
                              decoration: TextDecoration.underline)),
                    ),
                    SizedBox(height: 10),
                    Text('o'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text("Crear cuenta",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue[700],
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
              ]),)
        )
        );
  }
}
