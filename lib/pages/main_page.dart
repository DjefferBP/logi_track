import 'package:flutter/material.dart';
import 'package:logi_track/color.dart';
import '../widgets/viagem_atual_card.dart';
import 'package:logi_track/pages/entregas_page.dart';
import 'package:logi_track/widgets/scaffold_padrao.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      titulo: Text(
        "Olá, [Driver Name]",
        style: TextStyle(color: Colors.white, fontSize: 35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ViagemAtualCard(
            titulo: "Viagem Atual",
            placaCaminhao: "PLACA-XYZ-123",
            proximaParada: "BAIRRO/LOCAL",
            nomeMotorista: "CAIO",
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,

            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RomaneioPage()),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(30),
                ),
              ),
              label: Text("Ver Romaneios"),
              icon: Icon(Icons.add, size: 40),
              iconAlignment: IconAlignment.start,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Minhas Cargas",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task_sharp,
                            color: Cor.primaryColor,
                            size: 50,
                          ),
                          Text(
                            "Check in\nde Carga",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Cor.primaryColor,
                            size: 50,
                          ),
                          Text(
                            "Histórico de \nEntregas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
