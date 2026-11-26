import 'package:flutter/material.dart';
import 'inicio_view.dart';
import 'treinos_view.dart';
import 'refeicoes_view.dart';
import 'mapa_view.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});
  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  int abaAtual = 0;

  void abrirAba(int indice) {
    setState(() => abaAtual = indice);
  }

  @override
  Widget build(BuildContext context) {
    // Os módulos seguintes serão implementados em arquivos separados.
    final paginas = [InicioView(abrirAba: abrirAba), const TreinosView(),
      const RefeicoesView(), const MapaView()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('treino em dia', style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [IconButton(tooltip: 'Sair da demonstração',
          onPressed: () => Navigator.pop(context), icon: const Icon(Icons.logout))],
      ),
      body: IndexedStack(index: abaAtual, children: paginas),
      bottomNavigationBar: NavigationBar(
        selectedIndex: abaAtual,
        onDestinationSelected: abrirAba,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Treinos'),
          NavigationDestination(icon: Icon(Icons.restaurant), label: 'Refeições'),
          NavigationDestination(icon: Icon(Icons.place_outlined), label: 'Mapa'),
        ],
      ),
    );
  }
}
