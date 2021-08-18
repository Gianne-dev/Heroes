class Appearance {
  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  Appearance(
      {required this.gender,
      required this.race,
      required this.height,
      required this.weight,
      required this.eyeColor,
      required this.hairColor});

  factory Appearance.fromJson(Map<String, dynamic> json) {
    return Appearance(
        gender: json['gender'],
        race: json['race'],
        height: json['height'].cast<String>(),
        weight: json['weight'].cast<String>(),
        eyeColor: json['eye-color'],
        hairColor: json['hair-color']);
  }
}
