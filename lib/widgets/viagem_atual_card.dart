import 'package:flutter/material.dart';
import 'package:logi_track/color.dart';

class ViagemAtualCard extends StatelessWidget {
  final String titulo;
  final String placaCaminhao;
  final String proximaParada;
  final String nomeMotorista;

  const ViagemAtualCard({
    super.key,
    required this.titulo,
    required this.placaCaminhao,
    required this.proximaParada,
    required this.nomeMotorista,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      color: Colors.white,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              titulo,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.car_crash_outlined,
                  size: 50,
                  color: Cor.primaryColor,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Caminhão placa: [$placaCaminhao]",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Próxima parada: [$proximaParada]",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12),
            Divider(color: Colors.grey),
            SizedBox(height: 12),

            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(backgroundColor: Colors.grey),
                ),
                SizedBox(width: 15),
                Text(
                  nomeMotorista,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
