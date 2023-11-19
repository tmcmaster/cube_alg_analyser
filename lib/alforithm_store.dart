import 'package:cube_alg_analyser/algorithm_service.dart';
import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:cube_alg_analyser/sequence_finder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlgorithmStore extends StateNotifier<List<Algorithm>> {
  static final algorithms =
      StateNotifierProvider<AlgorithmStore, List<Algorithm>>(
    name: 'AlgorithmStore.algorithms',
    (ref) => AlgorithmStore._(),
  );

  static final annotatedAlgorithms = Provider(
    name: 'AlgorithmStore.annotatedAlgorithms',
    (ref) {
      final algorithmList = ref.watch(algorithms);
      final sequenceMap = SequenceFinder(minCount: 4).findAll(
        algorithmList,
        sequenceLengths: [
          10,
        ],
      );
      final sequenceList = sequenceMap.keys.toList();
      return algorithmList
          .map((alg) => alg.copyWith(
              moves: SequenceFinder.replace(alg.moves, sequenceList)))
          .toList();
    },
  );
  AlgorithmStore._() : super([]) {
    AlgorithmService.loadAlgorithms().then((value) => state = value);
  }
}
