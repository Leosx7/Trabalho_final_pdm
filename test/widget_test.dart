import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treino_em_dia/main.dart';

void main() {
  testWidgets('Login demonstra validação e permite abrir a prévia', (tester) async {
    await tester.pumpWidget(const TreinoEmDiaApp());
    await tester.pumpAndSettle();
    final entrar = find.widgetWithText(FilledButton, 'Entrar');
    await tester.ensureVisible(entrar);
    await tester.tap(entrar);
    await tester.pumpAndSettle();
    expect(find.text('Informe um e-mail válido.'), findsOneWidget);
    final previa = find.text('Visualizar protótipo sem login');
    await tester.ensureVisible(previa);
    await tester.tap(previa);
    await tester.pumpAndSettle();
    expect(find.text('Olá, Alex!'), findsOneWidget);
    await tester.tap(find.text('Treinos'));
    await tester.pumpAndSettle();
    expect(find.text('Em desenvolvimento'), findsOneWidget);
  });
}
