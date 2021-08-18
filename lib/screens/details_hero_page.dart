import 'package:flutter/material.dart';
import 'package:sami_project/models/hero_character.dart';

class DetailPage extends StatelessWidget {
  final HeroCharacter hero;
  const DetailPage({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black));
        }),
        backgroundColor: Colors.white,
        title: Text(hero.name!, style: const TextStyle(color: Colors.black)),
      ),
      body: heroDetails(context),
    );
  }

  heroDetails(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Hero(
                tag: hero.id!,
                child: CircleAvatar(
                    maxRadius: 50.0,
                    backgroundImage: NetworkImage((hero.image.url)))),
            Text(hero.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
            Text(hero.biography!.fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 30.0,
            ),
            const Text('Biography',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10.0,
            ),
            informationHero(
              'FULL NAME: ' +
                  hero.biography!.fullName +
                  '\n\nALTER EGOS: ' +
                  hero.biography!.alterEgos +
                  '\n\nALIASES: ' +
                  (hero.biography!.aliases).toString() +
                  '\n\nPLACE OF BIRTH: ' +
                  hero.biography!.placeOfBirth +
                  '\n\nFIRST APPEARANCE: ' +
                  hero.biography!.firstAppearance +
                  '\n\nPUBLISHER: ' +
                  hero.biography!.publisher +
                  '\n\nALIGNMENT: ' +
                  hero.biography!.alignment,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Appearance',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10.0,
            ),
            informationHero(
              'GENDER: ' +
                  hero.appearance!.gender +
                  '\n\nRACE: ' +
                  hero.appearance!.race +
                  '\n\nHEIGHT: ' +
                  (hero.appearance!.height).toString() +
                  '\n\nWEIGHT: ' +
                  (hero.appearance!.weight).toString() +
                  '\n\nEYE COLOR: ' +
                  hero.appearance!.eyeColor +
                  '\n\nHAIR COLOR: ' +
                  hero.appearance!.hairColor,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Powerstats',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10.0,
            ),
            informationHero(
              'INTELLIGENCE: ' +
                  hero.powerstats!.intelligence +
                  '\n\nSTRENGTH: ' +
                  hero.powerstats!.strength +
                  '\n\nSPEED: ' +
                  hero.powerstats!.speed +
                  '\n\nDURABILITY: ' +
                  hero.powerstats!.durability +
                  '\n\nPOWER: ' +
                  hero.powerstats!.power +
                  '\n\nCOMBAT: ' +
                  hero.powerstats!.combat,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Work',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10.0,
            ),
            informationHero(
              'OCCUPATION: ' +
                  hero.work!.occupation +
                  '\n\nBASE: ' +
                  hero.work!.base,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Connections',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10.0,
            ),
            informationHero(
              'GROUP AFFILIATION: ' +
                  hero.connections!.groupAffiliation +
                  '\n\nRELATIVES: ' +
                  hero.connections!.relatives,
            )
          ],
        ),
      ),
    );
  }

  Widget informationHero(String text) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: Colors.black38),
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(15.0, 0, 20.0, 0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: ListTile(
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13.0,
            ),
            textAlign: TextAlign.justify,
            textDirection: TextDirection.ltr,
          ),
        ));
  }
}
