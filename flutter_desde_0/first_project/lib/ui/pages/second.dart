import 'package:first_project/core/models/persona.dart';
import 'package:flutter/material.dart';

class SecondPageArguments {
  final Persona? usuario;
  SecondPageArguments({this.usuario});
}

class SecondPage extends StatefulWidget {
  final Persona? usuario;
  const SecondPage({super.key, this.usuario});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    SecondPageArguments args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as SecondPageArguments;
    } else {
      args = SecondPageArguments();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('second'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                    image: AssetImage('assets/perrito.jpg'),
                    // image: NetworkImage('https://www.farmaciacinca.es/wp-content/uploads/2022/12/Periquitos-Periquitos-australianos-Aprende-sobre-la-naturaleza.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Nombre: ${args.usuario?.nombre}'),
              Text('Edad: ${args.usuario?.edad}'),
              const SizedBox(height: 20),
              Container(
                height: 300,
                width: 300,
                child: Image.asset('assets/gatito.jpg', fit: BoxFit.cover),
              ),

              // Text('Nombre: ${widget.usuario?.nombre}'),
              // Text('Edad: ${widget.usuario?.edad}'),
            ],

            // child: ElevatedButton(
            //   onPressed: () {
            //     // Navigate to the second screen using a named route.
            //     Navigator.pushNamed(context, '/second');
            //   },
            //   child: const Text('Launch screen'),
            // ),
          ),
        ));
  }
}
