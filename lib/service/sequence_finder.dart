import 'package:cube_alg_analyser/model/algorithm.dart';

class SequenceFinder {
  final int minCount;
  const SequenceFinder({
    required this.minCount,
  });

  Map<String, int> findAll(
    List<Algorithm> algList, {
    List<int> sequenceLengths = const [4, 5, 6, 7, 8],
  }) {
    return sequenceLengths
        .map((s) => find(algList, sequenceLength: s))
        .fold(<String, int>{}, (map, item) => map..addAll(item));
  }

  Map<String, int> find(
    List<Algorithm> algList, {
    int sequenceLength = 4,
  }) {
    final sampleCountMap = <String, int>{};

    for (final alg in algList) {
      final moves = alg.movesString.split(' ');
      for (int i = 0; i < moves.length - sequenceLength; i++) {
        final sequence = moves.sublist(i, i + sequenceLength).join(' ');
        sampleCountMap[sequence] = (sampleCountMap[sequence] ?? 0) + 1;
      }
    }
    return Map.fromEntries(
      sampleCountMap.entries.where((e) => e.value >= minCount),
    );
  }

  static String replace(String moves, List<String> sequenceList) {
    String algMoves = moves;
    for (final s in sequenceList) {
      if (algMoves.contains(s)) {
        algMoves = algMoves.replaceAll(' $s ', ' [ $s ] ');
      }
    }
    return algMoves;
  }
}
