class Exam {
  final String imeNaPredmet;
  final DateTime datumIVreme;
  final List<String> prostorii;

  const Exam({
    required this.imeNaPredmet,
    required this.datumIVreme,
    required this.prostorii,
  });

  bool get ePominat => datumIVreme.isBefore(DateTime.now());
}