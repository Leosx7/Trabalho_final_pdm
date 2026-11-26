import 'package:flutter_test/flutter_test.dart';
import 'package:treino_em_dia/controllers/acesso_controller.dart';

void main() {
  test('Valida nome, e-mail e senha', () {
    expect(AcessoController.validarNome(' '), isNotNull);
    expect(AcessoController.validarNome('Alex'), isNull);
    expect(AcessoController.validarEmail('alex'), isNotNull);
    expect(AcessoController.validarEmail('alex@email.com'), isNull);
    expect(AcessoController.validarSenha('123'), isNotNull);
    expect(AcessoController.validarSenha('123456'), isNull);
  });
}
