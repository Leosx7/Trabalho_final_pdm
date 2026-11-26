String dataPorExtenso(DateTime data) {
  const dias = ['Segunda-feira', 'Terça-feira', 'Quarta-feira',
    'Quinta-feira', 'Sexta-feira', 'Sábado', 'Domingo'];
  const meses = ['janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
    'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro'];
  return '${dias[data.weekday - 1]}, ${data.day} de ${meses[data.month - 1]}';
}
