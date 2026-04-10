import '../color.dart';
import '../widgets/entrega_card.dart';
import 'package:flutter/material.dart';
import '../widgets/scaffold_padrao.dart';

class RomaneioPage extends StatefulWidget {
  final VoidCallback onBack;
  const RomaneioPage({super.key, required this.onBack});

  @override
  State<RomaneioPage> createState() => _RomaneioPageState(onBack: onBack);
}

class _RomaneioPageState extends State<RomaneioPage> {
  final VoidCallback onBack;
  _RomaneioPageState({required this.onBack});

  final TextEditingController _controller = TextEditingController();

  final List<Map<String, String>> todasEntregas = [
    {"cliente": "João", "bairro": "Centro", "status": "A"},
    {"cliente": "Maria", "bairro": "Zona 7", "status": "B"},
    {"cliente": "Carlos", "bairro": "Jd Alvorada", "status": "C"},
    {"cliente": "Ana", "bairro": "Centro", "status": "D"},
    {"cliente": "Rafael", "bairro": "Zona 2", "status": "E"},
  ];

  List<Map<String, String>> entregasFiltradas = [];

  @override
  void initState() {
    super.initState();
    entregasFiltradas = todasEntregas;
  }

  void filtrar(String texto) {
    setState(() {
      entregasFiltradas = todasEntregas.where((entrega) {
        return entrega['cliente']!.toLowerCase().contains(
              texto.toLowerCase(),
            ) ||
            entrega['bairro']!.toLowerCase().contains(texto.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      onBack: onBack,
      titulo: Text(
        "Romaneio Digital - \nViagem Número-XYZ",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      acoes: true,
      iconCanto: Icons.arrow_back,
      corIconAcoes: Colors.white,
      corIconCanto: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Minhas Entregas",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),

          TextField(
            controller: _controller,
            onChanged: filtrar,
            decoration: InputDecoration(
              hintText: "Buscar por cliente ou bairro...",
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          SizedBox(height: 10),

          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: entregasFiltradas.length,
              itemBuilder: (context, index) {
                final entrega = entregasFiltradas[index];
                return EntregaCard(
                  cliente: entrega['cliente']!,
                  bairro: entrega['bairro']!,
                  status: entrega['status']!,
                );
              },
            ),
          ),

          SizedBox(height: 10),

          Center(
            child: Text(
              "Total de entregas: ${entregasFiltradas.length}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Cor.primaryColor,
              ),
            ),
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
