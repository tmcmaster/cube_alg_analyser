import 'dart:convert';
import 'dart:io';

import 'package:cube_alg_analyser/cubing_algs.dart';
import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:cube_alg_analyser/sequence_finder.dart';
import 'package:flutter/material.dart';
import 'package:wt_models/wt_models.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OLL Cases'),
        ),
        body: const Column(
          children: [
            Expanded(
              child: CubingAlgs(),
            ),
          ],
        ),
      ),
    ),
  );
}

void testing() {
  final ollAlgList = (json.decode(
    File('./lib/cubing/data/oll_cases.json').readAsStringSync(),
  ) as List<JsonMap>)
      .map((e) => Algorithm.fromJson(e))
      .whereType<Algorithm>()
      .toList();

  final ollIndex = {for (final a in ollAlgList) a.id: a};

  final sequenceMap = const SequenceFinder(
    minCount: 4,
  ).findAll(ollAlgList);

  // print(sequenceMap.entries.map((e) => '${e.key}  :  ${e.value}').join('\n'));

  // print(alg);
  // print(alg.reverse);
  // print(alg.rotate(Rotation.y));
  // print(alg.rotate(Rotation.yPrime));

  final sequenceList = sequenceMap.keys.toList();
  for (final alg in ollAlgList) {
    print(
        '${alg.id} : ${alg.group} : ${SequenceFinder.replace(alg.moves, sequenceList)}');
  }

  print(ollIndex[55]);
}
