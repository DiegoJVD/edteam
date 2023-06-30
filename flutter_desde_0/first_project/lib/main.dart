import 'package:first_project/ui/pages/fist.dart';
import 'package:first_project/ui/pages/second.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('personas');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '': (context) => FormularioPagina(),
        'second': (context) => SecondPage(),
      },
      home: Scaffold(
        body: Center(
          child: FormularioPagina(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Formularios'),
            ],
          ),
        ),
      ),
    );
  }
}
