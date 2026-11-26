import 'package:flutter/material.dart';
import '../../controllers/acesso_controller.dart';
import '../../utils/tema.dart';
import '../components/componentes.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});
  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final formulario = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();

  void cadastrar() {
    if (!formulario.currentState!.validate()) return;
    // TODO etapa 2: criar conta e perfil no Firebase.
    avisarPendente(context, 'Campos válidos. Cadastro Firebase pendente.');
  }

  @override
  void dispose() {
    nome.dispose();
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: ConteudoPagina(
        child: Form(key: formulario, child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Comece a organizar sua rotina.',
              style: TextStyle(color: textoSecundario, fontSize: 16)),
            const SizedBox(height: 28),
            CampoAcesso(rotulo: 'Nome', dica: 'Seu nome', controlador: nome,
              validar: AcessoController.validarNome),
            CampoAcesso(rotulo: 'E-mail', dica: 'voce@email.com', controlador: email,
              teclado: TextInputType.emailAddress, validar: AcessoController.validarEmail),
            CampoAcesso(rotulo: 'Senha', dica: 'Mínimo de 6 caracteres', controlador: senha,
              senha: true, validar: AcessoController.validarSenha),
            const SizedBox(height: 12),
            FilledButton(onPressed: cadastrar, child: const Text('Cadastrar')),
            TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Já tem conta? Entrar')),
          ],
        )),
      ),
    );
  }
}
