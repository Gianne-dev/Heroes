class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  Biography(
      {required this.fullName,
      required this.alterEgos,
      required this.aliases,
      required this.placeOfBirth,
      required this.firstAppearance,
      required this.publisher,
      required this.alignment});

  factory Biography.fromJson(Map<String, dynamic> json) {
    return Biography(
      fullName: json['full-name'],
      alterEgos: json['alter-egos'],
      aliases: json['aliases'].cast<String>(),
      placeOfBirth: json['place-of-birth'],
      firstAppearance: json['first-appearance'],
      publisher: json['publisher'],
      alignment: json['alignment'],
    );
  }
}
