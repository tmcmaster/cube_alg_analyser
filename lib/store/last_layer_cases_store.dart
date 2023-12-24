import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:cube_alg_analyser/service/sequence_finder.dart';
import 'package:cube_alg_analyser/store/settings_store.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastLayerCaseStore extends StateNotifier<List<LastLayerCase>> {
  static final lastLayerCases =
      StateNotifierProvider<LastLayerCaseStore, List<LastLayerCase>>(
    name: 'LastLayerCaseStore.lastLayerCases',
    (ref) => LastLayerCaseStore._(),
  );

  static final annotatedLastLayerCases = Provider<List<LastLayerCase>>(
    name: 'LastLayerCaseStore.annotatedLastLayerCases',
    (ref) {
      final lastLayerCaseList = ref.watch(lastLayerCases);
      final sequenceLength = ref.watch(SettingsStore.sequenceLength.value);
      final minCount = ref.watch(SettingsStore.sequenceMinimum.value);
      final sequenceMap = SequenceFinder(minCount: minCount).findAll(
        lastLayerCaseList.map((c) => c.algorithms).expand((a) => a).toList(),
        sequenceLengths: [
          sequenceLength,
        ],
      );
      final sequenceList = sequenceMap.keys.toList();
      return lastLayerCaseList
          .map((lastLayerCase) => lastLayerCase.annotate(sequenceList))
          .toList();
    },
  );
  LastLayerCaseStore._() : super([]) {
    _loadLastLayerCases().then((value) => state = value);
  }

  static Future<List<LastLayerCase>> _loadLastLayerCases() async {
    final jsonListString =
        await rootBundle.loadString('assets/cubing/oll_cases.json');
    return LastLayerCase.convert.from.jsonMapListString.to
        .modelList(jsonListString);
  }
}
