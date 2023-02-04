import 'package:flutter/material.dart';

class PokeStats extends StatefulWidget {
  const PokeStats(
      {super.key,
      required this.name,
      required this.image,
      required this.candy,
      required this.spawnChance,
      required this.avgSpawns,
      required this.spawnTime,
      required this.height,
      required this.weight,
      this.candyCount,
      this.egg});
  final String? name;
  final String? image;
  final num? candyCount;
  final String? egg;
  final String? candy;
  final num? spawnChance;
  final num? avgSpawns;
  final String? spawnTime;
  final String? height;
  final String? weight;

  @override
  State<PokeStats> createState() => _PokeStatsState();
}

class _PokeStatsState extends State<PokeStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name.toString()}'s Stat"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 20,
              left: 10.0,
              top: MediaQuery.of(context).size.height * 0.1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.name.toString(),
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: Colors.teal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(children: [
                                const Text(
                                  "Height:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.height.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                              Wrap(children: [
                                const Text("Weight:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                Text(
                                  widget.weight.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                              // Text("Weight: ${widget.weight}"),
                              // Text("Egg: ${widget.egg}"),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(children: [
                                const Text(
                                  "Egg:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.egg.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                              Wrap(children: [
                                const Text(
                                  "Spawn Time:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.spawnTime.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(children: [
                                const Text(
                                  "Spawn Chance:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.spawnChance.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                              Wrap(children: [
                                const Text(
                                  "Avg Spawn:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.avgSpawns.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(children: [
                                const Text(
                                  "Candy:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.candy.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                              Wrap(children: [
                                const Text(
                                  "Candy Count:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.candyCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.teal,
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: widget.image.toString(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.image.toString()))),
                  ),
                )),
          )
        ],
      )),
    );
  }
}
