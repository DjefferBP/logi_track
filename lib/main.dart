import 'package:flutter/material.dart';
import 'package:logi_track/color.dart';
import 'package:logi_track/pages/home_page.dart';
// ignore_for_file: library_private_types_in_public_api


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Cor.scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Cor.primaryColor),
        primaryColor: Cor.primaryColor,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final idVeiculoController = TextEditingController();
  final codigoMotoristaController = TextEditingController();

  void validarCampos() {
    if (!formkey.currentState!.validate()) return;
    if (idVeiculoController.text.isEmpty ||
        codigoMotoristaController.text.isEmpty)return;
      

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGITRACK',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text("ID do Veículo (Número)", style: TextStyle(fontSize: 18)),
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: idVeiculoController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Digite o id do veículo!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.car_crash_outlined,
                          color: Cor.primaryColor,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Cor.primaryColor,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Cor.primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Código do Motorista (Senha)",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: codigoMotoristaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Digite o código do motorista!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Cor.primaryColor),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Cor.primaryColor,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Cor.primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: validarCampos,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Cor.primaryColor,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                        ),
                        child: Text("Acessar Frota"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Problemas no acesso?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Registrar novo motorista",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
