import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sami_project/services/interceptors.dart';
import 'package:sami_project/models/hero_character.dart';

Future<List<HeroCharacter>> searchHero(String text) async {
  // versão mais recente é InterceptedClient.build
  if (text.isEmpty) {
    text = 'a';
  }
  Client client =
      HttpClientWithInterceptor.build(interceptors: [Interceptor()]);
  final url =
      Uri.https('superheroapi.com', '/api/10223141447557067/search/$text');
  final Response response = await client.get(
    url,
    headers: {
      'Content-type': 'application/json',
    },
  );

  debugPrint('Response status: ${response.statusCode}');
  debugPrint('Response body: ${response.body}');

  if (response.statusCode == 200) {
    List responseList = jsonDecode(response.body)['results'];
    return responseList.map((e) => HeroCharacter.fromJson(e)).toList();
  } else {
    return throw Exception('Erro');
  }
}
