import 'package:flutter/material.dart';
import 'package:sami_project/models/hero_character.dart';
import 'package:sami_project/screens/details_hero_page.dart';
import 'package:sami_project/services/hero_api.dart';

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key}) : super(key: key);

  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'SUPERHEROS',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildSearchBox(),
            Expanded(
                child: FutureBuilder<List<HeroCharacter>>(
              future: searchHero(searchController.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<HeroCharacter> data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          data[index].name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        leading: Hero(
                            tag: data[index].id!,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage((data[index].image.url)),
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        hero: data[index],
                                      )));
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ))
          ],
        ));
  }

  buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchHero(searchController.text);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
