// import 'package:cube_alg_analyser/model/last_layer_case.dart';
// import 'package:cube_alg_analyser/service/sequence_finder.dart';
// import 'package:flutter/services.dart';
//
// mixin AlgorithmService {
//   static Future<List<Algorithm>> loadAlgorithms() async {
//     final jsonListString =
//         await rootBundle.loadString('assets/cubing/oll_cases.json');
//     return Algorithm.convert.from.jsonMapListString.to
//         .modelList(jsonListString);
//   }
//
//   static Future<List<Algorithm>> loadAndAnaliseAlgorithms({
//     int minCount = 2,
//   }) async {
//     final algorithmList = await loadAlgorithms();
//     final sequenceMap = SequenceFinder(
//       minCount: minCount,
//     ).findAll(algorithmList, sequenceLengths: [
//       10,
//     ]);
//     print(sequenceMap);
//     final sequenceList = sequenceMap.keys.toList();
//     return algorithmList
//         .map((alg) => alg.copyWith(
//             moves: SequenceFinder.replace(alg.moves, sequenceList)))
//         .toList();
//   }
// }
