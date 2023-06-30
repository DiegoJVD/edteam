import 'package:first_project/core/controller/persona_controller.dart';
import 'package:first_project/core/models/persona.dart';
import 'package:first_project/ui/pages/second.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FormularioPagina extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioPaginaState();
  }
}

class FormularioPaginaState extends State<FormularioPagina> {
  final _formKey = GlobalKey<FormState>();
  List<String> paises = ['rd', 'colombia', 'chile'];
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late bool seleccionado = false; // Inicialización de la variable seleccionado
  late String carrera = '';
  late String? pais = 'chile';

  final Persona persona = Persona( nombre: 'Jeffry', edad: 20 );

  final hiveStore =  Hive.box('personas');
  late final SharedPreferences preferencesStore;

  void initSharedPreferences()async{
    preferencesStore = await SharedPreferences.getInstance();

    var temp = TextEditingController(text:  preferencesStore.getString('Edad') ?? '');
    setState(() {
    _controller2 = temp;
    });
  }

  @override
  initState() {
    initSharedPreferences();
    _controller = TextEditingController(text: hiveStore.get('Nombre') ?? '');
    _controller2 = TextEditingController(text:  '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 2),
                hintText: 'ej. Jeffry Pajaro',
                labelText: 'Nombre Completo',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ej. 20',
                labelText: 'Edad',
              ),
              onChanged: (valor) {
                print("Esta es mi edad $valor");
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El valor edad es obligatorio';
                }
                return null;
              },
            ),
            ListTile(
              title: Text('Eres nuevo ?'),
              subtitle: Text('selecciona si eres nuevo'),
              leading: Checkbox(
                value: seleccionado,
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      seleccionado = value;
                    }
                  });
                },
              ),
            ),
            const Text('Carreras'),
            ListTile(
              title: const Text('Informatica'),
              trailing: Radio(
                groupValue: carrera,
                value: 'informatica',
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      carrera = value;
                    }
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Informatica'),
              trailing: Radio(
                groupValue: carrera,
                value: 'Electronica',
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      carrera = value;
                    }
                  });
                },
              ),
            ),
            DropdownButton<String>(
              value: pais,
              items: paises.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  if (value != null) {
                    pais = value;
                  }
                });
              },
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (carrera == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Selecionauna carrera')));
                        }
                        hiveStore.put('Nombre', _controller.text);
                        hiveStore.put('Edad', _controller2.text);

                        preferencesStore.setString('Edad', _controller2.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Formulario correctamente')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Formulario no correctamente')));
                      }
                    },
                    child: Text('Validar')),
                OutlinedButton(onPressed: () {}, child: const Text('Primero')),
                ElevatedButton(
                    onPressed: () {

                      final controller = PersonaController(persona: persona);
                      controller.cambiarNombre('Jeffry Pajaro');
                      //mandar con la persona como parametro 
                      Navigator.pushNamed(context, 'second', arguments: SecondPageArguments(usuario: persona));
                      // Navigator.pushNamed(context, 'second');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SecondPage(
                      //           usuario: persona,
                      //         )
                      //     )
                      // );
                    },  
                    child: const Text('Primero')),
                GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('CUarto'),
                    ),
                    onTap: () {
                      setState(() {
                        persona.nombre = _controller.text;
                        persona.edad = int.parse(_controller2.text);
                      });
                    },
                    onDoubleTap: () {
                      print('Presionado doble');
                    },
                    onLongPress: () {
                      print('Presionado largo');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    hiveStore.close();
    super.dispose();
  }
}
