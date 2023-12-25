import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastLayerCasesNotifier extends StateNotifier<List<LastLayerCase>> {
  LastLayerCasesNotifier() : super([]) {
    _loadLastLayerCases().then((value) {
      state = value;
    });
  }

  static Future<List<LastLayerCase>> _loadLastLayerCases() async {
    final jsonListString =
        await rootBundle.loadString('assets/cubing/oll_cases.json');
    return LastLayerCase.convert.from.jsonMapListString.to
        .modelList(jsonListString);
  }
}
