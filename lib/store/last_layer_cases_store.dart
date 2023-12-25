import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:cube_alg_analyser/service/sequence_finder.dart';
import 'package:cube_alg_analyser/store/last_layer_cases_notifier.dart';
import 'package:cube_alg_analyser/store/settings_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin LastLayersCaseStore {
  static final allCases =
      StateNotifierProvider<LastLayerCasesNotifier, List<LastLayerCase>>(
    name: 'LastLayerCaseStore.allLastLayerCases',
    (ref) => LastLayerCasesNotifier(),
  );

  static final annotatedLastLayerCases = Provider<List<LastLayerCase>>(
    name: 'LastLayerCaseStore.annotatedLastLayerCases',
    (ref) {
      final lastLayerCaseList = ref.watch(allCases);
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
}
