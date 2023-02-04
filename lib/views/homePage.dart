import 'dart:convert';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:pokeheat/model/pokemodel.dart';
import 'package:pokeheat/views/pokemonStats.dart';

import '../constants/apiurl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokeModel _pokeModel;
  final audioPlayer = AudioPlayer();
  bool _loading = true;
  @override
  void initState() {
    fetchPokes();

    super.initState();
  }

  fetchPokes() async {
    setState(() {
      _loading = true;
    });
    var res = await http.get(
      Uri.parse(pokeListUrl),
    );
    if (res.statusCode == 200) {
      var decodedJson = jsonDecode(res.body);
      // log(res.body.toString());
      _pokeModel = PokeModel.fromJson(decodedJson);
      log(_pokeModel.pokemon!.length.toString());
    } else {
      log(res.statusCode.toString());
    }
    setState(() {
      _loading = false;
    });
  }

  int getint(
    String str,
  ) {
    int newnum = int.parse(str.replaceAll(RegExp(r'[^0-9]'), ''));
    print(newnum);
    return newnum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("PokeHeat"),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
              ),
            )
          : GridView.custom(
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(
                    5 / 7,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  childCount: _pokeModel.pokemon!.length,
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            var url =
                                "https://cdn.pixabay.com/audio/2022/03/20/audio_deb25bdf5b.mp3";
                            await audioPlayer.play(UrlSource(url));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokeStats(
                                          height:
                                              _pokeModel.pokemon![index].height,
                                          image: _pokeModel.pokemon![index].url,
                                          name: _pokeModel.pokemon![index].name,
                                          weight:
                                              _pokeModel.pokemon![index].weight,
                                          candy:
                                              _pokeModel.pokemon![index].candy,
                                          candyCount: _pokeModel
                                              .pokemon![index].candyCount,
                                          egg: _pokeModel.pokemon![index].egg,
                                          spawnChance: _pokeModel
                                              .pokemon![index].spawnChance,
                                          avgSpawns: _pokeModel
                                              .pokemon![index].avgSpawns,
                                          spawnTime: _pokeModel
                                              .pokemon![index].spawnTime,
                                        )));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: _pokeModel.pokemon![index].url
                                        .toString(),
                                    child: Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(_pokeModel
                                                  .pokemon![index].url
                                                  .toString()))),
                                    ),
                                  ),
                                  Text(
                                      _pokeModel.pokemon![index].name
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
              // crossAxisCount: 2,
            ),
    );
  }
}
