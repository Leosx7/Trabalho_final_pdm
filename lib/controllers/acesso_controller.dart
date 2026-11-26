// Nesta etapa, o controlador valida campos. Não autentica usuários.
class AcessoController {
  static String? validarNome(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'Informe seu nome.';
    return null;
  }

  static String? validarEmail(String? valor) {
    final email = valor?.trim() ?? '';
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return 'Informe um e-mail válido.';
    }
    return null;
  }

  static String? validarSenha(String? valor) {
    if (valor == null || valor.length < 6) {
      return 'Use pelo menos 6 caracteres.';
    }
    return null;
  }
}
