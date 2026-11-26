import 'package:flutter/material.dart';
import '../utils/tema.dart';
import 'components/componentes.dart';

// TODO: substituir esta tela pelo módulo indicado no README.
class TreinosView extends StatelessWidget {
  const TreinosView({super.key});
  @override
  Widget build(BuildContext context) {
    return ConteudoPagina(child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text('Meus treinos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 32),
        Icon(Icons.fitness_center, size: 60, color: verdePrincipal),
        SizedBox(height: 16),
        Text('Em desenvolvimento', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Fichas, exercícios, séries, repetições e cargas serão implementados na etapa 2.', textAlign: TextAlign.center),
      ],
    ));
  }
}
