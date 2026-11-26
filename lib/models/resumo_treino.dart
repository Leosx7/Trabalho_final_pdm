// Modelo mínimo para o card da Home. O módulo de dados poderá substituí-lo
// por uma ficha carregada do Firestore.
class ResumoTreino {
  final String titulo;
  final int quantidadeExercicios;

  const ResumoTreino({required this.titulo, required this.quantidadeExercicios});
}
