import 'package:sami_project/models/appearance.dart';
import 'package:sami_project/models/biography.dart';
import 'package:sami_project/models/connections.dart';
import 'package:sami_project/models/image.dart';
import 'package:sami_project/models/powerstats.dart';
import 'package:sami_project/models/work.dart';

class HeroCharacter {
  final String response;
  final String? id;
  final String? name;
  final Powerstats? powerstats;
  final Appearance? appearance;
  final Biography? biography;
  final Work? work;
  final Connections? connections;
  final Image image;

  HeroCharacter(
      {required this.response,
      required this.id,
      required this.name,
      required this.powerstats,
      required this.appearance,
      required this.biography,
      required this.work,
      required this.connections,
      required this.image});

  factory HeroCharacter.fromJson(Map<String, dynamic> json) {
    return HeroCharacter(
      response: json['response'] ?? '',
      id: json['id'],
      name: json['name'],
      powerstats: Powerstats.fromJson(json['powerstats']),
      appearance: Appearance.fromJson(json['appearance']),
      biography: Biography.fromJson(json['biography']),
      work: Work.fromJson(json['work']),
      connections: Connections.fromJson(json['connections']),
      image: Image.fromJson(json['image']),
    );
  }
}
