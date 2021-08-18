class Powerstats {
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  Powerstats(
      {required this.intelligence,
      required this.strength,
      required this.speed,
      required this.durability,
      required this.power,
      required this.combat});

  factory Powerstats.fromJson(Map<String, dynamic> json) {
    return Powerstats(
      intelligence: json['intelligence'],
      strength: json['strength'],
      speed: json['speed'],
      durability: json['durability'],
      power: json['power'],
      combat: json['combat'],
    );
  }
}
