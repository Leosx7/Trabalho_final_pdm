import 'package:flutter/material.dart';
import '../../controllers/acesso_controller.dart';
import '../../utils/tema.dart';
import '../components/componentes.dart';

class RecuperacaoView extends StatefulWidget {
  const RecuperacaoView({super.key});
  @override
  State<RecuperacaoView> createState() => _RecuperacaoViewState();
}

class _RecuperacaoViewState extends State<RecuperacaoView> {
  final formulario = GlobalKey<FormState>();
  final email = TextEditingController();

  void enviarLink() {
    if (!formulario.currentState!.validate()) return;
    // TODO etapa 2: enviar e-mail de recuperação pelo Firebase.
    avisarPendente(context, 'Recuperação de senha ainda não integrada. Nenhum e-mail enviado.');
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar senha')),
      body: ConteudoPagina(child: Form(key: formulario, child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Center(child: Icon(Icons.lock_reset, size: 72, color: verdePrincipal)),
          const SizedBox(height: 24),
          const Text('Esqueceu a senha?', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Informe seu e-mail para redefinir sua senha.',
            textAlign: TextAlign.center, style: TextStyle(color: textoSecundario)),
          const SizedBox(height: 32),
          CampoAcesso(rotulo: 'E-mail', dica: 'voce@email.com', controlador: email,
            teclado: TextInputType.emailAddress, validar: AcessoController.validarEmail),
          FilledButton(onPressed: enviarLink, child: const Text('Enviar link')),
          TextButton(onPressed: () => Navigator.pop(context),
            child: const Text('Voltar para o login')),
        ],
      ))),
    );
  }
}
