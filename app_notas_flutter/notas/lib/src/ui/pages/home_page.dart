import "package:flutter/material.dart";
import 'package:notas/src/core/controllers/theme_controller.dart';
import 'package:notas/src/ui/config.dart';
import 'package:notas/src/ui/widgets/buttons/card_button.dart';
import 'package:notas/src/ui/widgets/buttons/simple_buttons.dart';
import 'package:notas/src/ui/widgets/text_inputs/text_inputs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

GlobalKey<ScaffoldState> HomePageKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const Home_Page_Route = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController(text: "");

  // @override
  // void initState() {
  //   _controller = TextEditingController(text: "");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ThemeController.instance.light,
        builder: (BuildContext context, value, Widget? child) {
          final theme = ThemeController.instance;
          return Scaffold(
            
            backgroundColor: theme.background(),
            key: HomePageKey,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                child: Center(
                  child: Text(
                    "Hola Mundo",
                    style: TextStyle(
                      color: theme.primary(),
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
              ElevatedButton(
                onPressed: () => theme.changetheme(), child: Text("Cambiar tema"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryButton(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                )
                ),
              ElevatedButton(onPressed: () async {
                if(await canLaunchUrlString('https://www.google.com/')){
                  await launchUrlString('https://www.google.com/' );
                }
              }, child: Text('URL')),
              MediumButton(
                title: "Hola",
                onTap: () => {},
              ),
              CardButton(
                title: "Hola",
                onTap: () => {
                  
                },
                icon: Icons.add,
              ),
              TextButton(onPressed: () => {
                print("asjldfblasd"),
                  print(_controller.text)
              }, child: Text("Hola")),
              TextInput(title: "Titulo", controller: _controller,)
            ],)
          );
        });
  }
}
