import 'package:flutter/material.dart';
import '../../controllers/acesso_controller.dart';
import '../../utils/tema.dart';
import '../components/componentes.dart';
import '../principal_view.dart';
import 'cadastro_view.dart';
import 'recuperacao_view.dart';

class AcessoView extends StatefulWidget {
  const AcessoView({super.key});
  @override
  State<AcessoView> createState() => _AcessoViewState();
}

class _AcessoViewState extends State<AcessoView> {
  final formulario = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  void entrar() {
    if (!formulario.currentState!.validate()) return;
    // TODO etapa 2: chamar Firebase Authentication e tratar erros.
    avisarPendente(context, 'Campos válidos. Login Firebase ainda não integrado.');
  }

  @override
  void dispose() {
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConteudoPagina(
        child: Form(
          key: formulario,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Center(child: Marca()),
              const SizedBox(height: 20),
              const Text('treino em dia', textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Entre na sua conta', textAlign: TextAlign.center,
                style: TextStyle(color: textoSecundario, fontSize: 16)),
              const SizedBox(height: 28),
              CampoAcesso(rotulo: 'E-mail', dica: 'voce@email.com',
                controlador: email, teclado: TextInputType.emailAddress,
                validar: AcessoController.validarEmail),
              CampoAcesso(rotulo: 'Senha', dica: 'Sua senha', controlador: senha,
                senha: true, validar: AcessoController.validarSenha),
              Align(alignment: Alignment.centerRight,
                child: TextButton(onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RecuperacaoView())),
                  child: const Text('Esqueci minha senha'))),
              FilledButton(onPressed: entrar, child: const Text('Entrar')),
              const SizedBox(height: 12),
              OutlinedButton(onPressed: () => avisarPendente(context,
                'Login com Google será integrado na etapa 2.'),
                child: const Text('G   Continuar com Google')),
              TextButton(onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CadastroView())),
                child: const Text('Criar uma conta')),
              const Divider(),
              // A demonstração não representa uma sessão autenticada.
              TextButton(onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PrincipalView())),
                child: const Text('Visualizar protótipo sem login')),
              const Text('Modo demonstração • autenticação pendente',
                textAlign: TextAlign.center,
                style: TextStyle(color: textoSecundario, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
