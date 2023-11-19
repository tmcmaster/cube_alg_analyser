import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:cube_alg_analyser/service/sequence_finder.dart';
import 'package:cube_alg_analyser/store/settings_store.dart';
import 'package:flutter/services.dart';
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
      final sequenceLength = ref.watch(SettingsStore.sequenceLength.value);
      final minCount = ref.watch(SettingsStore.sequenceMinimum.value);
      final sequenceMap = SequenceFinder(minCount: minCount).findAll(
        algorithmList,
        sequenceLengths: [
          sequenceLength,
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
    _loadAlgorithms().then((value) => state = value);
  }

  static Future<List<Algorithm>> _loadAlgorithms() async {
    final jsonListString =
        await rootBundle.loadString('assets/cubing/oll_cases.json');
    return Algorithm.convert.from.jsonMapListString.to
        .modelList(jsonListString);
  }
}
