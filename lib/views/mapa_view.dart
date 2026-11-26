import 'package:flutter/material.dart';
import '../utils/tema.dart';
import 'components/componentes.dart';

// TODO: substituir esta tela pelo módulo indicado no README.
class MapaView extends StatelessWidget {
  const MapaView({super.key});
  @override
  Widget build(BuildContext context) {
    return ConteudoPagina(child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text('Academias', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 32),
        Icon(Icons.place_outlined, size: 60, color: verdePrincipal),
        SizedBox(height: 16),
        Text('Em desenvolvimento', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Google Maps, busca de academias e rotas serão implementados na etapa 3.', textAlign: TextAlign.center),
      ],
    ));
  }
}
