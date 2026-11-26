import 'package:flutter/material.dart';
import '../models/resumo_treino.dart';
import '../utils/formatadores.dart';
import '../utils/tema.dart';
import 'components/componentes.dart';

class InicioView extends StatelessWidget {
  final ValueChanged<int> abrirAba;
  const InicioView({super.key, required this.abrirAba});

  @override
  Widget build(BuildContext context) {
    // Dados do protótipo, não dados reais de um usuário.
    const treino = ResumoTreino(titulo: 'Costas e bíceps', quantidadeExercicios: 3);
    return ConteudoPagina(child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Olá, Alex!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(dataPorExtenso(DateTime.now()), style: const TextStyle(color: textoSecundario)),
        const SizedBox(height: 24),
        Card(
          color: verdeEscuro,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => abrirAba(1),
            child: Padding(padding: const EdgeInsets.all(22), child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('SEU TREINO DE HOJE', style: TextStyle(color: verdeClaro,
                  fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 14),
                Text(treino.titulo, style: const TextStyle(color: Colors.white,
                  fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(child: Text('${treino.quantidadeExercicios} exercícios • Ver ficha',
                    style: const TextStyle(color: Colors.white))),
                  const Icon(Icons.arrow_forward, color: verdeClaro),
                ]),
              ],
            )),
          ),
        ),
        const SizedBox(height: 24),
        const Text('Sua rotina', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _cardRotina('Meus treinos', 'Organize suas fichas', Icons.fitness_center, 1),
        const SizedBox(height: 12),
        _cardRotina('Diário alimentar', 'Registre suas refeições', Icons.restaurant, 2),
        const SizedBox(height: 24),
        const Text('Prévia com dados de exemplo', style: TextStyle(color: textoSecundario, fontSize: 12)),
      ],
    ));
  }

  Widget _cardRotina(String titulo, String subtitulo, IconData icone, int aba) {
    return Card(color: fundoCard, elevation: 0, margin: EdgeInsets.zero,
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: Container(padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: verdeSuave, borderRadius: BorderRadius.circular(12)),
          child: Icon(icone, color: verdePrincipal)),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitulo),
        onTap: () => abrirAba(aba),
      ));
  }
}
