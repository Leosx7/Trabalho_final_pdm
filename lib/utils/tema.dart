import 'package:flutter/material.dart';

// Cores aproximadas das telas do protótipo.
const verdeEscuro = Color(0xFF12372F);
const verdePrincipal = Color(0xFF14775E);
const verdeClaro = Color(0xFFB6EA80);
const verdeSuave = Color(0xFFE4F1E7);
const fundoCard = Color(0xFFF3F5F1);
const textoSecundario = Color(0xFF50645D);

ThemeData criarTema() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: verdePrincipal,
      primary: verdePrincipal,
      surface: Colors.white,
      onSurface: verdeEscuro,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: verdeEscuro,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD2DDD5)),
      ),
      contentPadding: const EdgeInsets.all(16),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        backgroundColor: verdePrincipal,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: verdeSuave,
    ),
  );
}
