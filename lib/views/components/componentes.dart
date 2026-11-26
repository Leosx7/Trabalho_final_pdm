import 'package:flutter/material.dart';
import '../../utils/tema.dart';

// Área centralizada e rolável: funciona em telas estreitas e largas.
class ConteudoPagina extends StatelessWidget {
  final Widget child;
  const ConteudoPagina({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: child,
            ),
          ),
      ),
    );
  }
}

class Marca extends StatelessWidget {
  const Marca({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        color: verdeClaro,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(Icons.fitness_center, size: 38, color: verdeEscuro),
    );
  }
}

class CampoAcesso extends StatelessWidget {
  final String rotulo;
  final String dica;
  final bool senha;
  final TextEditingController controlador;
  final String? Function(String?) validar;
  final TextInputType teclado;

  const CampoAcesso({super.key, required this.rotulo, required this.dica,
    required this.controlador, required this.validar, this.senha = false,
    this.teclado = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controlador,
        obscureText: senha,
        keyboardType: teclado,
        validator: validar,
        decoration: InputDecoration(labelText: rotulo, hintText: dica),
      ),
    );
  }
}

void avisarPendente(BuildContext context, String mensagem) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
}
