import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/tema.dart';
import 'views/auth/acesso_view.dart';

void main() => runApp(const TreinoEmDiaApp());

class TreinoEmDiaApp extends StatelessWidget {
  const TreinoEmDiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treino em Dia',
      debugShowCheckedModeBanner: false,
      theme: criarTema(),
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: const AcessoView(),
    );
  }
}
